SHELLSCRIPTS := $(patsubst %.prefix,%.sh,$(wildcard query*.prefix))

.PHONEY: all clean

all: $(SHELLSCRIPTS)

clean:
	- rm $(SHELLSCRIPTS)
	- rm tbl_query*.def
	- rm query*.def

%.sh: %.prefix query_sh_template_suffix moccs.def moccs_disform.def
	cat $< query_sh_template_suffix > $@
	chmod +x $@
	./$@
