N=3
define loopopt
	for ((i=0; i<$(1); i++)); do j=$$(($$i+1)); cd $$j && vagrant $(2); cd - ; done
endef
