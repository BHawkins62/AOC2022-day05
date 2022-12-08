# Day 5
# written in Julia

# Part One

open("input.txt") do file
    num_stacks, num_crates, count = 0, 0, 0
    message = ""
    array_of_stacks = Any[]
    reading_stacks = true
    input = readlines(file)
    for (num_lines, line) in enumerate(input)
        if occursin("1", line)
            num_stacks = (length(line) ÷ 4 + 1)
            num_crates = (num_lines - 1)
            break
        end
    end
    location_seed = -2
    for i in 1 : num_stacks
        location = 4 * i + location_seed
        varray = []
        for line in range(start=num_crates, stop=1, step=-1)
            if input[line][location] ≠ ' '
                push!(varray, input[line][location])
            else
                continue
            end
        end     
        push!(array_of_stacks, varray)
    end
    for lines in range(start=num_crates + 3, stop=length(input))
        move_str = (input[lines])
        (qty, from, to) = deleteat!(split(move_str), [true, false, true, false, true, false])
        for move in 1 : parse(Int, qty)
            tmp = pop!(array_of_stacks[parse(Int, from)])
            push!(array_of_stacks[parse(Int, to)], tmp)
            tmp = []
        end
    end 
    for x in 1 : num_stacks
        str = pop!(array_of_stacks[x])
        message *= str
    end
    println("Message: $message")
end

# Part Two

open("input.txt") do file
    num_stacks, num_crates, count = 0, 0, 0
    message = ""
    array_of_stacks = Any[]
    src =[]
    reading_stacks = true
    input = readlines(file)
    for (num_lines, line) in enumerate(input)
        if occursin("1", line)
            num_stacks = (length(line) ÷ 4 + 1)
            num_crates = (num_lines - 1)
            break
        end
    end
    location_seed = -2
    for i in 1 : num_stacks
        location = 4 * i + location_seed
        varray = []
        for line in range(start=num_crates, stop=1, step=-1)
            if input[line][location] ≠ ' '
                push!(varray, input[line][location])
            else
                continue
            end
        end     
        push!(array_of_stacks, varray)
    end
    for lines in range(start=num_crates + 3, stop=length(input))
        move_str = (input[lines])
        (qty, from, to) = deleteat!(split(move_str), [true, false, true, false, true, false])
        for move in 1 : parse(Int, qty)
            tmp = pop!(array_of_stacks[parse(Int, from)])
            push!(src, tmp)         
        end
        reverse!(src)
        append!(array_of_stacks[parse(Int, to)], src)
        tmp, src = [], []
    end 
    for x in 1 : num_stacks
        str = pop!(array_of_stacks[x])
        message *= str
    end
    println("Message: $message")
end