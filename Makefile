#!/usr/bin/env make -f
#
# Makefile
#

# Debug mode. `Q= make` permit to debug.
Q ?= @

#####
## START
###

changelog:
	$Qgit-chglog -o CHANGELOG.md

