PWD=$(shell pwd)
BASENAME=`basename $(PWD)`
.phony: all

all: rsync

rsync:
	rsync -rvC . lenni@leonard.io:www/$(BASENAME) --exclude=Makefile

