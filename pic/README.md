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
$ ./bedwyr pi_modal.def
[Warning] Now including "pi_modal.def".
[Warning] Now including "pi.def".
[Warning] Now including "../basic.def".
...
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

?= ABCx = a\b\c\ out a b (in c x\z) /\ CxAB = a\b\c\ in c x\out a b z /\
   ABAx = a\b\ out a b (in a x\z)   /\ AxAB = a\b\ in a x\out a b z   /\
   Q = a\b\c\ plus (taup (plus (ABCx a b c) (CxAB a b c)))
                   (taup (plus (plus (ABAx a b) (AxAB a b)) (taup z))) /\
   P = a\b\c\ plus (taup (par (out a b z) (in c x\z))) (Q a b c) /\
   forall a b c, bisim (P a b c) (Q a b c).
No solution.
?= ABCx = a\b\c\ out a b (in c x\z) /\ CxAB = a\b\c\ in c x\out a b z /\
   ABAx = a\b\ out a b (in a x\z)   /\ AxAB = a\b\ in a x\out a b z   /\
   Q = a\b\c\ plus (taup (plus (ABCx a b c) (CxAB a b c)))
                   (taup (plus (plus (ABAx a b) (AxAB a b)) (taup z))) /\
   P = a\b\c\ plus (taup (par (out a b z) (in c x\z))) (Q a b c) /\
   forall a b c, sat (Q a b c) (boxAct tau (disj (diaAct tau tt) (boxAct tau ff))).
Found a solution:
 P = x1\x2\x3\
     plus (taup (par (out x1 x2 z) (in x3 (x4\ z))))
      (plus
        (taup
          (plus (out x1 x2 (in x3 (x4\ z))) (in x3 (x4\ out x1 x2 z))))
        (taup
          (plus
            (plus (out x1 x2 (in x1 (x4\ z))) (in x1 (x4\ out x1 x2 z)))
            (taup z))))
 Q = x1\x2\x3\
     plus
      (taup
        (plus (out x1 x2 (in x3 (x4\ z))) (in x3 (x4\ out x1 x2 z))))
      (taup
        (plus
          (plus (out x1 x2 (in x1 (x4\ z))) (in x1 (x4\ out x1 x2 z)))
          (taup z)))
 AxAB = x1\x2\ in x1 (x3\ out x1 x2 z)
 ABAx = x1\x2\ out x1 x2 (in x1 (x3\ z))
 CxAB = x1\x2\x3\ in x3 (x4\ out x1 x2 z)
 ABCx = x1\x2\x3\ out x1 x2 (in x3 (x4\ z))
More [y] ? 
No more solutions (found 1).
?= ABCx = a\b\c\ out a b (in c x\z) /\ CxAB = a\b\c\ in c x\out a b z /\
   ABAx = a\b\ out a b (in a x\z)   /\ AxAB = a\b\ in a x\out a b z   /\
   Q = a\b\c\ plus (taup (plus (ABCx a b c) (CxAB a b c)))
                   (taup (plus (plus (ABAx a b) (AxAB a b)) (taup z))) /\
   P = a\b\c\ plus (taup (par (out a b z) (in c x\z))) (Q a b c) /\
   forall a b c, sat (P a b c) (boxAct tau (disj (diaAct tau tt) (boxAct tau ff))).
No solution.
```
Examples in the OM semantics section.
```
?= T = taup z /\ TT = taup T /\
   P = (x\ y\ plus (match x y T) Q) /\ Q = plus TT T /\
   forall x y, bisim (P x y) Q. % ([x=y].t + t.t + t) ~ (t.t + t)

Found a solution:
 Q = plus (taup (taup z)) (taup z)
 P = x1\x2\ plus (match x1 x2 (taup z)) (plus (taup (taup z)) (taup z))
 TT = taup (taup z)
 T = taup z
More [y] ? 
No more solutions (found 1).

?= T = taup z /\ TT = taup T /\
   P = (x\ y\ plus (taup (match x y T)) Q) /\ Q = plus TT T /\
   forall x y, bisim (P x y) Q. % (t.[x=y].t + t.t + t) ~ (t.t + t)
No solution.
?= 
```
