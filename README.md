# chainsplit-www

Source code for the website of [chainspl.it](http://chainspl.it) generated with Jekyll.

Development mirror is located at [dev.chainspl.it](http://dev.chainspl.it).

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

## Testing

To test, run:

    bundle exec jekyll build --future --drafts --unpublished && bundle exec htmlproofer ./_site

## Deploying

First, install `ruby`, `bundler`, clone this repo, execute `bundle install`.

Then, to deploy or update production code, run:

    git pull
    bundle exec jekyll build

Webserver must be configured to serve out of `_site` folder where Jekyll builds to.

## License

Code is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
