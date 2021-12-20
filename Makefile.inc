N=3
define loopopt
	for ((i=0; i<$(1); i++)); do j=$$(($$i+1)); cd $$j && vagrant $@; cd - ; done
endef
