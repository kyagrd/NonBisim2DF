SHELLSCRIPTS := $(patsubst %.prefix,%.sh,$(wildcard query*.prefix))

.PHONEY: all clean

all: $(SHELLSCRIPTS)

clean:
	- rm tbl_query*.def
	- rm query*.def
	- rm query*.sh
	- rm query*.log
	- rm query*.out

%.sh: %.prefix query_sh_template_suffix moccs.def moccs_disform.def
	cat $< query_sh_template_suffix > $@
	chmod +x $@
	./$@
