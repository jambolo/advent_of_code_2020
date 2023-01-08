# Advent Of Code 2020
# Day 8

test = false
part1 = false

struct Instruction
    op::String
    value::Int64
end

function day08()
    filename = test ? "day08-test.txt" : "day08-input.txt"
    lines = open(filename) do f
        readlines(f)
    end

    instructions = parseline.(lines)
    if part1
        _, accumulator, _ = execute(instructions)
        println("Accumulator before first repeated instruction = $accumulator")
    else
        _, _, corrupted = execute(instructions)

        for i in corrupted
            instruction = instructions[i]
            if instruction.op == "jmp"
                instructions[i] = Instruction("nop", instruction.value)
            elseif instruction.op == "nop"
                instructions[i] = Instruction("jmp", instruction.value)
            end
            finished, accumulator, _ = execute(instructions)
            if finished
                println("Fixed instruction $i: $instruction")
                println("Accumulator after execution = $accumulator")
                break;
            end
            instructions[i] = instruction
        end
    end
end

function parseline(line::String)
    op, value = split(line)
    return Instruction(op, parse(Int64, value))
end

function execute(instructions::Array{Instruction, 1})
    len = length(instructions)
    executed = fill(false, len)
    accumulator = 0
    corrupted = Set{Int64}()
    i = 1
    while i <= len && !executed[i] 
        executed[i] = true
        instruction = instructions[i]
        if instruction.op == "jmp"
            push!(corrupted, i)
            i += instruction.value - 1
            if !(0 <= i <= len) 
                return (false, nothing, nothing)
            end
        elseif instruction.op == "acc"
            accumulator += instruction.value
        else # assuming nop
            push!(corrupted, i)
        end
        i += 1 
    end
    return (i > len, accumulator, corrupted)
end