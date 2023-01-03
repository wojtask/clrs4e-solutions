# Introduction to Algorithms, 4th ed. &ndash; solutions to exercises and problems

![Build PDF](https://github.com/wojtask/clrs4e-solutions/actions/workflows/build.yml/badge.svg)

### Overview

The goal of this project is to provide solutions to all exercises and problems from *Introduction to Algorithms, Fourth Edition* by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford Stein.
My intention was to ensure, first and foremost, the rock solid correctness and completeness of the provided content, its technical elegance, as well as its consistency with the textbook material.
In order to achieve such reliability, I spent a lot of time evolving and revising the solutions, not only in terms of content, but also in terms of terminology, wording, and typography.
I pay attention to providing optimal algorithms, which are then implemented and thoroughly tested, and to illustrate operations and examples with accurate pictures, consistent with the style of the textbook.

It should be mentioned that the textbook's authors also provide selected solutions &ndash; they can be downloaded from the [textbook's website](http://mitpress.mit.edu/algorithms4).
Also, other authors publicly host their solutions on the web, though majority of those that I found are for the third edition of the textbook:
* [solutions by Michelle Bodnar and Andrew Lohr](http://sites.math.rutgers.edu/~ajl213/CLRS/CLRS.html),
* [solutions by Stefan Kanev](https://ita.skanev.com),
* [solutions by Don R. Walsh](https://donrwalsh.github.io/CLRS),
* [crowdsourced solutions coordinated by Peng-Yu Chen](https://walkccc.github.io/CLRS),
* [the textbook's page on Quizlet](https://quizlet.com/explanations/textbook-solutions/introduction-to-algorithms-4th-edition-9780262046305).

However, none of the above sources cover all the textbook's exercises, especially when compared to the fourth edition, that adds significant number of new exercises.
Also, I noticed that certain solutions are not of the highest quality, e.g., some of them are incorrect, incomplete, or just far from elegance.
Nevertheless, these pieces of work provided me with a source of inspiration, shared different approaches and perspectives.
When relying on the ideas from them, I always aimed to rework the solutions by introducing necessary fixes and improvements, or simply polishing them.

The solutions here often refer to the material presented in the textbook, so familiarity on at least a current chapter is required.
In many solutions, you will also find references to other tasks, especially when a given task uses the result of another in its own solution.
In general, later solutions sometimes rely on the earlier ones by referencing the relevant exercises.
Thus, in the early chapters one can observe a somewhat greater focus on details, and in later chapters more cross-references to exercises where those details have already been discussed.

I keep an eye to errors or inaccuracies in exercises statements or the material they directly rely on, and highlight them in short notes before the solution of the affected exercise.
On the other hand, I refer to the [errata](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/11599/e4-bugs.html) for the textbook &ndash; if it includes a certain correction, I assume that the bug has already been fixed.

As I stressed earlier, I pay special attention to ensuring the correctness of the algorithms and data structures operations.
To be more confident about it, I implement and test each algorithm's pseudocode or description that I provide in the solutions, as well as those that are provided in the textbook.
I chose Python as a programming language, because of its popularity and its syntax close to that used in pseudocodes.
The counterpart project with implementations is available on [here](https://github.com/wojtask/clrs4e-implementations).

[The list of provided algorithms.](ALGORITHMS.md)

[Detailed project's conventions.](CONVENTIONS.md)

### History

The origins of the project date back to 2005, when I started solving exercises on paper, during studying algorithms as a preparation to participate in the Polish Olympiad in Informatics.
I was relying on the Polish translation of the textbook's second edition, titled *Wprowadzenie do algorytmów*, and I was working on the solutions in Polish as well.
In 2009 I started rewriting them in LaTeX.
The document has evolved since then, with changes involving numerous fixes, improved page layout and styling, as well as open sourcing it on GitHub as [**CormenSol**](https://github.com/wojtask/CormenSol).
At the beginning the pictures were drawn in MetaPost, before having been rewritten to PGF/TikZ in 2016.
In 2012 I started implementing algorithms, first in C++, then Java, before finally settling on Python in 2017, and open sourced it as [**CormenPy**](https://github.com/wojtask/CormenPy).
Since initiating the project, the textbook got updated to the third edition in 2009, then to fourth edition in 2022.
Having solved chapters 1-17 and appendices A-C from the, now archaic, second edition, I decided to freeze both **CormenSol** and **CormenPy**, and shift my attention entirely to develop solutions for the fourth edition, while translating them to English.

### Future

The work on the current project started in 2023.
Below is the project's roadmap:
* Add project's documentation (you are reading it now), create issues and milestones, setup document's stub, suggest page layout and styling (deadline: **Jan 15, 2023**).
* Migrate the existing solutions from appendices A-C. Add solutions to the modified and new exercises and problems along the way.
* Add solutions to appendix D, previously missing in the second edition.
* Migrate the existing solutions from chapters 1-17, including implementations. Add solutions and implementations to modified and new exercises and problems along the way (deadline: **Dec 31, 2023**).
* Add solutions and implementations to chapters 18-35 (deadline: **TBD**).

### Building

To compile the project locally, you need a LaTeX distribution, preferably TeXLive 2021 or newer.
The document depends on a number of packages, including `tikz`, `amsmath`, `euler`, so make sure you have installed necessary TeXLive modules.
Once your environment is prepared, compile the document to a PDF by running the following command from the project's directory:
```
latexmk -pdf clrs4e-solutions.tex
```

### Contributions

Again, significant effort has been made to ensure that each solution is thoroughly checked.
However, if you have found an error of any kind, or you can improve an existing solution in any way, I will be grateful for your help.
Each exercise and each subproblem has its own issue on GitHub, named and labelled appropriately.
Please avoid duplicating these issues, rather search for the right one, and leave a comment.
Alternatively, you are welcomed to create a pull request with your suggestions.

&mdash; Krzysztof Wojtas
