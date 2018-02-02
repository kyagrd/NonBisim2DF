module pisyntax.

of X :- var X.
of X :- con X.

closed null.
closed (taup P) :- closed P.
closed (inp X M) :- of X,  pi x\ var x => closed (M x).
closed (oup X Y P) :- of X, of Y, closed P.
closed (plus P Q) :- closed P, closed Q.
closed (par P Q)  :- closed P, closed Q.
closed (match X Y P) :- of X, of Y, closed P.
closed (nu M) :- pi x\ con x => closed (M x).


