# NonBisim2DF
This repository contains pragrams and proof scripts about extracting Distinguishing Formula from non-bisimilar processes.

* The `pic` directory contains Abella proofs and Bedwyer implementations for the modal logic OM, which caracterises open bisimulation for the finite pi-calculus. These are supplimentary materials for our paper ["A Logical Characterization of Open Bisimulation using an Intuitionistic Modal logic"](https://arxiv.org/abs/1701.05324). (to appear in [CONCUR 2017](https://www.concur2017.tu-berlin.de)) `[`[View supplimentary materials here.](https://github.com/kyagrd/NonBisim2DF/tree/master/pic)`]`

* The `ccs` directory contains an implementation that tests whether two finite CCS processes are bisimiar, and generate a digtinguishing formula when they are not bisimilar. The implementation is based on Bedwyer specifications of finite CCS transition system, bisimulation, and Hennessy--Milner logic.

Further details are described in the `README.md` in each directory.
