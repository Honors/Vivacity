Description
===========
A brief, functional implementation of [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life).

Algorithm
=========
1. Reduce a grid to a list of `(living, neighbor count)` tuples.
2. Execute rules on each tuple to determine new living value.
3. Reformat list as grid.