sig pisyntax.

kind nm type. % names

kind pr type. % pi-calculus processes
type taup             pr -> pr.
type inp              nm -> (nm -> pr) -> pr.
type oup              nm -> nm -> pr -> pr.
type plus, par        pr -> pr -> pr.
type null             pr.
type nu               (nm -> pr) -> pr.
type match, mismatch  nm -> nm -> pr -> pr.

kind lb type. %% labels of the LTS
type tau       lb.
type up, dn    nm -> nm -> lb.

type var  nm -> o.
type con  nm -> o.

type of  nm -> o.

type closed  pr -> o.
