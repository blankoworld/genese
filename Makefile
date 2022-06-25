#!/usr/bin/env make -f
#
# Makefile
#

# Mode déboggage. `Q= make` permet de débogguer.
Q ?= @

#####
## DÉBUT
###

changelog:
	$Qgit-chglog -o CHANGELOG.md

