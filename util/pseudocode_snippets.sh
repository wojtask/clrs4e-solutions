#!/usr/bin/env bash

# This script generates images of pseudocode instructions used in the book and in the solutions.
# Maintains a hashmap mapping instruction names to LaTeX snippets used to typeset the instructions.
# For each instruction, wraps the snippet in a codebox environment and compiles it to a PDF named after the instruction.
# The PDF is then converted to a PNG file, ready to be referenced in a Markdown file.

declare -A instructions=(
['true']='\const{true}'
['false']='\const{false}'
['nil']='\nil'
['infinity']='$\infty$'
['constant']='\const{no-such-path}'
['variable']='$x$'
['decorated_variable']="\$y_2'\$"
['dashed_variable']='\id{best-score}'
['attribute']='$\attrib{T}{root}$'
['dashed_attribute']='$\attrib{A}{heap-size}$'
['indexed_attribute']='$\attrib{x}{\id{key}_i}$'
['assignment']='$x\gets y$'
['is_equal']='$x\isequal y$'
['is_not_equal']='$x\ne y$'
['less']='$x<y$'
['greater']='$x>y$'
['less_equal']='$x\le y$'
['greater_equal']='$x\ge y$'
['and']='condition1 and condition2'
['or']='condition1 or condition2'
['not']='not condition'
['increment']='$x\gets x+y$'
['decrement']='$x\gets x-y$'
['addition']='$x+y$'
['subtraction']='$x-y$'
['multiplication']='$x\cdot y$'
['floor_division']='$\lfloor x/y\rfloor$'
['ceiling_division']='$\lceil x/y\rceil$'
['modulo']='$x\bmod y$'
['exponent']='$x^y$'
['square_root']='$\!\sqrt{x}$'
['floor']='$\lfloor x\rfloor$'
['ceiling']='$\lceil x\rceil$'
['minimum']='$\min\{x,y\}$'
['maximum']='$\max\{x,y\}$'
['exchange']='exchange $x$ with $y$'
['swap']='swap $x$ with $y$'
['print']='print $x$'
['procedure_definition']='\zi$\proc{Insertion-Sort}(A,n)$\zi\>block'
['procedure_call']='$\proc{Insertion-Sort}(A,n)$'
['return_no_value']='\Return'
['return_single_value']='\Return $x$'
['return_multiple_values']='\Return $x$ and $y$'
['new_array']='let $A[0\subarr n]$ be a new array'
['array_cell']='$A[i]$'
['new_set']='$S\gets\emptyset$'
['set_union']='$S\cup\{x\}$'
['set_cardinality']='$|S|$'
['error']="\Error \`\`overflow''"
['if_statement']='\zi\If condition1\zi\Then block1\zi\ElseIf condition2\zi\Then block2\zi\ElseNoIf block3'
['for_to_loop']='\zi\For $i=x$ \To $y$\zi\Do block'
['for_downto_loop']='\zi\For $i=y$ \Downto $x$\zi\Do block'
['for_each_loop']='\zi\For each $v\in V$\zi\Do block'
['while_loop']='\zi\While condition\zi\Do block'
['repeat_loop']='\zi\Repeat\zi block\zi\Until condition'
)

rm **/*.png 2>/dev/null
mkdir light dark 2>/dev/null

for name in "${!instructions[@]}"; do
  cat <<EOF > "${name}.tex"
\documentclass[convert={
    command=\unexpanded{{\convertexe\space -density 300 \infile\space\outfile}}
  }]{standalone}
\makeatletter
\def\input@path{{../}}
\makeatother
\usepackage{amsmath}
\usepackage{txfonts}
\usepackage[lite,eucal,amsbb,subscriptcorrection,zswash]{mtpro2}
\usepackage{clrscode4e}
\begin{document}
\begin{minipage}{150pt}
\begin{codebox}
${instructions[$name]}
\end{codebox}
\vspace*{-10pt}
\end{minipage}
\end{document}
EOF
  pdflatex -halt-on-error -interaction=batchmode -shell-escape "${name}.tex"
  mv "${name}.png" light/
  sed -i 's/\\infile/-negate \\infile/' "${name}.tex"
  pdflatex -halt-on-error -interaction=batchmode -shell-escape "${name}.tex"
  mv "${name}.png" dark/
  rm "${name}".{tex,aux,log,pdf} 2>/dev/null
done
