#!/usr/bin/env bash
module load tex
for commit_count in {2..100}
do
  let linenum="10+$commit_count"
  # add a new sentence to foo.tex
  sed -i "$linenum i This is the first sentence." foo.tex
  # compile the .tex file
  pdflatex foo.tex
  # commit the new files
  git add -u
  git commit -m "Add first sentence to TeX file"
done
