input_items = IO.readlines("input.txt")
dir_list = Array.new
dir_dict = Hash.new
current_folder = ""

dir_list.push("/")
dir_dict["/"] = 0

current_folder += "/"

for line in input_items
	if line == "$ ls"
		next
	end
		
	if line[0,4] == "$ cd" and line[0,7] != "$ cd .."
        if line[0,6] != "$ cd /"
            current_folder += line[5,line.length] + "/"
		end
	end
	
	if line[0] =~ /[0-9]/
        filesize = ""
        line.each_char{ |c|
			if c =~ /[0-9]/
                filesize += c
			end
		}
        if current_folder != "/"
            if dir_dict.key?(current_folder)
                dir_dict[current_folder] = dir_dict[current_folder] + filesize.to_i
            else
                dir_dict[current_folder] = filesize.to_i
            end
			
            placeholder = current_folder
            this_file = filesize.to_i
            
            while(current_folder != "/")
                temp = current_folder[0,(current_folder.length - 1)]
                position = temp.rindex(/\//)
                current_folder = current_folder[0,position + 1]
                if dir_dict.key?(current_folder)
                    dir_dict[current_folder] = dir_dict[current_folder] + this_file
                else
                    dir_dict[current_folder] = this_file
				end
			end
            current_folder = placeholder
        else
            dir_dict["/"] = dir_dict["/"] + filesize.to_i
		end
	end
	
	if line[0,7] == "$ cd .."
        temp = current_folder[0,(current_folder.length-1)]

        #if the folder isnt the root folder, we need to isolate the current directory name and get the size of that folder
        if(temp.rindex(/\//) != 0)
            position = temp.rindex(/\//)
            current_folder = current_folder[0,position + 1]
        else
            position = 1
            prev_size = dir_dict[current_folder]
		end
	end
end

small_files = Array.new
big_files = Array.new

dir_dict.each do |key, value|
	if(value <= 100000)
        small_files.append(value)
	end
    if(value >= (30000000 - (70000000 - dir_dict["/"])))
        big_files.append(value)
    end
end

big_files = big_files.sort
question_1 = 0
small_files.each{ |a| question_1 += a}
question_2 = big_files[0]

puts "The answer for question 1 is: %d" % [question_1] 
puts "The answer for question 2 is: %d" % [question_2]