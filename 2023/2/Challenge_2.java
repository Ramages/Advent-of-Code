package Package.src;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Challenge_2 {

	public static void main(String[] args) {
		int game_sums = 0;
		
		try {
			File input = new File("input.txt");
			Scanner reader = new Scanner(input);
			
			while (reader.hasNextLine()) 
			{
				int red = 0;
				int green = 0;
				int blue = 0;
				
				String data = reader.nextLine();
				String full_str = data.substring(5);
				
				int column_index = full_str.indexOf(':');
				
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

						if(clr_val[1].contains("red")) 
						{
							if(red <= Integer.parseInt(clr_val[0])) 
							{
								red = Integer.parseInt(clr_val[0]);
							}
						}
						if(clr_val[1].contains("green")) 
						{
							if(green <= Integer.parseInt(clr_val[0])) 
							{
								green = Integer.parseInt(clr_val[0]);
							}
						}
						if(clr_val[1].contains("blue"))
						{
							if(blue <= Integer.parseInt(clr_val[0])) 
							{
								blue = Integer.parseInt(clr_val[0]);
							}
						}
					}
				}
				game_sums += red*green*blue;
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