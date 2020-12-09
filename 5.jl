using DelimitedFiles

input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/advent_of_code_2020_julia/5_input.txt";

input = readdlm(input_file_dir, '\n');

#part 1
function get_seat_number(ticket)
    upper_ROWS = 127
    lower_ROWS = 0
    for char in ticket[1:7]
        if char == 'F'
            upper_ROWS = floor((lower_ROWS + upper_ROWS)/2)
        elseif char == 'B'
            lower_ROWS = ceil((lower_ROWS + upper_ROWS)/2)
        end
    end
    upper_COLUMNS = 7
    lower_COLUMNS = 0
    for char in ticket[8:end]
        if char == 'L'
            upper_COLUMNS = floor((lower_COLUMNS + upper_COLUMNS)/2)
        elseif char == 'R'
            lower_COLUMNS = ceil((lower_COLUMNS + upper_COLUMNS)/2)
        end
    end
    seat_ID = upper_ROWS * 8 + lower_COLUMNS
    return upper_ROWS, lower_COLUMNS, seat_ID
end

tickets = [get_seat_number(ticket) for ticket in input]
println(maximum(maximum.(tickets)))

#part 2
IDs = sort([ticket[3] for ticket in tickets], dims = 1)
numbers = collect(IDs[1]:IDs[end])
for x in 1:length(IDs)
    if IDs[x] ≠ numbers[x]
        print(x)
        break
    end
end