# Supplementary materials for "A Logical Characterisation of Open Bisimulation using "

## Abella specifications and proofs
 * `finite-pic.sig` and `finite-pic.mod` : lambda-Prolog specification of the pi-calculus operational semantics
 * `finite-pic.thm` : definitions and proofs for open bisimulation and its characterizing modal logic OM
 * `finite-pic.txt` and `finite-pic.html` : output file generated running Abella on `finite-pic.thm`
 * `finite-pic_subgoals_off.txt` and `finite-pic_subgoals_off.html` : output file generated running Abella on `finite-pic_subgoals_off.thm`
The html outputs are not rendered online via githup webpage, so either make a clone of this repository or download the files to view them with your browser. The sig/mod/thm files were adopted from Abella and modified for the purpose of mechanizing the proof for soundness and completeness of OM with regards to open bisimulation. Soundness (open bisimulation is OM-equivalence) is fully mechanized but complenetness (OM-equivalence is open bisimulation) is only partially meachized; the missing link is proved in the accompanying paper. The proof script has been developed using Abella 2.0.5-dev version, more specifically, https://github.com/abella-prover/abella/tree/120ac7f2472d9f15c7bd8aa3834ab8e96b232121

## Bedwyr specifications and examples
The Bedwyr scripts were adopted from the examples distributed with Bedwyr and modified.  They contain more things than what is described in the paper because it is from Tui and Miller's ACM TOCL 2010 paper, and also some of my unfinished attempts for distinguishing formula generation (there are some technical issues realted to Bedwyr's features). So, the pi-calculus and the modal logic specification here is basically a superset of the Abella version above. It is not ideally cleaned up soucre code as a supplimentaril material, but for the purpose of demaonstrating that there is an existing tool that can automaticlally decide the queries on the bisimulation and satisfaction judgements, it works. The examples were tested using Bedwyr version 1.4-beta13 Rev. 1080.

Files being used:
  * `../basics.def` : a library of some basic definitions (also used in the `../ccs` directory)
  * `pi.thm` : pi-calculus operational semantics 
  * `pi_modal.def` : modal logic

Example demonstration:
```
[Warning] Now including "pi_modal.def".
[Warning] Now including "pi.def".
[Warning] Now including
  "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def".
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 75, byte 7: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 82, byte 5: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 86, byte 9: 
  F is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 90, byte 5: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 97, byte 9: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 107, byte 10: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 112, byte 10: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 142, byte 8: 
  P is a singleton variable.
[Warning] In file "/home/kyagrd/bitbkt/atiu-ntu/modal-logic/src/basic.def", at line 146, byte 12: 
  P is a singleton variable.
Bedwyr 1.4-beta13 (revision 1080) welcomes you.

For a little help, type "#help."
```
Examples in the introduction section.
```
?= forall a b c, sat (par (out a b z) (in c x\ z)) (disj (diaAct tau tt) (boxAct tau ff)).
No solution.
?= forall a b c, sat (par (out a b z) (in c x\ z)) (diaAct tau tt).
No solution.
?= forall a b c, sat (par (out a b z) (in c x\ z)) (boxAct tau ff).
No solution.
```
Examples in the OM semantics section.
