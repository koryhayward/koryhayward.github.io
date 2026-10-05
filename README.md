# koryhayward.net

The source for [koryhayward.net](https://koryhayward.net), my personal website: how to reach me, my PGP key, the books I've read, and the articles I've read and chosen to share.

## Pages

| Page | File | What it is |
|---|---|---|
| [home](https://koryhayward.net/) | `index.md` | Contact links and my PGP key (also at [`/pgp.asc`](https://koryhayward.net/pgp.asc)) |
| [bookshelf](https://koryhayward.net/bookshelf/) | `bookshelf.md` | Books I've read, by year |
| [readings](https://koryhayward.net/readings/) | `readings.md` | Articles I've read and chosen to share, newest first, a page at a time |
| [readings feed](https://koryhayward.net/readings.xml) | `readings.xml` | Atom feed of recent readings |
| not found | `404.md` | The 404 page |

## How it's built

- [Jekyll](https://jekyllrb.com/) 4, built and deployed to GitHub Pages by [`.github/workflows/pages.yml`](.github/workflows/pages.yml) on every push to `main`.
- One layout, [`_layouts/default.html`](_layouts/default.html), with all CSS inline (light and dark).
- No JavaScript, analytics, web fonts, or third-party requests. A strict Content Security Policy and a `no-referrer` policy keep it that way.
- [`_plugins/readings_pagination.rb`](_plugins/readings_pagination.rb) splits the readings into pages (`readings_per_page` in `_config.yml`), with no extra gems.
- GitHub Actions are pinned to commit SHAs, and Dependabot keeps the Actions and the gems up to date.

## Where the readings come from

[`_data/readings.yml`](_data/readings.yml) is generated from my own notes by a separate, private tool, and each change is committed after I review it. Please don't edit it by hand: the next update would overwrite it. Only items I mark for publishing appear, and only their details (title, link, authors, publication, dates, and tags), never article text or my notes.

## Running it locally

You need Ruby and Bundler. The Ruby version the deploy uses is set in [`.github/workflows/pages.yml`](.github/workflows/pages.yml).

```
bundle install
bundle exec jekyll serve
```

Then open http://localhost:4000.

## Contact

Email [kory@koryhayward.net](mailto:kory@koryhayward.net). My PGP key is on the [home page](https://koryhayward.net/) and at [`/pgp.asc`](https://koryhayward.net/pgp.asc).

## License

The site's content is © Kory Hayward, licensed under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/). The design is inspired by [Sky Marchini](https://skymarchini.net/)'s site, used under the same license.
