# Advent Of Code 2020
# Day 10

test = false
part1 = false

function day10()
    filename = test ? "day10-test.txt" : "day10-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    joltages = parse.(Int64, lines) |> sort

    if part1
        differences = [0, 0, 1] # Add 1 for the last 3 volt difference
        differences[joltages[1] - 0] += 1   # Add 1 for the difference from 0
        joltageslength = length(joltages)
        for i = 2:joltageslength
            difference = joltages[i] - joltages[i-1]
            differences[difference] += 1
        end
        println("$(differences[1]) 1-volt differences vs. $(differences[3]) 3-volt differences")
        println("The product is $(differences[1]*differences[3])")
    else
        paths = Dict{Int64, Int64}()
        for j in joltages
            paths[j] = 0
        end

        accumulatepaths(paths, 0, 1)
        for j in joltages
            accumulatepaths(paths, j, paths[j])
        end

        println("$(paths[joltages[end]]) possible configurations.")
    end
end

function accumulatepaths(paths, j, k)
    for i = 1:3
        if haskey(paths, j+i)
            paths[j+i] += k
        end
    end
end