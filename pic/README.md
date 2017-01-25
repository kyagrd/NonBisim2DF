# Supplementary materials for "A Logical Characterisation of Open Bisimulation using an Intuitionistic Modal Logic"

Note: Our [Arxiv version](https://arxiv.org/abs/1701.05324) paper is a revised version of the draft submistted to LICS 2017. The main differrence is that we noticed that the modalities we adopted from the prior work of Tui and Miller was not the accurrate encoding. We thought that Tiu and Miller's 2010 paper stated the completeness theorem about the open bisimulation and universal quantification of Parrow, Walker, and Milner's LM encoding was right but only the proof was incomplete. But it turns out the completeness theorem itself was not stated correctly because it uses late input modalities. By working out the examples, it turns out "basic box input modality" and "late diamond modality" should be used for our logic characterizing open bisimulation. This is a very interesting discovery becuase the diamond input and box input modalities for the logic characterizing open bisimulation are not logically dual in Abella/Bedwyr encoding. This choice of the modality encoding has been correctly addressed in the Arxive version. Additionally, the Arxiv version also have a few minor errata in the examples:
  * The inductive example of Section IV-A-b), `P = tau.(out a a` TODO
  * The last example in p10 should be
      * `P = tau.(tau.tau + tau.[x=y]tau) + tau.(tau.tau + tau.[x=y][w=z]tau)`
      * `Q = tau.(tau.tau + tau.[x=y][w=z]tau)`
    In addition, the comment that `P` and `Q` are equivalent to `tau.(tau + tau.tau)` assuming excuded middle is not true; this comment was intended for even more elaborate example. So, you can disregard the last pargraph of Section IV on p11.
  
## Abella specifications and proofs
 * `finite-pic.sig` and `finite-pic.mod` : lambda-Prolog specification of the pi-calculus operational semantics
 * `finite-pic.thm` : definitions and proofs for open bisimulation and its characterizing modal logic OM
 * `finite-pic.txt`, `finite-pic.html` : output file generated running Abella on `finite-pic.thm`
 * `finite-pic_subgoals_off.txt`, `finite-pic_subgoals_off.html` : output files without enummerating all the subgoals (shorter version than above). 

The html outputs are not rendered online via githup webpage, so either make a clone of this repository or download the files to view them with your browser. The sig/mod/thm files were adopted from Abella and modified for the purpose of mechanizing the proof for soundness and completeness of OM with regards to open bisimulation. Soundness (open bisimulation is OM-equivalence) is fully mechanized but complenetness (OM-equivalence is open bisimulation) is only partially meachized; the missing link is proved in the accompanying paper. The proof script has been developed using Abella 2.0.5-dev version, more specifically, https://github.com/abella-prover/abella/tree/120ac7f2472d9f15c7bd8aa3834ab8e96b232121

## Bedwyr specifications and examples
The Bedwyr scripts were adopted from the examples distributed with Bedwyr and modified.  They contain more things than what is described in the paper because it is from Tui and Miller's ACM TOCL 2010 paper, and also some of my unfinished attempts for distinguishing formula generation (there are some technical issues realted to Bedwyr's features). So, the pi-calculus and the modal logic specification here is basically a superset of the Abella version above. It is not ideally cleaned up soucre code as a supplimentaril material, but for the purpose of demaonstrating that there is anT = taup z /\ P = x\y\u\v\ plus (taup (plus T (taup (match x y T)))) (Q x y u v) /\ Q = x\y\u\v\ taup (plus T (taup (match x y (match u v T)))) /\ forall x y u v, bisim (P x y u v) (Q x y u v).
No solution.
 existing tool that can automaticlally decide the queries of bisimulation and some of the satisfaction judgements, it serves the purpose. The examples were tested using Bedwyr version 1.4-beta13 Rev. 1080.

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Examples in the introduction section.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Examples in the OM semantics section.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?= forall x y, sat (match x y (taup z)) (boxAct tau (diaMatch x y tt)).
Found a solution.
More [y] ? 
No more solutions (found 1).

?= forall x y, sat (taup z) (boxAct tau (diaMatch x y tt)).
No solution.

?= forall x y, sat z (boxAct tau (diaMatch x y tt)).
Found a solution.
More [y] ? 
No more solutions (found 1).

?= forall x y, sat z (boxMatch x y (diaAct tau tt)).
No solution.

?= forall x y, sat (taup z) (boxMatch x y (diaAct tau tt)).
Found a solution.
More [y] ? 
No more solutions (found 1).

?= forall x y, bisim (match x y (taup z)) z.
No solution.

?= forall x y, bisim (match x y (taup z)) (taup z).
No solution.

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
   forall x y, bisim (P x y) Q. % (t.[x=y].t + t.t + t) /~ (t.t + t)
No solution.

?= T = taup z /\ TT = taup T /\
   P = (x\ y\ plus (taup (match x y T)) Q) /\ Q = plus TT T /\
   forall x y, sat (P x y) (diaAct tau (conj (boxAct tau (diaMatch x y tt)) (boxMatch x y (diaAct tau tt)))).
Found a solution:
 Q = plus (taup (taup z)) (taup z)
 P = x1\x2\
     plus (taup (match x1 x2 (taup z))) (plus (taup (taup z)) (taup z))
 TT = taup (taup z)
 T = taup z
More [y] ? 
No more solutions (found 1).

?= T = taup z /\ TT = taup T /\
   P = (x\ y\ plus (taup (match x y T)) Q) /\ Q = plus TT T /\
   sat Q (diaAct tau (conj (boxAct tau (diaMatch x y tt)) (boxMatch x y (diaAct tau tt)))).
No solution.

?= T = taup z /\ TT = taup T /\
   P = (x\ y\ plus (taup (match x y T)) Q) /\ Q = plus TT T /\ 
   forall x y, sat Q (boxAct tau (disj (diaAct tau tt) (boxAct tau ff))).

Found a solution:
 Q = plus (taup (taup z)) (taup z)
 P = x1\x2\
     plus (taup (match x1 x2 (taup z))) (plus (taup (taup z)) (taup z))
 TT = taup (taup z)
 T = taup z
More [y] ? 
No more solutions (found 1).

?= T = taup z /\ TT = taup T /\
   P = (x\ y\ plus (taup (match x y T)) Q) /\ Q = plus TT T /\ 
   forall x y, sat (P x y) (boxAct tau (disj (diaAct tau tt) (boxAct tau ff))).
No solution.

?= P = a\ nu x\ out a x (in a y\ taup z) /\
   Q = a\ nu x\ out a x (in a y\ match x y (taup z)) /\
   forall a, bisim (P a) (Q a).
No solution.


?= P = a\ nu x\ out a x (in a y\ taup z) /\
   Q = a\ nu x\ out a x (in a y\ match x y (taup z)) /\
   forall a, sat (P a) (diaOut a x\ diaInL a y\ diaAct tau tt).

Found a solution:
 Q = x1\ nu (x2\ out x1 x2 (in x1 (x3\ match x2 x3 (taup z))))
 P = x1\ nu (x2\ out x1 x2 (in x1 (x3\ taup z)))
More [y] ? 
No more solutions (found 1).

?= P = a\ nu x\ out a x (in a y\ taup z) /\
   Q = a\ nu x\ out a x (in a y\ match x y (taup z)) /\
   forall a, sat (Q a) (diaOut a x\ diaInL a y\ diaAct tau tt).
No solution.


?= P = a\ nu x\ out a x (in a y\ taup z) /\
   Q = a\ nu x\ out a x (in a y\ match x y (taup z)) /\
   forall a, sat (P a) (boxOut a x\ boxIn a y\ boxAct tau (diaMatch x y tt)).
No solution.

?= P = a\ nu x\ out a x (in a y\ taup z) /\
   Q = a\ nu x\ out a x (in a y\ match x y (taup z)) /\
   forall a, sat (Q a) (boxOut a x\ boxIn a y\ boxAct tau (diaMatch x y tt)).
Found a solution:
 Q = x1\ nu (x2\ out x1 x2 (in x1 (x3\ match x2 x3 (taup z))))
 P = x1\ nu (x2\ out x1 x2 (in x1 (x3\ taup z)))
More [y] ?  
No more solutions (found 1).


?= P = a\ nu x\ out a x z /\ Q = a\ nu x\ out a x (match x a (taup z)) /\
   forall a, bisim (P a) (Q a).
Found a solution:
 Q = x1\ nu (x2\ out x1 x2 (match x2 x1 (taup z)))
 P = x1\ nu (x2\ out x1 x2 z)
More [y] ? 
No more solutions (found 1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Examples in the completeness section.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?= forall x y, sat (plus (match x y (taup (taup z))) (taup z)) (boxAct tau (boxAct tau (diaMatch x y tt))).
Found a solution.
More [y] ? 
No more solutions (found 1).

?= forall x y, sat (plus (taup (taup z)) (taup z)) (boxAct tau (boxAct tau (diaMatch x y tt))).
No solution.

?= forall x y, sat (plus (match x y (taup (taup z))) (taup z)) (boxAct tau (disj (boxAct tau ff) (diaMatch x y tt))).
Found a solution.
More [y] ? 
No more solutions (found 1).

?= forall x y, sat (plus (taup (taup z)) (taup z)) (boxAct tau (disj (boxAct tau ff) (diaMatch x y tt))).
No solution.


?= R = a\b\ taup (plus (out a a z) (out b b z)) /\ S = a\b\ taup (out a a z) /\
   P = a\b\x\y\ plus (R a b) (match x y (S a b)) /\ Q = a\b\ plus (R a b) (S a b) /\
   forall a b x y, bisim (P a b x y) (Q a b).
No solution.

?= R = a\b\ taup (plus (out a a z) (out b b z)) /\ S = a\b\ taup (out a a z) /\
   P = a\b\x\y\ plus (R a b) (match x y (S a b)) /\ Q = a\b\ plus (R a b) (S a b) /\
   forall a b x y, sat (P a b x y) (boxAct tau (disj (diaAct (up b b) tt) (diaMatch x y tt))).
Found a solution:
 Q = x1\x2\
     plus (taup (plus (out x1 x1 z) (out x2 x2 z)))
      (taup (out x1 x1 z))
 P = x1\x2\x3\x4\
     plus (taup (plus (out x1 x1 z) (out x2 x2 z)))
      (match x3 x4 (taup (out x1 x1 z)))
 S = x1\x2\ taup (out x1 x1 z)
 R = x1\x2\ taup (plus (out x1 x1 z) (out x2 x2 z))
More [y] ? 
No more solutions (found 1).

?= R = a\b\ taup (plus (out a a z) (out b b z)) /\ S = a\b\ taup (out a a z) /\
   P = a\b\x\y\ plus (R a b) (match x y (S a b)) /\ Q = a\b\ plus (R a b) (S a b) /\
   forall a b x y, sat (Q a b) (boxAct tau (disj (diaAct (up b b) tt) (diaMatch x y tt))).
No solution.

?= R = a\b\ taup (plus (out a a z) (out b b z)) /\ S = a\b\ taup (out a a z) /\
   P = a\b\x\y\ plus (R a b) (match x y (S a b)) /\ Q = a\b\ plus (R a b) (S a b) /\
   forall a b x y, sat (P a b x y) (diaAct tau (boxAct (up b b) (diaMatch a b tt))).
No solution.

?= R = a\b\ taup (plus (out a a z) (out b b z)) /\ S = a\b\ taup (out a a z) /\
   P = a\b\x\y\ plus (R a b) (match x y (S a b)) /\ Q = a\b\ plus (R a b) (S a b) /\ 
   forall a b x y, sat (Q a b) (diaAct tau (boxAct (up b b) (diaMatch a b tt))).
Found a solution:
 Q = x1\x2\
     plus (taup (plus (out x1 x1 z) (out x2 x2 z)))
      (taup (out x1 x1 z))
 P = x1\x2\x3\x4\
     plus (taup (plus (out x1 x1 z) (out x2 x2 z)))
      (match x3 x4 (taup (out x1 x1 z)))
 S = x1\x2\ taup (out x1 x1 z)
 R = x1\x2\ taup (plus (out x1 x1 z) (out x2 x2 z))
More [y] ? 
No more solutions (found 1).

?= T = taup z /\
    P = x\y\u\v\ plus (taup (plus T (taup (match x y T)))) (Q x y u v) /\
    Q = x\y\u\v\ taup (plus T (taup (match x y (match u v T)))) /\
    forall x y u v, bisim (P x y u v) (Q x y u v).
No solution.

?= T = taup z /\ TT = taup T /\ 
   P = x\y\u\v\ plus (taup (plus TT (taup (match x y T)))) (Q x y u v) /\
   Q = x\y\u\v\ taup (plus TT (taup (match x y (match u v T)))) /\ 
   forall x y u v, bisim (P x y u v) (Q x y u v).
No solution.

?= T = taup z /\ TT = taup T /\ 
   P = x\y\u\v\ plus (taup (plus TT (taup (match x y T)))) (Q x y u v) /\
   Q = x\y\u\v\ taup (plus TT (taup (match x y (match u v T)))) /\
   forall x y u v, sat (P x y u v) (boxAct tau (diaAct tau (boxAct tau (diaMatch u v tt)))).
No solution.

?= T = taup z /\ TT = taup T /\ 
   P = x\y\u\v\ plus (taup (plus TT (taup (match x y T)))) (Q x y u v) /\
   Q = x\y\u\v\ taup (plus TT (taup (match x y (match u v T)))) /\
   forall x y u v, sat (Q x y u v) (boxAct tau (diaAct tau (boxAct tau (diaMatch u v tt)))).
Found a solution:
 Q = x1\x2\x3\x4\
     taup
      (plus (taup (taup z)) (taup (match x1 x2 (match x3 x4 (taup z)))))
 P = x1\x2\x3\x4\
     plus (taup (plus (taup (taup z)) (taup (match x1 x2 (taup z)))))
      (taup
        (plus (taup (taup z))
          (taup (match x1 x2 (match x3 x4 (taup z))))))
 TT = taup (taup z)
 T = taup z
More [y] ? 
No more solutions (found 1).

?= T = taup z /\ TT = taup T /\ 
   P = x\y\u\v\ plus (taup (plus TT (taup (match x y T)))) (Q x y u v) /\ 
   Q = x\y\u\v\ taup (plus TT (taup (match x y (match u v T)))) /\ 
   forall x y u v, sat (P x y u v) (diaAct tau (boxAct tau (disj (boxAct tau ff) (boxMatch x y (diaAct tau tt))))).

Found a solution:
 Q = x1\x2\x3\x4\
     taup
      (plus (taup (taup z)) (taup (match x1 x2 (match x3 x4 (taup z)))))
 P = x1\x2\x3\x4\
     plus (taup (plus (taup (taup z)) (taup (match x1 x2 (taup z)))))
      (taup
        (plus (taup (taup z))
          (taup (match x1 x2 (match x3 x4 (taup z))))))
 TT = taup (taup z)
 T = taup z
More [y] ? 
No more solutions (found 1).

?= T = taup z /\ TT = taup T /\
   P = x\y\u\v\ plus (taup (plus TT (taup (match x y T)))) (Q x y u v) /\ 
   Q = x\y\u\v\ taup (plus TT (taup (match x y (match u v T)))) /\ 
   forall x y u v, sat (Q x y u v) (diaAct tau (boxAct tau (disj (boxAct tau ff) (boxMatch x y (diaAct tau tt))))).
No solution.

```
