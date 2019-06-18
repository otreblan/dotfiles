#!/bin/bash
TEXTO=$(man $* )
# Verifica si el manual existe
if ! [ -z "$TEXTO" ] ; then
	nvim -R -c 'set ft=man nomod nolist nonumber' - <<< "$TEXTO"
fi
