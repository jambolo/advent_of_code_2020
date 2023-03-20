# Advent of Code 2020

My solutions for Advent of Code 2020 implemented in Julia

### Day 1
Julia provides no extra benefit.

### Day 2
Again no special benefit of Julia, but I'm thankful that Julia has regex support, and I like the array
functions with predicates and the fact that comparisons can be chained.

### Day 3
Modular arithmetic is a pain when dealing with array indexes because of the 1-based indexing.

### Day 4
Regex support is key.

### Day 5
Basic binary conversion.

### Day 6
Support of sets in Julia helped.

### Day 7
Had problems with mutability and recursion in julia. I had problems with a complicated regex and a clunky IDE.

### Day 8
Probably could have optimized, but there is no need. Waiting to get to some meaty vector reduction puzzles that can show the power of julia.

### Day 9
One annoyance with julia is that there are **many** library names in the global namespace that sometimes (for reasons that are not clear to me) will collide with local names.

### Day 10
Finally, a puzzle with a little bit of a challenge. Is there a way to create a Dict element initialized to 0 simply by referencing it? I could avoid having to use haskey() to know if I need to create the entry first.