using DelimitedFiles
input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/advent_of_code_2020_julia/6_input.txt";
input = readdlm(input_file_dir, '\n', skipblanks=false)
input = vcat(input,"")
parsed_input = []
entries_temp = []
entries_index = []

#part 1
b = 0
for x in 1:length(input[:,1])
    if input[x] ≠ ""
        append!(entries_temp, x)
    elseif input[x] == ""
        push!(entries_index, entries_temp)
        entries_temp = []
        b+=1
    end
end
entries = [split(join(input[entries_index[x]], " "), " ") for x in 1:b];
total = sum(length.(unique.(join.(entries))))
println(total)
#part 2
a = 0
for entry in entries
    unique_chars = join(unique(join(join.(unique.(entry)))))
    for char in unique_chars
        if sum(contains.(entry,char)) == length(entry)
            a += 1
        end
    end
end
println(a)
