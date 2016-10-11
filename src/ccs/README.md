First download and bulild bedwyr and make a symbolic link to the current directory.

```
$ ./bedwyr --version
Bedwyr prover 1.4-beta13, Copyright (C) 2005-2015 Slimmer project.
This is free software, distributed under the GNU General Public License
version 2.  There is NO WARRANTY, not even SOUNDNESS nor COMPLETENESS.
Rev. 1080 (built with OCaml  on the 2016-09-29).
Features (+/-):
Plugins (+/-):
```

Then, run the `make` (or `gmake`) command to invoke GNU Make.
Runnning make will generate `query*.sh` from `query*.prefix` and
also run the shell script, which invokes bedwyer several times.
The result will be saved in `query*.log` (raw redirected output) and
`query*.out` (result lines only) files.
See the content of the `Makefile` for further details.

```
$ cat query4.prefix 
NAMES="a,b,c"
P="(plus (inp a (inp b null)) (inp a (plus (inp b null) (inp c null))))"
Q="(plus (inp a (plus (inp b null) (inp c null))) (inp a (inp c null)))"
$ cat query4.out 
 P = plus (inp a (inp b null)) (inp a (plus (inp b null) (inp c null)))
 Q = plus (inp a (plus (inp b null) (inp c null))) (inp a (inp c null))
 F = dia (dn a) (conj (box (dn c) ff) (dia (dn b) tt))
```

In case is there is no distinguishing formula (because the two process are bisimilar)
the output for the formula is `F = F`.

```
$ cat query0.prefix 
NAMES="a"
P="null"
Q="null"
$ cat query0.out 
 P = null
 Q = null
 F = F
```

To add more examples you only need to `query*.prefix` file and run make.


TODO:
maybe add a parser program to generate `query*.prefix` file from concrete syntax and
also format the output print the concrete syntax instead of bedwyr terms.
