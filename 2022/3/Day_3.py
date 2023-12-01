char_dict = {
    "a" : 1,
    "b" : 2,
    "c" : 3,
    "d" : 4,
    "e" : 5,
    "f" : 6,
    "g" : 7,
    "h" : 8,
    "i" : 9,
    "j" : 10,
    "k" : 11,
    "l" : 12,
    "m" : 13,
    "n" : 14,
    "o" : 15,
    "p" : 16,
    "q" : 17,
    "r" : 18,
    "s" : 19,
    "t" : 20,
    "u" : 21,
    "v" : 22,
    "w" : 23,
    "x" : 24,
    "y" : 25,
    "z" : 26,
    "A" : 27,
    "B" : 28,
    "C" : 29,
    "D" : 30,
    "E" : 31,
    "F" : 32,
    "G" : 33,
    "H" : 34,
    "I" : 35,
    "J" : 36,
    "K" : 37,
    "L" : 38,
    "M" : 39,
    "N" : 40,
    "O" : 41,
    "P" : 42,
    "Q" : 43,
    "R" : 44,
    "S" : 45,
    "T" : 46,
    "U" : 47,
    "V" : 48,
    "W" : 49,
    "X" : 50,
    "Y" : 51,
    "Z" : 52
}

def taskOne():
    item_one = ""
    item_two = ""
    total_score = 0
    character_found = ""

    with open("input.txt","r") as f:
        file_content = [line.rstrip() for line in f]

    for item in file_content:
        item_one = item[:int(len(item)/2)]
        item_two = item[int(len(item)/2):]
        
        for character in item_one:
            if(character in item_two):
                character_found = character
        
        total_score = total_score + char_dict[character_found]    

    print("Your Answer is: ", total_score)

def taskTwo():
    item_one = ""
    item_two = ""
    item_three = ""
    total_score = 0
    character_found = ""
    counter = 0

    with open("input.txt","r") as f:
        file_content = [line.rstrip() for line in f]

    while(counter <= 297):
        item_one = file_content[counter]
        item_two = file_content[counter + 1]
        item_three = file_content[counter + 2]
        
        for character in item_one:
            if(character in item_two and character in item_three):
                character_found = character
        total_score = total_score + char_dict[character_found]    
        counter += 3

    print("Your Answer is: ", total_score)

def main():
    choice = int(input("Would you like the answer for question 1 or 2?: "))
    if(choice == 1):
        taskOne()
    
    if(choice == 2):
        taskTwo()

    if(choice != 1 and choice != 2):
        print("Please enter only 1 or 2")

if __name__ == "__main__":
    main()