using System;
using System.Text;

namespace part_2
{
    class part_2 {    

        static bool check_pair(string hand)
        {
            List<int> pair = new List<int>();
            int occurance = 0;
            foreach(char c in hand)
            {
                occurance = hand.Count(x => x == c);
                pair.Add(occurance);
            }
            if(pair.Contains(2) && !check_two_pair(hand) && !check_house(hand))
            {
                return true;
            }
            return false;
        }

        static bool check_two_pair(string hand)
        {
            List<int> two_pair = new List<int>();
            int occurance = 0;
            int has_twopair = 0;

            foreach(char c in hand)
            {
                occurance = hand.Count(x => x == c);
                two_pair.Add(occurance);
            }

            for(int i = 0; i < two_pair.Count; i++)
            {
                if(two_pair[i] == 2)
                {
                    has_twopair++;
                }
            }

            if(has_twopair == 4)
            {
                return true;
            }
            return false;
        }
        static bool check_three_of_kind(string hand)
        {
            List<int> tripple = new List<int>();
            int occurance = 0;
            foreach(char c in hand)
            {
                occurance = hand.Count(x => x == c);
                tripple.Add(occurance);
            }
            if(tripple.Contains(3) && !check_house(hand))
            {
                return true;
            }
            return false;
        }
        static bool check_house(string hand)
        {
            List<int> house_check = new List<int>();
            int occurance = 0;
            foreach(char c in hand)
            {
                occurance = hand.Count(x => x == c);
                house_check.Add(occurance);
            }
            if(house_check.Contains(2) && house_check.Contains(3))
            {
                return true;
            }
            return false;
        }

        static bool check_four_of_kind(string hand)
        {
            List<int> quadruple = new List<int>();
            int occurance = 0;
            foreach(char c in hand)
            {
                occurance = hand.Count(x => x == c);
                quadruple.Add(occurance);
            }
            if(quadruple.Contains(4))
            {
                return true;
            }
            return false;
        }

        static bool check_five_of_kind(string hand)
        {
            int occurance = 0;
            foreach(char c in hand)
            {
                occurance = hand.Count(x => x == c);
            }
            if(occurance == 5)
            {
                return true;
            }
            return false;
        }

        static void Main(string[] args)
        {
            List<string> hands = new List<string>();
            List<int> bets = new List<int>();

            int final_sum = 0;
            List<string> final_list = new List<string>();

            //All card combos
            List<List<int>> high_card = new List<List<int>>();
            List<List<int>> pair = new List<List<int>>();
            List<List<int>> two_pair = new List<List<int>>();
            List<List<int>> three_of_kind = new List<List<int>>();
            List<List<int>> house = new List<List<int>>();
            List<List<int>> four_of_kind = new List<List<int>>();
            List<List<int>> five_of_kind = new List<List<int>>();

            Dictionary<string, int> character_to_card = new Dictionary<string, int>(){{"J", 1}, {"2", 2}, {"3", 3}, {"4", 4}, {"5", 5}, {"6", 6}, {"7", 7}, {"8", 8}, {"9", 9}, {"T", 10}, {"Q", 12}, {"K", 13}, {"A", 14}};
            Dictionary<int, string> cardval_to_character = new Dictionary<int, string>(){{1, "J"}, {2, "2"}, {3, "3"}, {4, "4"}, {5, "5"}, {6, "6"}, {7, "7"}, {8, "8"}, {9, "9"}, {10, "T"}, {12, "Q"}, {13, "K"}, {14, "A"}};

            Dictionary<string, int> hand_to_bets = new Dictionary<string, int>();

            const Int32 BuffSize = 512;
            using (var fileStream = File.OpenRead("input.txt"))
            using (var streamReader = new StreamReader(fileStream, Encoding.UTF8, true, BuffSize)) 
            {
                String line;
                while((line = streamReader.ReadLine()) != null) 
                {
                    hands.Add(line.Split(" ")[0]);
                    bets.Add(Int32.Parse(line.Split(" ")[1]));
                    hand_to_bets.Add(line.Split(" ")[0], Int32.Parse(line.Split(" ")[1]));
                }
            }

            for(int i = 0; i < hands.Count; i++)
            {
                List<int> to_add = new List<int>();
                int joker_counter = 0;

                foreach(char c in hands[i])
                {
                    if(c == 'J')
                    {
                        joker_counter++;
                    }
                }

                if(joker_counter == 0)
                {
                    if(check_five_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        five_of_kind.Add(to_add);
                    }
                    if(check_four_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        four_of_kind.Add(to_add);
                    }
                    if(check_house(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        house.Add(to_add);
                    }
                    if(check_three_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        three_of_kind.Add(to_add);
                    }
                    if(check_two_pair(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        two_pair.Add(to_add);
                    }
                    if(check_pair(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        pair.Add(to_add);
                    }
                    if(!check_pair(hands[i]) && !check_two_pair(hands[i]) && !check_three_of_kind(hands[i]) && !check_house(hands[i]) && !check_four_of_kind(hands[i]) && !check_five_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        high_card.Add(to_add);
                    }
                }

                if(joker_counter == 1)
                {
                    if(check_four_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        five_of_kind.Add(to_add);
                    }
                    if(check_three_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        four_of_kind.Add(to_add);
                    }
                    if(check_two_pair(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        house.Add(to_add);
                    }
                    if(check_pair(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        three_of_kind.Add(to_add);
                    }
                    if(!check_pair(hands[i]) && !check_two_pair(hands[i]) && !check_three_of_kind(hands[i]) && !check_house(hands[i]) && !check_four_of_kind(hands[i]) && !check_five_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        pair.Add(to_add);
                    }
                }

                if(joker_counter == 2)
                {
                    if(check_house(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        five_of_kind.Add(to_add);
                    }
                    if(check_two_pair(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        four_of_kind.Add(to_add);
                    }
                    if(check_pair(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        three_of_kind.Add(to_add);
                    }
                    if(!check_pair(hands[i]) && !check_two_pair(hands[i]) && !check_three_of_kind(hands[i]) && !check_house(hands[i]) && !check_four_of_kind(hands[i]) && !check_five_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        three_of_kind.Add(to_add);
                    }
                }

                if(joker_counter == 3)
                {
                    if(check_house(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        five_of_kind.Add(to_add);
                    }
                    if(check_three_of_kind(hands[i]))
                    {
                        foreach (char card_val in hands[i])
                        {
                            to_add.Add(character_to_card[card_val.ToString()]);
                        }
                        four_of_kind.Add(to_add);
                    }
                }

                if(joker_counter == 4)
                {
                    foreach (char card_val in hands[i])
                    {
                        to_add.Add(character_to_card[card_val.ToString()]);
                    }
                    five_of_kind.Add(to_add);
                }

                if(joker_counter == 5)
                {
                    foreach (char card_val in hands[i])
                    {
                        to_add.Add(character_to_card[card_val.ToString()]);
                    }
                    five_of_kind.Add(to_add);
                }
            }

            var sorted_high = high_card.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);
            var sorted_pair = pair.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);
            var sorted_2pair = two_pair.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);
            var sorted_tripples = three_of_kind.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);
            var sorted_house = house.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);
            var sorted_4same = four_of_kind.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);
            var sorted_5same = five_of_kind.OrderBy(x => x[0]).ThenBy(x => x[1]).ThenBy(x => x[2]).ThenBy(x => x[3]).ThenBy(x => x[4]);

            foreach (List<int> i in sorted_high)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }
            foreach (List<int> i in sorted_pair)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }
            foreach (List<int> i in sorted_2pair)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }
            foreach (List<int> i in sorted_tripples)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }
            foreach (List<int> i in sorted_house)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }
            foreach (List<int> i in sorted_4same)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }
            foreach (List<int> i in sorted_5same)
            {
                string to_add = "";
                for(int j = 0; j < i.Count; j++)
                {
                    to_add += cardval_to_character[i[j]];
                }
                final_list.Add(to_add);
            }

            for(int i = 0; i < final_list.Count; i++)
            {
                final_sum += (i + 1) * (hand_to_bets[final_list[i]]);
            }

            Console.WriteLine("Final sum: {0}", final_sum);
        }
    }
}