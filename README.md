# Tree fractal

This bash script creates a fractal of trees in your terminal.

## Description

The base is a grid of underscores - 63 rows x 100 columns - and the script starts by placing the first and biggest tree at the bottom of the grid, centered.

Each tree is made of a vertical branch and two inclined branch. Each of them is a=power-of-2 long: starting from 32 for the first tree, to 16 for the second and so on.

Each new tree starts where the previous two branches ended, so that each level has double the number of trees of the preceding level.

Given the size of the base grid, the maximum number of levels achievable within it is of 5.

## Usage

Open the terminal, launch the bash script with:

```
./treeFractal.sh
```

and enter the desired number of levels (1 <= N <= 5).