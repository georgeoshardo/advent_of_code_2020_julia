using DelimitedFiles
input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/advent_of_code_2020_julia/1_input.txt";
input = readdlm(input_file_dir, '\n', Int);
## Part 1
unique([x*y for x in input for y in input if x+y == 2020])
## Part 2
unique([x*y*z for x in input for y in input for z in input if x+y+z == 2020])