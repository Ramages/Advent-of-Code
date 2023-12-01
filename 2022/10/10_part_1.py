with open('input.txt') as f:
    lines = f.readlines()
    
input_items = []
cycle = 1
X = 1
multiplier = 1
checklist = [20, 60, 100, 140, 180, 220]
values = []
sprite = "###"

for i in lines:
    input_items.append(i.strip("\r\n"))

for line in input_items:
    #print(line)
    if(line == "noop"):
        cycle += 1
        if(cycle in checklist):
            #print(f"X at cycle {cycle} is: {X}")
            values.append(X*cycle)
    if(line[0:4] == "addx"):
        cycle += 1
        if(cycle in checklist):
            #print(f"X at cycle {cycle} is: {X}")
            values.append(X*cycle)
        X += int(line[5:len(line)])
        cycle += 1
        if(cycle in checklist):
            #print(f"X at cycle {cycle} is: {X}")
            values.append(X*cycle)
    
    #print("Cycle is: ", cycle)
    
print("Values are: ", values)
print("Sum is: ", sum(values))