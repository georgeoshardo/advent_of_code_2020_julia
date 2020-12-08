using DelimitedFiles

input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/1_input.txt";

input = readdlm(input_file_dir, '\n', Int);

## Part 1

for x ∈ input
    for y ∈ input
        if x + y == 2020
            println(x * y)
        end
    end
end

## Part 2

for x ∈ input
    for y ∈ input
        for z ∈ input
            if x + y + z == 2020
                println(x * y * z)
            end
        end
    end
end