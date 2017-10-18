.DEFAULT_GOAL := all

.PHONY: all build css check prepare update rsync

prepare:
	bundle install --path vendor/bundle

check:
	bundle exec pluto help

update:
	bundle exec pluto update planet.ini

css:
	# it looks like pluto does not call sass itself
	mkdir -p build/css
	sass planet-devfeeds/css/page.scss build/css/page.css
	sass planet-devfeeds/css/news.scss build/css/news.css
	sass planet-devfeeds/css/github.scss build/css/github.css

build: css
	# it automatically finds planet-devfeeds/news.txt
	bundle exec pluto merge -t news -o build planet.ini
	# rewrite relative GitHub url (they must not do that, it's wrong to do that in a feed)
	sed -e 's#href="/\([^/]\)#href="https://github.com/\1#g' -i build/news.html
	# file was rendered to a temporary file because they can be some race condition
	# between pluto rendering this page and people querying the page from server
	# hence we copy the page when it's ready, which is fast (uses CoW if possible)
	cp -a --reflink=auto build/news.html build/index.html

all: update build
