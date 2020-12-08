using DelimitedFiles

input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/3_input.txt";

input = readdlm(input_file_dir, '\n');
skimap_imm = string.(zeros(length(input),length(input[1])));
for i in 1:length(input)
    skimap_imm[i,:] = split(input[i], "") 
end;


function get_tree_count(skimap, slope)
    tiles = length(skimap[:,1]) / length(skimap[1,:]) |> ceil;
    skimap_single = deepcopy(skimap);
    for i in 1:(tiles+1) * slope[1]
        skimap = hcat(skimap,skimap_single)
    end; 
    x_pos = 1; y_pos = 1
    tree_count = 0
    for z in 1:floor(length(skimap[:,1])/slope[2])
        if skimap[y_pos, x_pos] == "#"
            tree_count += 1
        end
        x_pos += slope[1]; y_pos += slope[2]
    end
    tree_count
end

slope = (3, 1)
println(get_tree_count(skimap_imm,slope))

slopes = ((1, 1), (3, 1), (5, 1), (7, 1), (1,2))
t_c = 1
for ind_slope in slopes
    t_c *= get_tree_count(skimap_imm, ind_slope)
end
print(t_c)