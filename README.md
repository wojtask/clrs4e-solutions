# Introduction to Algorithms, Fourth Edition &mdash; solutions to exercises and problems

![Build PDF](https://github.com/wojtask/clrs4e-solutions/actions/workflows/build.yml/badge.svg)

### Overview

The goal of this project is to provide solutions to all exercises and problems from [*Introduction to Algorithms, Fourth
Edition*](http://mitpress.mit.edu/algorithms4) by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford
Stein.
My intention is to ensure, first and foremost, the rock solid correctness and completeness of the provided content, its
technical elegance, as well as its consistency with the textbook material.
In order to achieve such reliability, I put a lot of effort into evolving and revising the solutions, not only in terms
of accuracy and content-related correctness, but also in terms of terminology, wording, and typography.
I also pay attention to providing optimal algorithms, which are then implemented and thoroughly tested, and to
illustrate operations and examples with accurate pictures, consistent with the style of the textbook.

It should be noted that the textbook authors also provide the
official [Selected Solutions](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/11599/selected-solutions.pdf),
which cover about 7% of all exercises and problems.
Additionally, other researchers publicly host their solutions on the web, though majority of those that I found are for
the third edition of the textbook:

* [solutions by Michelle Bodnar and Andrew Lohr](http://sites.math.rutgers.edu/~ajl213/CLRS/CLRS.html),
* [solutions by Stefan Kanev](https://ita.skanev.com),
* [solutions by Don R. Walsh](https://donrwalsh.github.io/CLRS),
* [crowdsourced solutions coordinated by Peng-Yu Chen](https://walkccc.github.io/CLRS),
* [the textbook's page on Quizlet](https://quizlet.com/explanations/textbook-solutions/introduction-to-algorithms-4th-edition-9780262046305).

However, none of the above sources cover all exercises, especially when compared to the fourth edition that adds a
significant number of new exercises.
Also, I noticed that some solutions are not of the highest quality, with defects ranging from incorrectness or
incompleteness to the lack of technical elegance.
Nevertheless, these pieces of work were sources of inspiration for me, and showed different approaches and perspectives.
When borrowing on the ideas presented there, I always aimed to rework the solutions by introducing necessary fixes and
improvements, and refine to improve consistency with the book.

The solutions here often refer to the material presented in the textbook, so familiarity on at least the corresponding
chapter is required.
In many solutions, you will also find references to other tasks, especially when a given task uses the result of another
in its own solution.
In general, later solutions sometimes rely on the earlier ones by referencing the relevant exercises.
Thus, in early chapters one can observe a somewhat greater focus on details, and in later chapters more cross-references
to exercises where those details have already been discussed.

I keep an eye on errors or inaccuracies in exercises and problems or the material they directly rely on, and highlight
them in brief notes just before the solution of the affected exercise.
At the same time I refer to the
textbook's [errata](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/11599/e4-bugs.html) &mdash;
if it includes a certain correction, I assume that the bug has already been fixed in a subsequent printing.

As I stressed earlier, I pay special attention to ensuring the correctness of the algorithms and data structures
operations.
To maximize my confidence, I implement and test each pseudocode or algorithm description that I provide in the
solutions, as well as those that are provided in the textbook.
I chose Python as a programming language, because of its popularity and its syntax similar to that used in pseudocodes.
The counterpart project with implementations is available [here](https://github.com/wojtask/clrs4e-implementations).

[The list of provided algorithms.](ALGORITHMS.md)

[Detailed project's conventions.](CONVENTIONS.md)

### History

The origins of the project date back to 2005, when I started solving exercises by pen and paper, while studying
algorithms as a preparation for participating in the Polish Olympiad in Informatics.
I was relying on the Polish translation of the textbook's second edition, titled *Wprowadzenie do algorytmów*, and my
solutions were in Polish as well.
In 2009 I started rewriting them in LaTeX.
The document has evolved since then, with changes involving numerous fixes, improved page layout and styling, as well as
open sourcing it on GitHub as [**CormenSol**](https://github.com/wojtask/CormenSol).
At the beginning the pictures were drawn in MetaPost, before having been rewritten to PGF/TikZ in 2016.
In 2012 I started implementing algorithms, first in C++, then in Java, before finally settling on Python in 2017, and I
open sourced the implementations as [**CormenPy**](https://github.com/wojtask/CormenPy).
Since initiating the project, the textbook got updated to the third edition in 2009, then to fourth edition in 2022.
Having solved Chapters 1-17 and Appendices A-C from the &mdash; now outdated &mdash; second edition, I decided to freeze
both **CormenSol** and **CormenPy**, and shift my attention to adapt the solutions for the fourth edition, while
translating them to English &mdash; the process I refer to as **migration**.

The work on the current project began on January 1, 2023.

### Progress

<table>
  <tr>
    <th>Part I</th>
    <th>Part II</th>
    <th>Part III</th>
    <th>Part IV</th>
    <th>Part V</th>
    <th>Part VI</th>
    <th>Part VII</th>
    <th>Part VIII</th>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/3">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/3?color=limegreen" alt="Chapter 1">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/4">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/4?color=limegreen" alt="Chapter 2">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/5">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/5?color=limegreen" alt="Chapter 3">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/6">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/6?color=gold" alt="Chapter 4">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/7">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/7?color=gold" alt="Chapter 5">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/8">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/8?color=lightgray" alt="Chapter 6">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/9">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/9?color=lightgray" alt="Chapter 7">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/10">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/10?color=lightgray" alt="Chapter 8">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/11">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/11?color=lightgray" alt="Chapter 9">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/12">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/12?color=lightgray" alt="Chapter 10">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/13">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/13?color=lightgray" alt="Chapter 11">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/14">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/14?color=lightgray" alt="Chapter 12">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/15">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/15?color=lightgray" alt="Chapter 13">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/16">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/16?color=lightgray" alt="Chapter 14">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/17">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/17?color=lightgray" alt="Chapter 15">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/18">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/18?color=lightgray" alt="Chapter 16">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/19">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/19?color=lightgray" alt="Chapter 17">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/20">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/20?color=lightgray" alt="Chapter 18">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/21">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/21?color=lightgray" alt="Chapter 19">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/22">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/22?color=lightgray" alt="Chapter 20">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/23">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/23?color=lightgray" alt="Chapter 21">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/24">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/24?color=lightgray" alt="Chapter 22">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/25">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/25?color=lightgray" alt="Chapter 23">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/26">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/26?color=lightgray" alt="Chapter 24">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/27">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/27?color=lightgray" alt="Chapter 25">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/28">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/28?color=lightgray" alt="Chapter 26">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/29">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/29?color=lightgray" alt="Chapter 27">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/30">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/30?color=lightgray" alt="Chapter 28">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/31">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/31?color=lightgray" alt="Chapter 29">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/32">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/32?color=lightgray" alt="Chapter 30">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/33">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/33?color=lightgray" alt="Chapter 31">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/34">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/34?color=lightgray" alt="Chapter 32">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/35">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/35?color=lightgray" alt="Chapter 33">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/36">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/36?color=lightgray" alt="Chapter 34">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/37">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/37?color=lightgray" alt="Chapter 35">
      </a>
    </td>
    <td>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/38">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/38?color=limegreen" alt="Appendix A">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/39">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/39?color=limegreen" alt="Appendix B">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/40">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/40?color=limegreen" alt="Appendix C">
      </a>
      <br>
      <a href="https://github.com/wojtask/clrs4e-solutions/milestone/41">
        <img src="https://img.shields.io/github/milestones/progress-percent/wojtask/clrs4e-solutions/41?color=limegreen" alt="Appendix D">
      </a>
    </td>
  </tr>
</table>

### Roadmap

- [x] Add project's documentation (you are reading it now), create issues and milestones, setup document's stub, suggest
  page layout and styling.
- [x] Migrate the CormenSol solutions from Appendices A-C.
  Add solutions to the modified and new exercises and problems along the way.
- [x] Add solutions to Appendix D, previously missing in the second edition, completing Part
  VIII ([release 0.1](https://github.com/wojtask/clrs4e-solutions/releases/tag/0.1)).
- [ ] Migrate the CormenSol solutions from Chapters 1-17 and the corresponding CormenPy implementations.
  Add solutions and implementations to modified and new exercises and problems along the way.
    - [ ] Complete Part I (release 0.2).
    - [ ] Complete Part II (release 0.3).
    - [ ] Complete Part III (release 0.4).
    - [ ] Complete Part IV (release 0.5).
    - [ ] Complete Chapter 17 from Part V.
- [ ] Add solutions and implementations to Chapters 18-35.
    - [ ] Complete Part V (release 0.6).
    - [ ] Complete Part VI (release 0.7).
    - [ ] Complete selected chapters from Part VII (release 0.8).
    - [ ] Complete Part VII (release 0.9).
- [ ] Finalize the document (release 1.0).

### Building

To compile the project locally at least TeX Live 2023 is required.
Older versions may produce an error with unrecognized option `twoside` of the package `fancyhdr`.
The support of this option was added in fancyhdr v4.1 dated 2022-11-09.
As a workaround, the option can be manually removed before compiling the document.
This will change the way page headers are displayed; they will have the same format on left-hand pages and right-hand
pages, but it shouldn't have a dramatic effect on the output.

On Debian/Ubuntu the minimal required set of TeX Live packages can be installed with:

```shell
sudo apt install texlive-pstricks texlive-latex-extra texlive-fonts-extra latexmk
```

Additionally, you need to install the MathTime Professional II Lite fonts.
Since the fonts are not available in the standard TeX Live distribution, you will need to install them using the
provided script:

```shell
chmod +x util/install_fonts.sh && sudo util/install_fonts.sh
```

Once the environment has been prepared, you can compile the document to PDF by running the following command:

```shell
latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode clrs4e-solutions.tex
```

Using other LaTeX distributions or other operating systems may require adapting the above commands or performing
additional actions before compiling the document.

### Contributions

Again, a significant effort has been made to ensure that each solution is thoroughly checked.
However, if you have found an error of any kind, or you can improve an existing solution in any way, I will be grateful
for your feedback or help.
Each exercise and each subproblem has its own issue in this repository, named and categorized appropriately.
Please avoid duplicating these issues, rather search for the right one, and leave a comment, or even better &mdash;
create a pull request with your suggestions.
Authors of significant contributions will be credited in the document.

**Together let's make this the most complete, reliable and consistent set of solutions to the iconic CLRS!**

&mdash; *Krzysztof Wojtas*
