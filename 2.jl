using DelimitedFiles

input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/2_input.txt";

input = readdlm(input_file_dir, ' ');
# Part 1
a = 0
for x ∈ 1:length(input[:,3])
    minchar, maxchar = parse.(Int,split(input[x,1], '-'))
    specialchar = input[x,2][1]
    special_char_count = count(c -> c == specialchar, input[x,3])
    if minchar ≤ special_char_count ≤ maxchar
        a += 1
    end
end
println(a)

#Part 2

a = 0
for x ∈ 1:length(input[:,3])
    charpos1, charpos2 = parse.(Int,split(input[x,1], '-'))
    specialchar = input[x,2][1]
    if (input[x,3][charpos1] == specialchar) ⊻ (input[x,3][charpos2] == specialchar)
        a += 1
    end
end
println(a)