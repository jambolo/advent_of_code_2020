# Advent Of Code 2020
# Day 3

test = false
part1 = false

function day03()
    filename = test ? "day03-test.txt" : "day03-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    height = length(lines)
    width = length(lines[1])

    if part1
        part1count = traverse(lines, width, height, 3, 1)
        println("part 1: $part1count trees.")
    else
        slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
        part2product = 1
        for (dj, di) in slopes
            count = traverse(lines, width, height, dj, di)
            println("part 2: ($dj, $di): $count trees.")
            part2product *= count
        end
        println("part 2: $part2product trees.")
    end
end

function traverse(lines, width, height, dj, di)
    i = 1
    j = 1
    count = 0
    while i <= height
        line = lines[i]
        if line[j] == '#'
            count += 1
        end
        i = i + di
        j = (j - 1 + dj) % width + 1
    end
    return count
end