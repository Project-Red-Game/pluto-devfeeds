# Planet Pluto for Unvanquished development feeds

Welcome to Planet Pluto. (Auto-)build your own (static) planet news site from Unvanquished development feeds.


## Step 0: Clone

To get started:

Use git and clone this repo e.g.

```sh
git clone https://github.com/Unvanquished/pluto-devfeeds.git
```


## Step 1: Install the Planet Pluto Machinery / Tool

To install the planet pluto tools and libraries use
ruby's bundler e.g.


```sh
cd pluto-devfeeds
make prepare
```

Ruby's bundler will use the [`Gemfile`](Gemfile) to
know what you want to install and will
generate a `Gemfile.lock` that will list all libraries
with all dependencies and versions locked down.


## Step 2: Build the Planet

Try:

```sh
make check
```
to check up on your pluto installation. It must print the pluto help.

Now build the sample starter planet. Try:

```
make
```

This will

1. fetch all feeds listed in [`planet.ini`](planet.ini) and

2. store all entries in a local single-file SQLite database,
that is, `planet.db` in your working folder and

3. generate a planet web page, that is, `index.html` in your `build/` folder
using the `devfeeds` template pack in the [`planet-devfeeds`](planet-devfeeds) folder
using all feed entries from the local database. It also builds custom css using sass.

Open up `build/index.html` in your web browser
to see your planet web page. Voila!


## What's Next?

Now change the planet configuration in [`planet.ini`](planet.ini) to fit your needs.
Change the title and add your web feeds.

Look & feel. Change the starter templates in [`planet-devfeeds`](planet-devfeeds)
to your liking.

Happy planet!


## Questions 'n' Answers

**Q: How can I update the web feeds and (re)build the planet page(s)?**

A: Rerun the command:

```sh
make
```

That's it ;-) The pluto feed fetcher will use conditional HTTP get requests and content hash checks for web feeds etc.


**Q: For testing how can I (re)build the planet pages(s) WITHOUT fetching the web feeds?**

A: Use the build target:

```sh
make build
```


**Q: How can I update the web feeds WITHOUT (re)building the planet page(s)?**

A: Use the update target:

```sh
make update
```


## References

- [Pluto Planet Guide (Book Edition)](https://feedreader.github.io) - Official Documentation
- [Pluto Planet Template Packs/Themes](http://planet-templates.github.io) - Blank, Digest, Hacker, Paper, Forty, News, Top 'n' More
- [Talk Notes - New Horizons - Build Your Own (Static) Planet News Site w/ Pluto (and Ruby)](https://github.com/geraldb/talks/blob/master/planet.md)


## License

![CC0](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `pluto.starter` scripts and templates are dedicated to the public domain. To be kind, the `pluto-devfeeds` deviation is dedicated to public domain too. Use it as you please with no restrictions whatsoever.


## Questions? Comments?

For Pluto related questions, send them along to the [wwwmake Forum/Mailing List](http://groups.google.com/group/wwwmake), for Unvanquished related questions, send them along the [Unvanquished forum](https://forums.unvanquished.net/). Thanks!
