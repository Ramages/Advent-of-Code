with open('input.txt') as f:
    lines = f.readlines()
    
input_items = []
dir_list = []
dir_dict = {}
current_folder = ""

for i in lines:
    input_items.append(i.strip("\r\n"))
    
#Manually add root folder
dir_list.append("/")
dir_dict["/"] = 0

current_folder += "/"

for line in input_items:
    #If the line is a ls command
    if line == "$ ls":
        continue
    
    #if the line is a cd command, add it to the current dir string
    if line[0:4] == "$ cd" and line[0:7] != "$ cd ..":
        if line[0:6] != "$ cd /":
            current_folder += line[5:] + "/"
    
    if line[0].isdigit():
        dastringi = ""
        for char in line:
            if char.isdigit():
                dastringi += char
        if current_folder != "/":
            temp = current_folder[0:(len(current_folder)-1)]
            position = temp.rfind("/")
            dir_dict.update({current_folder : int(dastringi)})
            
        else:
            dir_dict["/"] = dir_dict["/"] + int(dastringi)
    
    #When we move up a folder
    if line[0:7] == "$ cd ..":
        print("Dir goin in: ", current_folder)
        temp = current_folder[0:(len(current_folder)-1)]

        #if the folder isnt the root folder, we need to isolate the current directory name and get the size of that folder
        if(temp.rfind("/") != 0):
            position = temp.rfind("/")
            prev_size = dir_dict[current_folder]
            current_folder = current_folder[0:position + 1]
        else:
            position = 1
            prev_size = dir_dict[current_folder]

        #then we need to add the size of the folder we moved out of to the folder we move back into
        if(len(current_folder) > 1):
            dir_dict[current_folder] = dir_dict[current_folder] + prev_size
        else:
            dir_dict["/"] = dir_dict["/"] + prev_size
        print("Dir goin out: ", current_folder)
    

small_files = []
 
 #Get all small values
for key, value in dir_dict.items():
    print(key, ':', value)
    if(value <= 100000):
        print(key, ':', value)
        small_files.append(value)
 
#Print out the answe for question 1 
print("Sum of small files: ", sum(small_files))