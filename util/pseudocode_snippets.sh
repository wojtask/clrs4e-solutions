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
['constant']='\const{red}'
['dashed_constant']='\const{no-such-path}'
['variable']='$k$'
['decorated_variable']="\$k_2'\$"
['dashed_variable']='\id{best-score}'
['fixed_function']='$\func{out-degree}(v)$'
['assignment']='$x\gets y$'
['increment']='$i\gets i+1$'
['decrement']='$j\gets j-4$'
['is_equal']='$x\isequal y$'
['is_not_equal']='$x\ne y$'
['compound_condition']='$x<y$ or ($x>y$ and not \id{found})'
['procedure_call']='$\proc{Insertion-Sort}(A,n)$'
['attribute']='$\attrib{T}{root}$'
['dashed_attribute']='$\attrib{A}{heap-size}$'
['indexed_attribute']='$\attrib{x}{\id{key}_i}$'
['return_no_value']='\Return'
['return_single_value']='\Return $x$'
['return_multiple_values']='\Return $x$ and $y$'
['exchange']='exchange $x$ with $y$'
['swap']='swap $x$ with $y$'
['error']="\Error \`\`overflow''"
['print']='print $x$'
['new_array']='let $A[0\subarr n]$ be a new array'
['array_cell']='$A[i]$'
['new_set']='$S\gets\emptyset$'
['set_union']='$S\cup\{x\}$'
['set_cardinality']='$|S|$'
['floor_division']='$\lfloor a/b\rfloor$'
['ceiling_division']='$\lceil a/b\rceil$'
['minimum']='$\min\{x,y\}$'
['maximum']='$\max\{x,y\}$'
['if_statement']='
\zi \If condition1
\zi     \Then statement1
\zi \ElseIf condition1
\zi     \Then statement2
\zi \ElseNoIf statement3
        \End'
['for_to_loop']='
\zi \For $i=a$ \To $b$
\zi     \Do body
        \End'
['for_downto_loop']='
\zi \For $i=b$ \Downto $a$
\zi     \Do body
        \End'
['for_each_loop']='
\zi \For each $v\in V$
\zi     \Do body
        \End'
['while_loop']='
\zi \While condition
\zi    \Do body
       \End'
['repeat_loop']='
\zi \Repeat
\zi     body
\zi \Until condition'
)

rm *.png

for name in "${!instructions[@]}"; do
  cat <<EOF > "$name".tex
\documentclass[convert]{standalone}
\makeatletter
\def\input@path{{../}}
\makeatother
\usepackage{amsmath}
\usepackage{txfonts}
\usepackage[lite,eucal,amsbb,subscriptcorrection,zswash]{mtpro2}
\usepackage{varwidth}
\usepackage{clrscode4e}
\begin{document}
\begin{varwidth}{\linewidth}
\vspace*{-3ex}
\begin{innercodebox}
${instructions[$name]}
\end{innercodebox}
\end{varwidth}
\end{document}
EOF
  pdflatex -halt-on-error -interaction=batchmode -shell-escape "$name".tex
  rm "$name".{tex,aux,log,pdf}
done
