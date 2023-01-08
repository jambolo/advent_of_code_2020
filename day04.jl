# Advent Of Code 2020
# Day 4

test = false
part1 = false

function day04()
    filename = test ? "day04-test.txt" : "day04-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    count = 0
    passport = Dict{String, String}()
    for line in lines
        if length(line) > 0
            for s in eachsplit(line)
                m = match(r"(\w+):(.+)", s)
                passport[m[1]] = m[2]
            end
        else
            if isvalid(passport)
                count += 1
            end
            passport = Dict{String, String}()
        end
    end
    if !isempty(passport) && isvalid(passport)
        count += 1
    end
    println("$count valid passports.")
end

function isvalid(passport::Dict{String, String})
    if !("byr" in keys(passport)) || (!part1 && !isvalidbyr(passport["byr"]))
        return false
    elseif !("iyr" in keys(passport)) || (!part1 && !isvalidiyr(passport["iyr"]))
        return false
    elseif !("eyr" in keys(passport)) || (!part1 && !isvalideyr(passport["eyr"]))
        return false
    elseif !("hgt" in keys(passport)) || (!part1 && !isvalidhgt(passport["hgt"]))
        return false
    elseif !("hcl" in keys(passport)) || (!part1 && !isvalidhcl(passport["hcl"]))
        return false
    elseif !("ecl" in keys(passport)) || (!part1 && !isvalidecl(passport["ecl"]))
        return false
    elseif !("pid" in keys(passport)) || (!part1 && !isvalidpid(passport["pid"]))
        return false
    end
    return true
end

isvalidbyr(s::String) = match(r"^\d{4}$", s) !== nothing && 1920 <= parse(Int64, s) <= 2002
isvalidiyr(s::String) = match(r"^\d{4}$", s) !== nothing && 2010 <= parse(Int64, s) <= 2020
isvalideyr(s::String) = match(r"^\d{4}$", s) !== nothing && 2020 <= parse(Int64, s) <= 2030

function isvalidhgt(s::String)
    m = match(r"^(\d+)(in|cm)$", s)
    if m === nothing
        return false
    end
    height = parse(Int64, m[1])
    if m[2] == "in"
        if 59 <= height <= 76
            return true
        end
    else
        if 150 <= height <= 193
            return true
        end
    end
    return false
end

isvalidhcl(s::String) = match(r"^#[0-9a-zA-Z]{6}$", s) !== nothing
isvalidecl(s::String) = match(r"^(amb)|(blu)|(brn)|(gry)|(grn)|(hzl)|(oth)$", s) !== nothing
isvalidpid(s::String) = match(r"^\d{9}$", s) !== nothing
