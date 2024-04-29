SHELL=/bin/bash
.DEFAULT_GOAL=_help

# NOTE: must put a <TAB> character and two pound "\t##" to show up in this list.  Keep it brief! IGNORE_ME
.PHONY: _help
_help:
	@printf "\nUsage: make <command>, valid commands:\n\n"
	@grep "##" $(MAKEFILE_LIST) | grep -v ^# | grep -v IGNORE_ME | sed -e 's/##//' | column -t -s $$'\t'



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# List
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: list
list:	## List problems by language
	ls -X problems/



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Extras
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: check-vars
check-vars:	## display all computed vars (won't show passed in)
	$(foreach v, $(.VARIABLES), $(if $(filter file, $(origin $(v))), $(info $(v)=$($(v)))))


.PHONY: cloc
cloc:	## Count lines of code
	cloc --by-file-by-lang HEAD
