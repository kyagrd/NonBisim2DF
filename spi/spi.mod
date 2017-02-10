% vim: ts=2: sw=2: expandtab: ai: syntax=lprolog
module spi. % spi.mod

red (bang P) (par P (bang P)).
red (match X X P) P.
red (let (pr M N) P) (P M N).
red (case (en M K) K P) (P M).

app (abs M) (con X Q) (par (M X) Q).
app (con X Q) (abs M) (par Q (M X)).
app (abs M) (new A) (nu R) :- pi x\ app (abs M) (A x) (R x).
app (new A) (abs M) (nu R) :- pi x\ app (A x) (abs M) (R x).
app (new A) (new B) (nu R) :- pi x\ app (A x) (B x) (R x).

one (in X F) (dn X) (abs F).
one (out X N P) (up X) (con N P).
one (plus P Q) X A :- one P X A.
one (plus P Q) X A :- one Q X A.
one (par P Q) X A :- one P X AP, parAP AP Q A.
one (par P Q) X A :- one Q X AQ, parPA P AQ A.
one (nu P) X A :- (pi x\ one (P x) X (R1 x)), push_new (new R) A.
one P X A :- red P Q, one Q X A.

parAP (abs M) Q (abs x\par (M x) Q).
parAP (con N P) Q (con N (par P Q)).
parAP (new C) Q A :- (pi x\ parAP (C x) Q (R x)), push_new (new R) A.

parPA Q (abs M) (abs x\par Q (M x)).
parPA Q (con X P) (con X (par Q P)).
parPA Q (new C) A :- (pi x\ parPA Q (C x) (R x)), push_new (new R) A.

tau1 (taup P) P.
tau1 (par P Q) R :- one P (dn X) P1, one Q (up X) Q1, app P1 Q1 R.
tau1 (par P Q) R :- one P (up X) P1, one Q (dn X) Q1, app P1 Q1 R.
tau1 (par P Q) (par P1 Q) :- tau1 P P1.
tau1 (par P Q) (par P Q1) :- tau1 Q Q1.
tau1 (plus P Q) P1 :- tau1 P P1.
tau1 (plus P Q) Q1 :- tau1 Q Q1.
tau1 (nu M) (nu N) :- pi p\ tau1 (M p) (N p).
tau1 P Q :- red P P1, tau1 P1 Q.

taus P P.
taus P R :- tau1 P Q, taus Q R.

% tausA A A.
% tausA (abs A) (abs B) :- pi x\ taus (A x) (B x).
% tausA (con M A) (con M B) :- taus A B.
% tausA (new A) (new B) :- pi x\ tausA (A x) (B x).

push_new (new x\con N (P x)) (con N (nu P)).
push_new (new x\con (M x) (P x)) (new x\con (M x) (P x)) :- pi x\ occurs x (M x).
push_new (new x\new y\R x y) (new C) :- pi y\ push_new (new x\R x y) (C y).

occurs X X.
occurs X (pr M N) :- occurs X M.
occurs X (pr M N) :- occurs X N.
occurs X (en M N) :- occurs X M.
occurs X (en M N) :- occurs X N.

mnd (pr M1 M2) (pr N1 N2) (t_pr T1 T2) :- mnd M1 N1 T1, mnd M2 N2 T2.
mnd M1 N1 T1 :- mnd (pr M1 M2) (pr N1 N2) (t_pr T1 T2).
mnd M2 N2 T2 :- mnd (pr M1 M2) (pr N1 N2) (t_pr T1 T2).
mnd (en M1 M2) (en N1 N2) (t_en T1 T2) :- mnd M1 N1 T1, mnd M2 N2 T2.
mnd M1 N1 T1 :- mnd (en M1 M2) (en N1 N2) (t_en T1 T2), mnd M2 N2 T2.

syn (pr M N) (t_pr TM TN) :- syn M TM, syn N TN.
syn M TM :- syn (pr M N) (t_pr TM TN).
syn N TN :- syn (pr M N) (t_pr TM TN).
syn (en M K) (t_en TM TK) :- syn M TM, syn K TK.
syn M TM :- syn K TK, syn (en M K) (t_en TM TK).

of (nm X) (t_nm).
of (pr M N) (t_pr TM TN) :- of M TM, of N TN.
% of M TM :- of (pr M N) (t_pr TM TN).
% of N TN :- of (pr M N) (t_pr TM TN).
of (en M N) (t_en TM TN) :- of M TM, of N TN.
% of M TM :- of (en M K) (t_en TM TK).
% of K TK :- of (en M K) (t_en TM TK).

