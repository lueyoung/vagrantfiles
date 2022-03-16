include Makefile.inc

all:
	echo Hello world

up:
	$(call loopopt, $N, $@)

clean: destroy

destroy:
	$(call loopopt, $N, $@ -f)

suspend:
	$(call loopopt, $N, $@)

stop: suspend

status:
	$(call loopopt, $N, $@)

reload:
	$(call loopopt, $N, $@)

config:
	./batch-info.sh
	./mk-ip-mac.py
	./batch-ip-mac.sh
	./batch-config.sh

.PHONY: all up clean destroy suspend stop config
