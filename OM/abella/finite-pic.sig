sig finite-pic.

% Three syntactic types are used: n (for ns), a (for
% as), and p (for pesses).  The type o denotes the type of
% propositions.

% The constructors for p are 'null', 'taup', 'match', 'plus',
% 'par', and 'nu' denote, respectively, the mull pess, the tau
% prefix, match prefix, the non-deterministic choice operator, the
% parallel composition, and the restriction operator of the
% pi-calculus. The input and output prefixes are encoded as in and
% out.

kind n, p   type.

type null         p.
type taup         p -> p.
type plus, par    p -> p -> p.
type match, out   n -> n -> p -> p.
type in           n -> (n -> p) -> p.
type nu           (n -> p) -> p.

kind a       type.
type tau          a.
type up, dn       n -> n -> a.

% One step transition for free transitions
type one          p ->          a  ->          p  -> o.
% One step transition for binding transitions
type oneb         p -> (n -> a) -> (n -> p) -> o.

