-include *.mk



SUBDIRS := $(wildcard */.)
SUBDIRS := $(SUBDIRS:%/.=%)



.PHONY: latest $(SUBDIRS)


latest:
	${MAKE} -C stable TAG=latest

$(SUBDIRS):
	${MAKE} -C ${MAKECMDGOALS}
