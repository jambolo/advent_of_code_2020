# Advent Of Code 2020
# Day 1

function day01()
    lines = open("day01-input.txt") do f
        readlines(f)
    end

    expenses = parse.(Int64, lines)

    day01_part1(expenses)
    day01_part2(expenses)
end

function day01_part1(expenses::Array{Int64, 1})

    expenseslength = length(expenses) # Fixes IndexFromLength warning
    for i = 2:expenseslength
        ei = expenses[i]
        for j = 1:i-1
            ej = expenses[j]
            if ei + ej == 2020
                println("Part 1: Numbers are $ei and $ej, and product is $(ei * ej)")
                return
            end
        end
    end
end

function day01_part2(expenses::Array{Int64, 1})
    expenseslength = length(expenses) # Fixes IndexFromLength warning
    for i = 3:expenseslength
        ei = expenses[i]
        for j = 2:i-1
            ej = expenses[j]
            for k = 1:j-1
                ek = expenses[k]
                if ei + ej + ek == 2020
                    println("Part 2: Numbers are $ei and $ej and $ek, and product is $(ei * ej * ek)")
                    return
                end
            end
        end
    end
end
