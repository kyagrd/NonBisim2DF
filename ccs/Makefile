PREFIXES:=$(patsubst %.ccs,%.prefix,$(wildcard query*.ccs))
SHELLSCRIPTS:=$(patsubst %.ccs,%.sh,$(wildcard query*.ccs))
LOGS:=$(patsubst %.ccs,%.log,$(wildcard query*.ccs))

.PHONEY: all clean

all: parseCCS $(PREFIXES) $(SHELLSCRIPTS) $(LOGS)

clean:
	- rm tbl_query*.def
	- rm query*.def
	- rm query*.sh
	- rm query*.log

%.log: %.sh
	sh $<

%.sh: %.prefix query_sh_template_suffix moccs.def moccs_disform.def
	cat $< query_sh_template_suffix > $@
	chmod +x $@

%.prefix: %.ccs
	echo `(sed -n 1p $< | ./parseCCS | sed -n 6p; sed -n 2p $< | ./parseCCS | sed -n 6p) | grep -o '"[^"]*"' | sed 's/"//g' | sort | uniq` | sed 's/ /,/g;s/^$$/a/;s/^/NAMES="/;s/$$/"/' > $@
	sed -n 1p $< | ./parseCCS | sed -n 6p | tr '[:upper:]' '[:lower:]' | sed 's/(lident "//g;s/")//g;s/^/P="(/;s/$$/)"/;s/[^a-z0-9_]new[ ][ ]*[^ ][^ ]*/&\\/g' >> $@
	sed -n 2p $< | ./parseCCS | sed -n 6p | tr '[:upper:]' '[:lower:]' | sed 's/(lident "//g;s/")//g;s/^/Q="(/;s/$$/)"/;s/[^a-z0-9_]new[ ][ ]*[^ ][^ ]*/&\\/g' >> $@

parseCCS: TestCCS.hs LexCCS.hs ParCCS.hs
	ghc -o $@ --make $<

# TestCCS.hs LexCCS.x ParCCS.y: CCS.bnfc
# 	bnfc --haskell $<
# 
# LexCCS.hs: LexCCS.x
# 	alex $<
# 
# ParCCS.hs: ParCCS.y
# 	happy $<
