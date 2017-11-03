# chainsplit-www

Source code for the website of [chainspl.it](https://chainspl.it) generated with Jekyll.

Development mirror is located at: [https://chainsplit.github.io/chainsplit-www](https://chainsplit.github.io/chainsplit-www).

## Contributing

Content is in [markdown](https://daringfireball.net/projects/markdown/) format with a [YAML Front Matter](https://jekyllrb.com/docs/frontmatter/) header and can be static pages or blog posts.

Pages are found within `_pages` folder.

Posts are found within `_posts` folder.

Posts must be named according to format `YEAR-MONTH-DAY-title.MARKUP`, where `YEAR` is a four (4) digit number, `MONTH` and `DAY` are both two (2) digit numbers, and `MARKUP` is a valid format such as `.md`.

Assets such as images, documents, pdfs, etc should be placed within `assets` folder.

## Developing

Clone this repo locally. Install `ruby >= 2.2.2`, then run commands:

    gem install bundle
    bundle install

For more information, please see [Jekyll Installation Instructions](https://jekyllrb.com/docs/installation/).

Next, serve locally on `http://localhost:4000`, run:

    bundle exec jekyll serve --future

To build locally, run:

    bundle exec jekyll build --future

### Submitting a Pull Request

Fork this repo to your Github account.

Clone that repo to your local machine:

    git clone git@github.com:{your-username}/chainsplit-www.git

Create a new branch to use for development:

    git checkout -b new-feature-1

__Make your changes__

Add, commit, and push:

    git add .
    git commit -m 'commit message'
    git push origin new-feature-1

Back on Github, click `Compare & pull request` button to create the PR.

#### Preview (optional)

If you would like to set up a preview through your fork on Github Pages, run:

    chmod +x deploy-gh-pages.sh
    ./deploy-gh-pages.sh

In Github repo => Settings => Options (tab) => Github Pages: use `gh-pages` branch

Preview is located at: https://{your-username}.github.io/chainsplit-www/

## Testing

To test, run:

    bundle exec jekyll build --future --drafts --unpublished && bundle exec htmlproofer ./_site

## Deploying

First, install `ruby`, `bundler`, and clone this repo.

Then, to deploy or update production code, run:

    git pull
    bundle install
    bundle exec jekyll build

Webserver must be configured to serve out of `_site` folder where Jekyll builds to.

## License

Code is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
