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
    numbers_written = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine",]

    final_sum = 0

    file = open("input.txt", "r")
    input_content = file.readlines()

    for string in input_content:
        for j in range(1,10):
            if string.find(str(j)) != -1:
                the_list = [i for i in range(len(string)) if string.startswith(str(j), i)]
                for i in the_list:
                    num_str = ("{}_" + str(i)).format(str(j))
                    found_numbers.append(num_str)
        
        for j in range(len(numbers_written)):
            if string.find(numbers_written[j]) != -1:
                the_list = [i for i in range(len(string)) if string.startswith(numbers_written[j], i)]
                for i in the_list:
                    num_str = ("{}_" + str(i)).format(str(numbers_written.index(numbers_written[j]) + 1))
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
