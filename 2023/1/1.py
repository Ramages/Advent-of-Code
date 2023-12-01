def challenge_1():
    num_str = ""
    num_pairs = []
    found_numbers = []

    final_sum = 0

    file = open("input.txt", "r")
    input_content = file.readlines()
    for string in input_content:
        for character in string:
            if character.isdigit():
                num_str += character

        if len(num_str) == 1:
            num_pairs.append(int(num_str+num_str))

        else:
            num_pairs.append(int(num_str[0]+num_str[-1]))
        num_str = ""
 
    print("Sum: ", sum(num_pairs))


def challenge_2():
    num_str = ""
    num_pairs = []
    found_numbers = []

    final_sum = 0

    file = open("input.txt", "r")
    input_content = file.readlines()

    for string in input_content:
        if string.find("1") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("1", i)]
            for i in the_list:
                num_str = "1_" + str(i)
                found_numbers.append(num_str)
        if string.find("2") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("2", i)]
            for i in the_list:
                num_str = "2_" + str(i)
                found_numbers.append(num_str)
        if string.find("3") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("3", i)]
            for i in the_list:
                num_str = "3_" + str(i)
                found_numbers.append(num_str)
        if string.find("4") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("4", i)]
            for i in the_list:
                num_str = "4_" + str(i)
                found_numbers.append(num_str)
        if string.find("5") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("5", i)]
            for i in the_list:
                num_str = "5_" + str(i)
                found_numbers.append(num_str)
        if string.find("6") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("6", i)]
            for i in the_list:
                num_str = "6_" + str(i)
                found_numbers.append(num_str)
        if string.find("7") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("7", i)]
            for i in the_list:
                num_str = "7_" + str(i)
                found_numbers.append(num_str)
        if string.find("8") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("8", i)]
            for i in the_list:
                num_str = "8_" + str(i)
                found_numbers.append(num_str)
        if string.find("9") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("9", i)]
            for i in the_list:
                num_str = "9_" + str(i)
                found_numbers.append(num_str)
        if string.find("one") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("one", i)]
            for i in the_list:
                num_str = "1_" + str(i)
                found_numbers.append(num_str)
        if string.find("two") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("two", i)]
            for i in the_list:
                num_str = "2_" + str(i)
                found_numbers.append(num_str)
        if string.find("three") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("three", i)]
            for i in the_list:
                num_str = "3_" + str(i)
                found_numbers.append(num_str)
        if string.find("four") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("four", i)]
            for i in the_list:
                num_str = "4_" + str(i)
                found_numbers.append(num_str)
        if string.find("five") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("five", i)]
            for i in the_list:
                num_str = "5_" + str(i)
                found_numbers.append(num_str)
        if string.find("six") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("six", i)]
            for i in the_list:
                num_str = "6_" + str(i)
                found_numbers.append(num_str)
        if string.find("seven") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("seven", i)]
            for i in the_list:
                num_str = "7_" + str(i)
                found_numbers.append(num_str)
        if string.find("eight") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("eight", i)]
            for i in the_list:
                num_str = "8_" + str(i)
                found_numbers.append(num_str)
        if string.find("nine") != -1:
            the_list = [i for i in range(len(string)) if string.startswith("nine", i)]
            for i in the_list:
                num_str = "9_" + str(i)
                found_numbers.append(num_str)
        
        if len(found_numbers) == 1:
            result = int(found_numbers[0][0] + found_numbers[0][0])
            num_pairs.append(result)
        else:
            index_list = []
            for i in range(len(found_numbers)):
                index_list.append(int(found_numbers[i][2:]))

            first = found_numbers[index_list.index(min(index_list))]
            second = found_numbers[index_list.index(max(index_list))]

            num_pairs.append(int(first[0] + second[0]))
        
        
        num_str = ""
        found_numbers.clear()

    print("Sum: ", sum(num_pairs))
    

def main():
    user_choice = -1
    while user_choice != '0':
        user_choice = input("Make a choice to solve challenge 1 or 2, or enter 0 to exit: ")
        if(user_choice == '1'):
            challenge_1()
        if(user_choice == '2'):
            challenge_2()
        if(user_choice == '0'):
            exit()
        if(user_choice != '1' and user_choice != '2' and user_choice != '2'):
            print("Error, incorrect usage. Please enter 1 or 2, or 0 to exit")
    
    
if __name__ == "__main__":
    main()