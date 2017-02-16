% vim: ts=2: sw=2: expandtab: ai: syntax=lprolog
sig spi. % spi.sig

kind nm type. % rigid names

kind ty type.
type t_nm  ty.
type t_pr  ty -> ty -> ty.
type t_en  ty -> ty -> ty.

kind tm type. % term
type nm   nm -> tm.
type pr		(tm -> tm -> tm).	% pairing constructor
type en		(tm -> tm -> tm).	% symmetric encryption

kind p type.
% process constructors
type zero p.
type bang p -> p.
type taup p -> p.
type in tm -> (tm -> p) -> p.
type out tm -> tm -> p -> p.
type par p -> p -> p.
type plus p -> p -> p.
type nu  (tm -> p) -> p.
type match tm -> tm -> p -> p.
type let tm -> (tm -> tm -> p) -> p.
type case tm -> tm -> (tm -> p) -> p.


kind pa type. % agent
type abs (tm -> p) -> pa.
type con tm -> p -> pa.
type new (tm -> pa) -> pa.


kind a type. % action
type tau a.
type dn tm -> a.
type up tm -> a.

type one p -> a -> pa -> o.
type red p -> p -> o.
type app pa -> pa -> p -> o. % interaction
type tau1 p -> p -> o. % tau transition
type taus p -> p -> o. % tau transition
% type tausA pa -> pa -> o. % tau transition
type parAP pa -> p -> pa -> o.
type parPA p -> pa -> pa -> o.
type push_new pa -> pa -> o. 
type occurs tm -> tm -> o.

type syn tm -> ty -> o.        % msg synthesis
type mnd tm -> tm -> ty -> o.  % msg indistinguisable

type of tm -> ty -> o.
