# Advent Of Code 2020
# Day 1

function day01part1()
    lines = open("day01-input.txt") do f
        readlines(f)
    end

    lineslength = length(lines) # Fixes IndexFromLength warning
    found = false
    for i in 2:lineslength
        ni = parse(Int64, lines[i])
        for j in 1:i-1
            nj = parse(Int64, lines[j])
            if ni + nj == 2020
                println("Numbers are $ni and $nj, and product is $(ni * nj)")
                found = true
            end
            found && break
        end
        found && break
    end
    if !found
        println("none found")
    end
end

day01part1()

function day01part2()
    lines = open("day01-input.txt") do f
        readlines(f)
    end

    lineslength = length(lines) # Fixes IndexFromLength warning
    found = false
    for i in 3:lineslength
        ni = parse(Int64, lines[i])
        for j in 2:i-1
            nj = parse(Int64, lines[j])
            for k in 1:j-1
                nk = parse(Int64, lines[k])
                if ni + nj + nk == 2020
                    println("Numbers are $ni and $nj and $nk, and product is $(ni * nj * nk)")
                    found = true
                end
                found && break
            end
            found && break
        end
        found && break
    end
    if !found
        println("none found")
    end
end

day01part2()
