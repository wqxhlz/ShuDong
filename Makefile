
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	../all/sbin/nginx -t

	kill -USR2 `cat ../all/logs/nginx.pid`
	sleep 1
	test -f ../all/logs/nginx.pid.oldbin

	kill -QUIT `cat ../all/logs/nginx.pid.oldbin`
