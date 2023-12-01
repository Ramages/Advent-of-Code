def taskOne():
    opponent_rock = "A"
    opponent_paper = "B"
    opponent_scissors = "C"

    me_rock = "X"
    me_paper = "Y"
    me_scissors = "Z"

    point_rock = 1
    point_paper = 2
    point_scissors = 3

    point_loss = 0
    point_draw = 3
    point_win = 6

    total_score = 0

    for line in open("input.txt","r"):
        if(line[0] == opponent_rock and line[2] == me_paper):
            total_score = total_score + point_win + point_paper
        if(line[0] == opponent_paper and line[2] == me_scissors):
            total_score = total_score + point_win + point_scissors
        if(line[0] == opponent_scissors and line[2] == me_rock):
            total_score = total_score + point_win + point_rock
        if(line[0] == opponent_rock and line[2] == me_rock):
            total_score = total_score + point_draw + point_rock
        if(line[0] == opponent_scissors and line[2] == me_scissors):
            total_score = total_score + point_draw + point_scissors
        if(line[0] == opponent_paper and line[2] == me_paper):
            total_score = total_score + point_draw + point_paper
        if(line[0] == opponent_rock and line[2] == me_scissors):
            total_score = total_score + point_loss + point_scissors
        if(line[0] == opponent_scissors and line[2] == me_paper):
            total_score = total_score + point_loss + point_paper
        if(line[0] == opponent_paper and line[2] == me_rock):
            total_score = total_score + point_loss + point_rock
        
    print("Your total score is: ", total_score)

def taskTwo():
    opponent_rock = "A"
    opponent_paper = "B"
    opponent_scissors = "C"

    me_rock = "X"
    me_paper = "Y"
    me_scissors = "Z"

    need_loss = "X"
    need_draw = "Y"
    need_win = "Z"

    point_rock = 1
    point_paper = 2
    point_scissors = 3

    point_loss = 0
    point_draw = 3
    point_win = 6

    total_score = 0

    for line in open("input.txt","r"):
        if(line[0] == opponent_rock and line[2] == need_loss):
            total_score = total_score + point_loss + point_scissors
        if(line[0] == opponent_rock and line[2] == need_draw):
            total_score = total_score + point_draw + point_rock
        if(line[0] == opponent_rock and line[2] == need_win):
            total_score = total_score + point_win + point_paper
            
        if(line[0] == opponent_paper and line[2] == need_loss):
            total_score = total_score + point_loss + point_rock
        if(line[0] == opponent_paper and line[2] == need_draw):
            total_score = total_score + point_draw + point_paper
        if(line[0] == opponent_paper and line[2] == need_win):
            total_score = total_score + point_win + point_scissors
            
        if(line[0] == opponent_scissors and line[2] == need_loss):
            total_score = total_score + point_loss + point_paper
        if(line[0] == opponent_scissors and line[2] == need_draw):
            total_score = total_score + point_draw + point_scissors
        if(line[0] == opponent_scissors and line[2] == need_win):
            total_score = total_score + point_win + point_rock

    print("Your total score is: ", total_score)

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