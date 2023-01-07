# Advent Of Code 2020
# Day 6

test = false
part1 = true

function day06()
    filename = test ? "day06-test.txt" : "day06-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    groups = Array{Set{Char}, 1}()
    group = Set{Char}()
    intersections = Array{Set{Char}, 1}()
    intersection = Set{Char}()
    initialized = false
    for line in lines
        if isempty(line)
            push!(groups, group)
            push!(intersections, intersection)
            group = Set{Char}()
            intersection = Set{Char}()
            initialized = false
        else
            person = Set{Char}()
            for c in line
                push!(group, c)
                push!(person, c)
            end
            if initialized
                intersect!(intersection, person)
            else
                intersection = person
                initialized = true
            end
        end
    end
    
    if !isempty(group)
        push!(groups, group)
    end

    if !isempty(intersection)
        push!(intersections, intersection)
    end

    part1sum = 0
    for g in groups
        part1sum += length(g)
    end

    println("part1sum is $part1sum")

    part2sum = 0
    for i in intersections
        part2sum += length(i)
    end

    println("part2sum is $part2sum")
end
