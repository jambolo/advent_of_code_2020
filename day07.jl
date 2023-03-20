# Advent Of Code 2020
# Day 7

test = false
part1 = false

mutable struct Group
    name::String
    count::Int64
end
copy(g::Group) = Group(g.name, g.count)

struct BagInfo
    contains::Array{Group, 1}
    sums::Dict{String, Int64}
end

function day07()
    filename = test ? "day07-test.txt" : "day07-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    bags = Dict{String, BagInfo}()
    for line in lines
        substrings = split(line, ',')
        m = match(r"(\w+ \w+) bags contain (?:(?:no other)|(?:(\d+) (\w+ \w+))) bag", substrings[begin])
        name = m[1]
        bag = BagInfo(Array{Group, 1}(), Dict{String, Int64}())
        if m[2] !== nothing
            count = parse(Int64, m[2])
            other = m[3]
            push!(bag.contains, Group(other, count))
        end
        for s in substrings[2:end]
            m = match(r"(\d+) (\w+ \w+) bag", s)
            count = parse(Int64, m[1])
            other = m[2]
            push!(bag.contains, Group(other, count))
        end
        bags[name] = bag
    end

    for bag in values(bags)
        for c in bag.contains
            groups = Array{Group, 1}()
            include!(bags, groups, c)
            for g in groups
                if haskey(bag.sums, g.name)
                    bag.sums[g.name] += g.count
                else
                    bag.sums[g.name] = g.count
                end
            end
        end
    end

    count = count(bag -> "shiny gold" in keys(bag.sums), value(bags))
    println("shiny gold bags are contained in $count bags")

    if !part1
        shinygoldbag = bags["shiny gold"]
        count = sum(values(shinygoldbag.sums))
        println("A shiny gold bag contains $count bags")
    end
end

function include!(bags::Dict{String, BagInfo}, groups0::Array{Group, 1}, g::Group)
    bag = bags[g.name]
    groups1 = Array{Group, 1}()
    for c in bag.contains
        include!(bags, groups1, c)
    end
    push!(groups0, copy(g))
    for g1 in groups1
        g1.count *= g.count
    end
    append!(groups0, groups1)
end
