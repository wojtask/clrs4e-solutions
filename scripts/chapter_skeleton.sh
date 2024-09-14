#!/usr/bin/env bash

if [[ $* == "--help" || $* == "-h" ]]; then
  echo "Create a chapter skeleton"
  echo "Usage: $0 C S - P"
  echo "C - the chapter number (1, 2, ..., 35) or the appendix letter (A, B, C, D)"
  echo "S - the space delimited numbers (0, 1, ...) of exercises in subsequent sections of the chapter"
  echo "P - the space delimited numbers (0, 1, ...) of subproblems in subsequent problems of the chapter"
  exit 0
fi

if [[ $1 =~ ^[1-9]|[12][0-9]|3[0-5]$ ]]; then
  DIR=chapter$1
elif [[ $1 =~ ^[ABCD]$ ]]; then
  DIR=appendix${1,,}
else
  echo "Invalid chapter number or appendix letter"
  exit 1
fi

if [ -d "$DIR" ]; then
  echo "The directory $DIR already exists, aborting"
  exit 2
fi

shift 1

SUBDIR=sections
SEC_OR_PROB=1

for cnt in "$@"; do
  if [[ $cnt == "-" ]]; then
    SUBDIR=problems
    SEC_OR_PROB=1
    continue
  fi

  if ! [[ $cnt =~ ^[0-9]+$ ]]; then
    echo "Invalid number of exercises or subproblems, aborting"
    rm -fr "$DIR"
    exit 3
  fi

  mkdir -p "$DIR/$SUBDIR/$SEC_OR_PROB"
  if ((cnt == 0)); then
    echo "\workinprogress % TODO" > "$DIR/$SUBDIR/$SEC_OR_PROB/main.tex"
  fi

  SUBPROB=a
  for ((i = 1; i <= cnt; i++)); do
    if [[ $SUBDIR == "sections" ]]; then
      echo "\workinprogress % TODO" > "$DIR/$SUBDIR/$SEC_OR_PROB/$i.tex"
    else
      echo "\workinprogress % TODO" > "$DIR/$SUBDIR/$SEC_OR_PROB/$SUBPROB.tex"
      j=$(printf "%d" "'$SUBPROB'")
      ((j++))
      SUBPROB=$(printf "\x$(printf %x $j)")
    fi
  done
  ((SEC_OR_PROB++))
done
