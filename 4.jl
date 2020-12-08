using DelimitedFiles
function run()
input_file_dir = "/home/georgeos/Documents/GitHub/advent_of_code_2020_julia/advent_of_code_2020_julia/4_input.txt";
input = readdlm(input_file_dir, '\n', skipblanks=false)

parsed_input = []
passport_entries_temp = []
passport_entries_index = []
b = 0
for x in 1:length(input[:,1])
    if input[x] ≠ ""
        append!(passport_entries_temp, x)
    elseif input[x] == ""
        push!(passport_entries_index, passport_entries_temp)
        passport_entries_temp = []
        b+=1
    end
end

passports = [split(join(input[passport_entries_index[x]], " "), " ") for x in 1:b];
fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
a = 0
valid_passports_1 = []
for passport in passports
    occurs_bools = sum.([occursin.(field, passport) for field in fields])
    if sum(occurs_bools) == 8 || (occurs_bools[8] == false && sum(occurs_bools) == 7)
        a += 1
        if sum(occurs_bools) == 8
            deleteat!(sort!(passport),2)
            push!(valid_passports_1, sort!(passport))
        else
            push!(valid_passports_1, sort!(passport))
        end
    end
end
c = 0
valid_chars = vcat(collect('0':'9'), collect('a':'f'))
for passport in valid_passports_1
    passport_split = split.(passport,":")
    byr = parse(Int, passport_split[1][2])
    ecl = passport_split[2][2]
    eyr = parse(Int, passport_split[3][2])
    hcl =  passport_split[4][2]
    if occursin("cm", passport_split[5][2])
        hgt = parse(Int, split(passport_split[5][2],"cm")[1])
    else
        hgt = parse(Int, split(passport_split[5][2],"in")[1]) * 2.54
    end
    iyr = parse(Int, passport_split[6][2])
    pid = passport_split[7][2]
    if 1920 ≤ byr ≤ 2002 && 
        2010 ≤ iyr ≤ 2020 && 
        2020 ≤ eyr ≤ 2030 && 
        150 ≤ hgt ≤ 193 && 
        (hcl[1] == '#' && length(hcl) == 7 && sum(occursin.(split(hcl, ""), join(valid_chars))) == 6) &&
        occursin(ecl, "amb blu brn gry grn hzl oth") &&
        (length(pid) == 9 && strip(pid,'0')[end] ≠ '0')

        c+=1
    end
end
end