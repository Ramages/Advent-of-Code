def first_chars(str)
  if(str != nil)
    str = str[0..str.index('=') - 2]
  end
end

def lr_combo(str)
  if(str != nil)
    str = str[str.index('=') + 3..-2]
  end
end

input = File.open("input.txt")
file_data = input.readlines.map(&:chomp)
leftright = file_data[0]
letter_combos = file_data[2..-1]
hashes = {}

for i in 0..letter_combos.length()
  if(first_chars(letter_combos[i]) != nil && lr_combo(letter_combos[i]) != nil)
    hashes[first_chars(letter_combos[i])] = lr_combo(letter_combos[i])
  end
end

current_value = ""
walks = 0
lr_tracker = 0

A_list = Array[]
Z_list = Array[]
final_list = Array[]

for i in 0..letter_combos.length()
  if(first_chars(letter_combos[i]) != nil && lr_combo(letter_combos[i]) != nil)
    if(first_chars(letter_combos[i])[2] == 'A')
      A_list.push(first_chars(letter_combos[i]))
    end
    if(first_chars(letter_combos[i])[2] == 'Z')
      Z_list.push(first_chars(letter_combos[i]))
    end
  end
end

for i in 0..A_list.length()
  current_value = A_list[i]
  while(current_value != nil && current_value[2] != "Z")
  current_options = hashes[current_value]

    if(leftright[lr_tracker] == 'L')
      current_value = current_options[0..2]
      walks += 1
    else
      current_value = current_options[5..7]
      walks += 1
    end
    current_options = hashes[current_value]

    if(lr_tracker + 1 == leftright.length)
      lr_tracker = 0
    else
      lr_tracker += 1
    end
  end
  final_list.push(walks)
  walks = 0
end

final_list.pop()
puts("Part 2: ", final_list.reduce(1, :lcm))
