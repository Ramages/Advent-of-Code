with open('input.txt') as f:
    file_data = f.readlines()
    
file_content = []
visible_trees = 0
rows = []
columns = []
coordinates = []

for i in file_data:
    file_content.append(i.strip("\r\n"))

#[row][column]

#Create 2D matrix
for full_row_string in file_content:
    rows = []
    for number in full_row_string:
        rows.append(int(number))
    coordinates.append(rows)

#calculate the outer ring and add each tree to the num of visible trees (also remove dupes)
for i in range(0, len(file_content)):
    if(coordinates[0][i] > -1):
        if(i != 98):
            visible_trees += 1
    if(coordinates[i][0] > -1):
        if(i != 0):
            visible_trees += 1
    if(coordinates[i][98] > -1):
        if(i != 0):
            visible_trees += 1
    if(coordinates[98][i] > -1):
        if(i != 0):
            visible_trees += 1

#We only need to check the spaces contained by [1, 1] -> [97, 97]
for i in range(1,98):
    for j in range(1,98):
        #North
        if(coordinates[i][j] > coordinates[i + 1][j]):
            visible_trees += 1
        #West
        if(coordinates[i][j] > coordinates[i][j]):
            visible_trees += 1
        #South
        if(coordinates[i][j] > coordinates[i][j]):
            visible_trees += 1
        #East
        if(coordinates[i][j] > coordinates[i][j]):
            visible_trees += 1

print("Len filecont: ",len(file_content))
print("visible trees: ",visible_trees)
print("Last coord: ",coordinates[98][98])
print(99*2+97*2)