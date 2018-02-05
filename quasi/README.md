# Quasi-Open Bisimilarity with Mismatch is Intuitionistic
 
* `quasi-finpi.thm` : Abella proof script that contains
     - logical embeddings of the key definitions
         * transition semantics of the pi-calculus with mismatch
         * quasi-open bisimilarity
         * and its characterizing modal logic (intuitionistic FM);
     - mechanized proofs for the properties of above definitions:
         * equivalence of quasi-open bisimilarity
         * congruence of quasi-open bisimilarity for arbitrary process contexts including input prefixes
         * soundness of quasi-open bisimilarity with respect to the modal logic
         * and partially mechanized completeness of quasi-open bisimilarity with respect to the modal logic;
     - and all the examples in the draft mechanically checked using the definitions in Abella (using version 2.0.5).
* `quasi-finpi.html` : html output of the proof script (easier to browse through the definitions with the proof content folded -- can click on to see the details of tactics).
* `quasi-finpi-details.html` : html output of the interactive output of the Abella proof state step-by-step after each proof tactic command.

To see the rendered html files you need to download the two html files in a same directory (either by checking out this repository as a whole or by download the two raw contents of the html files separtely) and load it with your web browser.
