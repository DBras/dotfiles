#!/bin/sh
echo -n "Input path: "
echo $1
echo -n "Output path: "
echo ${1::-3}'.pdf'
OUTPUT=$(echo $1 | rev | cut -d'/' -f2- | rev )
OUTPUT="${OUTPUT}/img/"
echo -n "Image folder: "
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
	-H $HOME/.config/nvim/disable_float.tex \
	&
