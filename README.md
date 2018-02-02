# NonBisim2DF
This repository contains pragrams and proof scripts about extracting Distinguishing Formula from non-bisimilar processes.

* The `quasi` direcotry contains supplimentary metarials of our recent work (*Quasi-Open Bisimilarity with Mismatch is Intuitionistic*. Ki Yung Ahn, Ross Horne, Shang-Wei Lin and Alwen Tiu. submitted for peer review.) on quasi-open bisimilary for the pi-calculus including mismatch (guards with inequality), which is not part of the original work on quasi-open bisimulation ([Sangiorgi and Walker, CONCUR 2001](https://dx.doi.org/10.1007/3-540-44685-0_20)). The novelty of our work is the intuitoinisitic approach resolving mismatchs via constructive evidences. The direcotry contains Abella proofs for the congruence of quasi-open bisimilarity, which is a key property for establishing the coincidence regarding open-barbed bisimilarity, and properties of the modal logic (intuitionistic varient of FM), which characterises quasi-open bisimulation with mismatch.

* The `pic` directory contains Abella proofs and Bedwyer implementations for the modal logic OM, which caracterises open bisimulation for the finite pi-calculus. These are supplimentary materials for our paper ["A Logical Characterization of Open Bisimulation using an Intuitionistic Modal logic"](http://dx.doi.org/10.4230/LIPIcs.CONCUR.2017.7). (Best Paper Award in [CONCUR 2017](https://www.concur2017.tu-berlin.de)) `[`[View supplimentary materials here.](https://github.com/kyagrd/NonBisim2DF/tree/master/pic)`]`

* The `ccs` directory contains an implementation that tests whether two finite CCS processes are bisimiar, and generate a digtinguishing formula when they are not bisimilar. The implementation is based on Bedwyer specifications of finite CCS transition system, bisimulation, and Hennessy--Milner logic.

Further details are described in the `README.md` in each directory.
