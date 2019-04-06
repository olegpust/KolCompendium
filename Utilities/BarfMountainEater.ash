#This script is for learning pourpses. 
#Eats the foods i want for barf mountain + uses spleen and flaskful of hollow..

script "BarfMountainEater.ash";
#notify "Rufus Flecher";

#import <zlib.ash>

void FillSelfWithGoodness()
{
	if(item_amount($item[milk of magnesium]) == 0)
	{
		print("Getting milk", "Green");
		buy(1 , $item[milk of magnesium]);
	}
	else
	{
		//Eating Section here:
		use(1,$item[milk of magnesium]);
		if(have_effect($effect[Got Milk]) < 1)
		{
			repeat 
			{
				wait(5); 
				refresh_status();
			}
			until (have_effect($effect[Got Milk]) > 1);
		}
		print("Munching..", "Green");
		if(item_amount($item[jumping horseradish]) < 7 )
			buy(7 - item_amount($item[jumping horseradish]) , $item[jumping horseradish]);
		eat(7, $item[jumping horseradish]);
		
		if(item_amount($item[sweet party mix]) < 3 )
			buy(3 - item_amount($item[sweet party mix]) , $item[sweet party mix]);
		eat(3, $item[sweet party mix]);	 
		if(item_amount($item[cold hi mein]) < 1 )
			buy(1 , $item[cold hi mein]);
		eat(1, $item[cold hi mein]);
		
		// Ode time, TODO: Check if you have ode, if so use it, else get a buff.
		if(my_mp() > 2*mp_cost($skill[The Ode to Booze]))
		{
			use_skill($skill[The Ode to Booze]);
			use_skill($skill[The Ode to Booze]);
		}
		else
		{
			restore_mp(101);
			use_skill($skill[The Ode to Booze]);
			use_skill($skill[The Ode to Booze]);
		}
		// Wait for the buff to appear.
		if(have_effect($effect[Ode to Booze]) < 15)
		{
			repeat 
			{
				wait(5); 
				refresh_status();
			}
			until (have_effect($effect[Ode to Booze]) > 15);
		}
		print("Drinking..", "Green");
		if(item_amount($item[perfect dark and stormy]) < floor(inebriety_limit()/3) )
			buy(floor(inebriety_limit()/3) - item_amount($item[perfect dark and stormy]) , $item[perfect dark and stormy]);	
		drink(floor(inebriety_limit()/3), $item[perfect dark and stormy]);
		if(item_amount($item[elemental caipiroska]) < inebriety_limit()-my_inebriety())
			buy(inebriety_limit()-my_inebriety(), $item[elemental caipiroska]);
		drink(inebriety_limit()-my_inebriety(), $item[elemental caipiroska]);

		//Spleen and buff time:
		print("Spleening..", "Green");
		if(item_amount($item[handful of Smithereens]) < 4)
			buy(4 - item_amount($item[handful of Smithereens]), $item[handful of Smithereens]);
		chew(4, $item[handful of Smithereens]);
		if(item_amount($item[Flaskfull of Hollow]) < 3)
			buy(3 - item_amount($item[Flaskfull of Hollow]), $item[Flaskfull of Hollow]);
		use(3, $item[Flaskfull of Hollow]);	
		if(item_amount($item[Knob Goblin nasal spray]) < 11)
			buy(11 - item_amount($item[Knob Goblin nasal spray]), $item[Knob Goblin nasal spray]);
		chew(11, $item[Knob Goblin nasal spray]);
		
		print("**Burp**", "Green");
	}
}

void main()
{
	FillSelfWithGoodness();
}

