#!/usr/bin/env bash
# builds to <username>.github.io/chainsplit-www

buildtime=`date +'%s'`
branchname=`git rev-parse --abbrev-ref HEAD`
baseurl='\/chainsplit-www' # regexp format
remote='origin'

# prints usage instructions
printUsage () {
  echo -e "\nUsage: ./deploy-gh-pages.sh [options]\n"
  echo -e "  -h, --help: display usage"
  echo -e "  -b, --baseurl: change _config.yml baseurl from default '/chainsplit-www'"
  echo -e "  -r, --remote: change git remote from default 'origin'\n"
}

# update settings
# $1: option
# $2: value
processOption () {
  case $1 in
    -r|--remote) remote="$2";;
    -b|--baseurl)
      # regexp format
      if [[ "$2" =~ ^\/ ]]; then
        baseurl="\\$2"
      elif [ "$2" == "" ]; then
        baseurl=""
      else
        baseurl="\\/$2"
      fi
      ;;
  esac
}

# create gh-pages branch
createGhPagesBranch () {
  git checkout --orphan gh-pages
  git rm --cached -r .
  git add .gitignore
  git clean -f -d
  git commit -m 'initial gh-pages branch'
}

# builds Jekyll w/ options
buildJekyll () {
  # replace baseurl in _config.yml
  sed -e "s/baseurl: \"\"/baseurl: \"$baseurl\"/" _config.yml > "/tmp/_config.yml-$buildtime"

  mv -f "/tmp/_config.yml-$buildtime" _config.yml

  # include versioninfo
  commitID=`git log --format="%H" -n 1`
  echo -e "Branch: $branchname\nCommit: $commitID" > versioninfo.txt

  # build, then forget build modifications
  bundle exec jekyll build
  rm versioninfo.txt
  git reset --hard
}

# MAIN PROCESS

# print usage for -h or --help
if [ "$1" == "-h" -o "$1" == "--help" ]; then
  printUsage; exit 0
fi

# parse options (refer to printUsage)
args=( "$@" )
for i in "${!args[@]}"; do
  if [[ ${args[$i]} =~ ^-- ]] && [[ ${args[$i]} =~ = ]]; then
    # --option=value
    processOption "${args[$i]%=*}" "${args[$i]#*=}"
  elif [[ ${args[$i]} =~ ^- ]]; then
    # -o value
    x=$((i+1))
    processOption "${args[$i]}" "${args[$x]}"
  fi
done

# check for pending changes
if [ "$(git status --porcelain | sed -n '/[:alnum:]*/p')" != "" ]; then
  echo -e "Error: Please commit all changes before deploying. Exiting.\n"
  exit 1
fi

buildJekyll

# copy build to tmp
mkdir /tmp/_site_$buildtime
cp -r _site/* /tmp/_site_$buildtime/

# checkout or create gh-pages branch
if [ "$(git checkout gh-pages 2>&1 | sed -n '/^error\: pathspec/p')" == "" ]; then
  git checkout gh-pages
else
  echo -e "Branch 'gh-pages' not found. Creating...\n"
  createGhPagesBranch
fi

# remove old build; copy new
git ls-files -z | xargs -0 rm -f
git checkout .gitignore
cp -r /tmp/_site_$buildtime/* $PWD/

# add, commit, deploy branch (only if changes)
if [ "$(git status | sed -n '/^nothing to commit/p')" == "" ]; then
  git add .
  git commit -m 'new gh-pages build'
  git push -f "$remote" gh-pages
fi

# cleanup
git checkout "$branchname"
rm -r /tmp/_site_$buildtime

echo -e "\ndeploy-gh-pages success.\n"
