use std::fs::read_to_string;
use std::u8;

fn main() {
    println!("Part 1");

    let input_file = "input.txt";
    let file_content = read_lines(input_file); 

    let grid_2D: Vec<Vec<String>> = create_2D(file_content);
    let mut final_sum = 0;

    let mut found_in_north = false;
    let mut found_in_east = false;
    let mut found_in_west = false;
    let mut found_in_south = false;


    //Full 2D loop
    for i in 0..grid_2D.len()
    {
        for j in 0..grid_2D[i].len()
        {
            //If a character is not . or digit
            if(grid_2D[i][j] != "." && !grid_2D[i][j].parse::<u8>().is_ok())
            {
                println!("Found character at Position {}:{}, the character is {}", i, j, grid_2D[i][j]);

                //North
                if(grid_2D[i - 1][j].parse::<u8>().is_ok())
                {
                    println!("Found digit North of character at position {}:{}", i - 1, j);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j + walking_right < 140 && grid_2D[i - 1][j + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i - 1][j + walking_right]);
                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while j - walking_left < 140 && j - walking_left > 0 && grid_2D[i - 1][j - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i - 1][j - walking_left]);
                        if(j - 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        else
                        {
                            break;
                        }
                    }

                    println!("Found the sum  {} in North, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                    found_in_north = true;
                }

                //South
                if(grid_2D[i + 1][j].parse::<u8>().is_ok())
                {
                    println!("Found digit South of character at position {}:{}", i + 1, j);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j + walking_right < 140 && grid_2D[i + 1][j + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i + 1][j + walking_right]);
                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while j - walking_left < 140 && j - walking_left > 0 && grid_2D[i + 1][j - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i + 1][j - walking_left]);
                        if(j - 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        else
                        {
                            break;
                        }
                    }

                    println!("Found the sum  {} in South, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                    found_in_south = true;
                }

                //West
                if(grid_2D[i][j - 1].parse::<u8>().is_ok())
                {
                    println!("Found digit West of character at position {}:{}", i, j - 1);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j - 1 + walking_right < 140 && grid_2D[i][j - 1 + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i][j - 1 + walking_right]);

                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while j - 1 - walking_left < 140 && j - 1 - walking_left > 0 && grid_2D[i][j - 1 - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i][j - 1 - walking_left]);
                        if(j - 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        else
                        {
                            break;
                        }
                    }

                    println!("Found the sum  {} in West, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                    found_in_west = true;
                }

                //East
                if(grid_2D[i][j + 1].parse::<u8>().is_ok())
                {
                    println!("Found digit East of character at position {}:{}", i, j + 1);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j + 1 + walking_right < 140 && grid_2D[i][j + 1 + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i][j + 1 + walking_right]);

                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while j + 1 - walking_left < 140 && j + 1 - walking_left > 0 && grid_2D[i][j + 1 - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i][j + 1 - walking_left]);
                        if(j + 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        else
                        {
                            break;
                        }
                    }

                    println!("Found the sum  {} in East, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                    found_in_east = true;
                }

                //Northwest
                if(grid_2D[i - 1][j - 1].parse::<u8>().is_ok() && !found_in_north && !found_in_west)
                {
                    println!("Found digit Northwest of character at position {}:{}", i - 1, j- 1);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j - 1 + walking_right < 140 && grid_2D[i - 1][j - 1 + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i - 1][j - 1 + walking_right]);

                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while grid_2D[i - 1][j - 1 - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i - 1][j - 1 - walking_left]);
                        if(j - 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        if (j - 1 - walking_left == 0 && grid_2D[i - 1][j - 1 - walking_left].parse::<u8>().is_ok())
                        {
                            digit_string.insert_str(0, &grid_2D[i - 1][0]);
                            break;
                        }
                    }

                    println!("Found the sum  {} in Northwest, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                }

                //Northeast
                if(grid_2D[i - 1][j + 1].parse::<u8>().is_ok() && (!found_in_north && !found_in_east))
                {
                    println!("Found digit Northeast of character at position {}:{}", i - 1, j + 1);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j + 1 + walking_right < 140 && grid_2D[i - 1][j + 1 + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i - 1][j + 1 + walking_right]);

                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while grid_2D[i - 1][j + 1 - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i - 1][j + 1 - walking_left]);
                        if(j + 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        if (j + 1 - walking_left == 0 && grid_2D[i - 1][j - 1 - walking_left].parse::<u8>().is_ok())
                        {
                            digit_string.insert_str(0, &grid_2D[i - 1][0]);
                            break;
                        }
                    }

                    println!("Found the sum  {} in Northeast, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                    digit_string.clear();
                }

                //Southwest
                if(grid_2D[i + 1][j - 1].parse::<u8>().is_ok() && !found_in_south && !found_in_west)
                {
                    println!("Found digit Southwest of character at position {}:{}", i + 1, j - 1);
                    let mut walking_right = 0; //-->
                    let mut walking_left: usize = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j - 1 + walking_right < 140 && grid_2D[i + 1][j - 1 + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i + 1][j - 1 + walking_right]);

                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while grid_2D[i + 1][j - 1 - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i + 1][j - 1 - walking_left]);
                        if(j - 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        if (j - 1 - walking_left == 0 && grid_2D[i + 1][0].parse::<u8>().is_ok())
                        {
                            digit_string.insert_str(0, &grid_2D[i + 1][0]);
                            break;
                        }
                    }

                    println!("Found the sum  {} in Southwest, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                }

                //Southeast
                if(grid_2D[i + 1][j + 1].parse::<u8>().is_ok() && !found_in_south && !found_in_east)
                {
                    println!("Found digit Southeast of character at position {}:{}", i + 1, j + 1);
                    let mut walking_right = 0; //-->
                    let mut walking_left = 1;  //<--

                    let mut digit_string = String::from("");

                    //Walking right and adding all found digits
                    while j + 1 + walking_right < 140 && grid_2D[i + 1][j + 1 + walking_right].parse::<u8>().is_ok() {
                        digit_string.push_str(&grid_2D[i + 1][j + 1 + walking_right]);

                        walking_right += 1;
                    }

                    //Walking left and adding all found digits
                    while j + 1 - walking_left < 140 && j + 1 - walking_left > 0 && grid_2D[i + 1][j + 1 - walking_left].parse::<u8>().is_ok() {
                        digit_string.insert_str(0, &grid_2D[i + 1][j + 1 - walking_left]);
                        if(j + 1 - walking_left != 0)
                        {
                            walking_left += 1;
                        }
                        else if (j + 1 - walking_left == 0 && grid_2D[i - 1][j - 1 - walking_left].parse::<u8>().is_ok())
                        {
                            digit_string.insert_str(0, &grid_2D[i + 1][0]);
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                    println!("Found the sum  {} in Southeast, Adding...", digit_string);
                    final_sum += digit_string.parse::<i32>().unwrap();
                    digit_string.clear();
                }

                found_in_north = false;
                found_in_east = false;
                found_in_west = false;
                found_in_south = false;
            }
        }
    }
    
    println!("Final sum is: {}", final_sum);

}


fn read_lines(filename: &str) -> Vec<String> {
    let mut result = Vec::new();

    for line in read_to_string(filename).unwrap().lines() {
        result.push(line.to_string())
    }

    result
}

fn create_2D(input: Vec<String>) -> Vec<Vec<String>> {
    let mut result: Vec<Vec<String>> = Vec::new();

    for i in 0..input.len()
    {
        let mut tmp_vec: Vec<String> = Vec::new();
        for c in input[i].chars()
        {
            tmp_vec.push(c.to_string());
        }
        result.push(tmp_vec);
    }

    result
}
