#!/bin/sh

examples="C LL-star composite-java dynamic-scope fuzzy hoistedPredicates import island-grammar java scopes simplecTreeParser treeparser tweak"

for example in $examples; do \
	echo "Running ant $* on $example example."
	(cd $example; ant $*)
done

