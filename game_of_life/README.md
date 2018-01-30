# The Game of Life - Challenge

A-) The universe of the Game of Life is an infinite two-dimensional
orthogonal grid of square cells, each of which is in one of two possible states, alive or dead,
or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the
cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the
following transitions occur:

- Any live cell with fewer than two live neighbours dies, as if caused by
underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by
overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by
reproduction.

The initial pattern constitutes the seed of the system. The first generation is created
by applying the above rules simultaneously to every cell in the seed—births and
deaths occur simultaneously, and the discrete moment at which this happens is
sometimes called a tick (in other words, each generation is a pure function of the
preceding one). The rules continue to be applied repeatedly to create further
generations. As it appears in https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

Following a BDD paradigm, write the scenarios for 4 rules of the game. This exercice
does not require any implementation, only the scenarios.

B-) Continuing with the previous exercise, write the production code to make the scenarios
pass, taking into account the following restrictions:

- At the end of the exercice all test must pass
- The final code must NOT contain any `if`, `else`, `switch`, `case`, `unless`. The idea
here is to implement the rules without conditionals
- The final code must NOT contain any `while`, `loop`, `do`, if you implement the
solution in Ruby, the word `do` is only allowed for blocks not for loops.

The implementation is required only for the rules of the game, no rendering is required.

# Tests

- Run `bundle install` to install RSpec
- Execute `bundle exec rspec`
