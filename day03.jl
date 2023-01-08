# Advent Of Code 2020
# Day 3

test = false
part1 = false

function day03()
    filename = test ? "day03-test.txt" : "day03-input.txt"
    map = open(filename) do f
        readlines(f)
    end

    if part1
        part1count = traverse(map, (3, 1))
        println("part 1: $part1count trees.")
    else
        slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
        part2product = prod(slope -> traverse(map, slope), slopes)
        println("part 2: $part2product trees.")
    end
end

function traverse(map, (dj, di))
    height = length(map)
    width = length(map[1])
    i = 1
    j = 1
    count = 0
    while i <= height
        line = map[i]
        if line[j] == '#'
            count += 1
        end
        i = i + di
        j = (j - 1 + dj) % width + 1
    end
    return count
end