# Advent Of Code 2020
# Day 5

test = false
part1 = false

function day05()
    filename = test ? "day05-test.txt" : "day05-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    highest = maximum(to_id.(lines))
    println("Highest id is $highest")

    if !part1
        occupied = fill(false, 1024)
        for line in lines
            id = to_id(line)
            occupied[id + 1] = true
        end

        i = 1
        while !occupied[i]
            i += 1
        end
        while occupied[i]
            i += 1
        end

        println("First unoccupied seat is $(i-1)")
    end

end

function to_id(s::String)
    v = 0
    for c in s
        v = v << 1
        if c == 'B' || c == 'R'
            v += 1
        end
    end
    return v
end
