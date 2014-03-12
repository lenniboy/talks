PWD=$(shell pwd)
BASENAME=`basename $(PWD)`
CSS_URL=//netdna.bootstrapcdn.com/bootswatch/3.1.1/lumen/bootstrap.min.css

.phony: all

all: pandoc rsync

rsync:
	rsync -rvC . lenni@leonard.io:www/$(BASENAME) --exclude=Makefile

pandoc:
	pandoc README.md -f markdown -t html5 -s -c $(CSS_URL) -o index.html
	sed -i 's/<body>/<body class="container">/g' index.html
