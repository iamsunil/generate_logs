#! /bin/bash
# Sunil Shrestha 
# ASIX
# Projecte 2016
# Descripció:  Script que genera una presentació a partir d'un fitxer markdown

pandoc \
	-t revealjs \
	--template=template-revealjs.html \
	-i \
	--standalone \
	--section-divs \
	--variable theme="black" \
	--variable transition="convex" \
	presentation.md \
	-o presentation.html
