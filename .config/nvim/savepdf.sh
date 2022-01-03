#!/bin/sh
echo $1
echo ${1::-3}
OUTPUT=$(echo $1 | rev | cut -d'/' -f2- | rev )
OUTPUT="${OUTPUT}/img/"
echo "${OUTPUT}"
pandoc --pdf-engine=xelatex $1 \
	-o ${1::-3}'.pdf' \
	-V linkcolor:blue \
	-V geometry:a4paper \
	-V geometry:margin=2cm \
	-V mainfont="DejaVu Serif" \
	-V monofont="DejaVu Sans Mono" \
	--toc \
	--resource-path=$OUTPUT \
	-H disable_float.tex \
	&
