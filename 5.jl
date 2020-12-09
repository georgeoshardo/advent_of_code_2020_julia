
using DelimitedFiles

input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/advent_of_code_2020_julia/5_input.txt";

input = readdlm(input_file_dir, '\n');
function get_seat_number(ticket)
    upper_ROWS = 127
    lower_ROWS = 0
    for char in ticket[1:7]
        if char == 'F'
            upper_ROWS = convert(Int, floor((lower_ROWS + upper_ROWS)/2))
        elseif char == 'B'
            lower_ROWS = convert(Int,ceil((lower_ROWS + upper_ROWS)/2))
        end
    end
    upper_COLUMNS = 7
    lower_COLUMNS = 0
    for char in ticket[8:end]
        if char == 'L'
            upper_COLUMNS = convert(Int,floor((lower_COLUMNS + upper_COLUMNS)/2))
        elseif char == 'R'
            lower_COLUMNS = convert(Int,ceil((lower_COLUMNS + upper_COLUMNS)/2))
        end
    end
    seat_ID = upper_ROWS * 8 + lower_COLUMNS
    return upper_ROWS, lower_COLUMNS, seat_ID
end

function run()

    #part 1

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
end
run()
@time run()