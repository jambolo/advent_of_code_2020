# Advent Of Code 2020
# Day 2

struct Password
    least::Int64
    most::Int64
    letter::Char
    password::String
end

function day02()
    lines = open("day02-input.txt") do f
        readlines(f)
    end

    attempts = parseline.(lines)

    part1n = 0
    part2n = 0
    for a in attempts
        if a.least <= count(==(a.letter), a.password) <= a.most
            part1n += 1
        end
        if (a.password[a.least] == a.letter) ⊻ (a.password[a.most] == a.letter)
            part2n += 1
        end
    end

    println("$part1n valid part 1 passwords and $part2n valid part 2 passwords.")
end

function parseline(line::String)
    m = match(r"(\d+)-(\d+) (\w): (\w+)", line)
    return Password(parse(Int64, m[1]), parse(Int64, m[2]), m[3][1], m[4])
end

