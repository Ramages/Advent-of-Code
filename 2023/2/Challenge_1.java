package Package.src;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Challenge_1 {

	public static void main(String[] args) {
		int game_sums = 0;
		
		boolean valid_game = true;

		try {
			File input = new File("input.txt");
			Scanner reader = new Scanner(input);
			
			while (reader.hasNextLine()) 
			{
				String data = reader.nextLine();
				String full_str = data.substring(5);
				
				int column_index = full_str.indexOf(':');
				String row_number = full_str.substring(0, column_index);
				
				String content = full_str.substring(column_index + 2, full_str.length());
				
				String[] all_clr_vals = content.split(";");
				String[] clr_val_grp;
				String[] clr_val;
				
				for(int i = 0; i < all_clr_vals.length; i++) 
				{
					if(i > 0) 
					{
						all_clr_vals[i] = all_clr_vals[i].substring(1);
					}

					clr_val_grp = all_clr_vals[i].split(",");
					for(int j = 0; j < clr_val_grp.length; j++) 
					{
						if(j > 0) 
						{
							clr_val_grp[j] = clr_val_grp[j].substring(1);
						}

						clr_val= clr_val_grp[j].split(" ");

						if(Integer.parseInt(clr_val[0]) > 12 && clr_val[1].contains("red")) 
						{
							valid_game = false;
						}
						if(Integer.parseInt(clr_val[0]) > 13 && clr_val[1].contains("green")) 
						{
							valid_game = false;
						}
						if(Integer.parseInt(clr_val[0]) > 14 && clr_val[1].contains("blue"))
						{
							valid_game = false;
						}
					}
				}
				if(valid_game == true) 
				{
					game_sums += Integer.parseInt(row_number);
				}
				valid_game = true;
			}
			reader.close();
			System.out.println("Answer: " + game_sums);
		}
		catch (FileNotFoundException e) 
		{
			System.out.println("Error, file not found");
			e.printStackTrace();
		}
	}
}
