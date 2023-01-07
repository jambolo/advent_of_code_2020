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
                passport[m.captures[1]] = m.captures[2]
            end
        else
            if isvalid(passport)
                count += 1
            end
            passport = Dict{String, String}()
        end
    end
    if !isempty(passport)
        if isvalid(passport)
            count += 1
        end
    end
    println("$count valid passports.")
end

function isvalid(passport::Dict{String, String})
    missing = Set{String}()
    if !("byr" in keys(passport)) || (!part1 && !isvalidbyr(passport["byr"]))
        push!(missing, "byr")
    end
    if !("iyr" in keys(passport)) || (!part1 && !isvalidiyr(passport["iyr"]))
        push!(missing, "iyr")
    end
    if !("eyr" in keys(passport)) || (!part1 && !isvalideyr(passport["eyr"]))
        push!(missing, "eyr")
    end
    if !("hgt" in keys(passport)) || (!part1 && !isvalidhgt(passport["hgt"]))
        push!(missing, "hgt")
    end
    if !("hcl" in keys(passport)) || (!part1 && !isvalidhcl(passport["hcl"]))
        push!(missing, "hcl")
    end
    if !("ecl" in keys(passport)) || (!part1 && !isvalidecl(passport["ecl"]))
        push!(missing, "ecl")
    end
    if !("pid" in keys(passport)) || (!part1 && !isvalidpid(passport["pid"]))
        push!(missing, "pid")
    end
    if !("cid" in keys(passport))
        push!(missing, "cid")
    end

    return (length(missing) == 0) || (length(missing) == 1 && "cid" in missing)
end

function isvalidbyr(s::String)
    if match(r"^\d{4}$", s) !== nothing
        year = parse(Int64, s)
        if 1920 <= year <= 2002
            return true
        end
    end
    return false
end

function isvalidiyr(s::String)
    if match(r"^\d{4}$", s) !== nothing
        year = parse(Int64, s)
        if 2010 <= year <= 2020
            return true
        end
    end
    return false
end

function isvalideyr(s::String)
    if match(r"^\d{4}$", s) !== nothing
        year = parse(Int64, s)
        if 2020 <= year <= 2030
            return true
        end
    end
    return false
end

function isvalidhgt(s::String)
    m = match(r"^((\d+)in)|((\d+)cm)$", s)
    if m !== nothing
        if m.captures[1] !== nothing
            height = parse(Int64, m.captures[2])
            if 59 <= height <= 76
                return true
            end
        elseif m.captures[3] !== nothing
            height = parse(Int64, m.captures[4])
            if 150 <= height <= 193
                return true
            end
        end
    end
    return false
end

function isvalidhcl(s::String)
    return match(r"^#[0-9a-zA-Z]{6}$", s) !== nothing
end

function isvalidecl(s::String)
    return match(r"^(amb)|(blu)|(brn)|(gry)|(grn)|(hzl)|(oth)$", s) !== nothing
end 

function isvalidpid(s::String)
    return match(r"^\d{9}$", s) !== nothing
end
