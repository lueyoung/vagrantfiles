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

.PHONY: all up clean destroy suspend stop
