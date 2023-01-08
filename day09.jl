# Advent Of Code 2020
# Day 9

test = false
part1 = false

function day09()
    filename = test ? "day09-test.txt" : "day09-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    if test
        preamblesize = 5
    else
        preamblesize = 25
    end

    numbers = parse.(Int64, lines)
    numberslength = length(numbers)
    n = 0
    for i = preamblesize+1:numberslength
        n = numbers[i]
        if !pairfound(numbers, i-preamblesize, i-1, n)
            println("Can't find the pair for $n at $i in the range $(i-preamblesize):$(i-1)")
            break
        end
    end

    if !part1
        first, last = findrange(numbers, n)
        lowest = minimum(numbers[first:last])
        highest = maximum(numbers[first:last])
        println("Range found at $first:$last -- $(numbers[first:last])")
        println("Lowest is $lowest, highest is $highest")
        println("Sum of lowest and highest is $(lowest + highest)")
    end
end

function pairfound(numbers, first, last, n)
    for i = first + 1:last
        ni = numbers[i]
        for j = first:i-1
            nj = numbers[j]
            if ni + nj == n
                return true
            end
        end
    end
    return false
end

function findrange(numbers, n)
    numberslength = length(numbers)
    for i = 1:numberslength-1
        k = numbers[i] + numbers[i + 1]
        j = i + 2
        while k < n
            k += numbers[j]
            j += 1
        end
        if k == n
            return (i, j - 1)
        end
    end
end
