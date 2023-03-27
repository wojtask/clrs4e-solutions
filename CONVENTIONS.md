Here is a list of conventions followed in the project.

### Layout and style
* To be more consistent with the textbook style, use a similar (or exactly the same) color palette.
* Follow the same notation conventions, e.g., change angle brackets to parentheses to denote ordered pairs.

### Text
* Follow closely the statements. If the statement says to write a pseudocode, the solution should have the pseudocode. If the statement says to give or describe an algorithm, the solution can provide a strict description instead of pseudocode. The same convention applies to proving that an algorithm is correct, proving its time complexity, and drawing pictures.
* Place exercise, problem and subproblem labels to the margins.
* Add stars to labels of starred exercises and problems to make them consistent with the labels from the textbook.
* Mention any errors or ambiguities found in the exercise's text in a form of a note before the solution text.

### Mathematics
* Use `align*` or `gather*` environments to vertically align formulas.
* Use `\tag` whenever necessary to better reference and explain transitions in formulas.
* In proofs by induction, we generally aim to prove a theorem for `n`, using inductive hypothesis for `n-1`.

### Pseudocodes
* Use predefined `\attrib` commands family in `clrscode4e` instead of custom defined ones.
* Use `\subarr` to denote the subarray with the ":" notation, instead of `\twodots`.
* Use `\isequal` instead of `=` for quality tests.
* Use `\nil` as a shorthand for `\const{nil}`.
* Write "exchange `x` with `y`" instead of "exchange `x \leftrightarrow y`".
* Write "let `A[0 \subarr n]` be an array" instead of "create an array `A[0 \subarr n]`".
* Consider using the `floatingcodebox` package option for floating pseudocodes: `\RequirePackage[floatingcodebox]{clrscode4}`
* Consider using the `screen` package option for a light tan screen behind pseudocodes: `\RequirePackage[screen]{clrscode4e}` 
* Use
```latex
\begin{codebox}
[First procedure goes here]
\end{innercodebox}
\begin{innercodebox}
[Second procedure goes here]
\end{innercodebox}
\begin{innercodebox}
[Third procedure goes here]
\end{codebox}
```
to force multiple procedures occupy the same box, so they appear together on the same page.
* Consider using `codeboxt`, `codeboxb`, `codeboxh`, and `codeboxp` environments to attempt to force placing a pseudocode at a specified location on a page.
* Consider using 
```latex
\reducecodeboxtrue
\codeboxreduction{XX}
\begin{codebox}
[Pseudocode goes here]
\end{codebox}
\reducecodeboxfalse
```
to reduce the size of a pseudocode, where `XX` is the reduction rate.
* When using `\If` after an `Else`, the `\If` should be in a different line, so it should be preceded by `\li` (or `\zi`).
* To negate a condition in `if` or `while` use the "not" word instead of testing equality with `\const{false}`.
* Use `\Indentmore` to increase the indentation level, then `\End` to decrement the indentation level back.
* Use `\indentlinenumbers` just before the closing `\end{codebox}` (or `\end{innercodebox}`) to indent the line numbers in the procedure so they are aligned with the line numbers of the procedure above with 10 lines or more.
* Use `\tab` or `\tabto{X}` instead of a series of `\>` to add tabbing within a line. This is useful for vertically aligning comments.
* Use `\tabincomment` to add indentation within a comment (in multilined comments).

### Pictures and tables
* Try to be as close to the style in the textbook, as possible.
* For pictures and tables use the same numbering format as for exercises/problems they belong to. Reference to the picture in the solution text is necessary, as the picture might have been placed on a different page. Use a simple reference, and put all the picture or table details in their caption.
