#This script is for learning pourpses. 
#Eats the foods i want for barf mountain + uses spleen and flaskful of hollow..

script "BarfMountainEater.ash";
#notify "Rufus Flecher";

#import <zlib.ash>

void FillSelfWithGoodness()
{
	if(my_fullness() !=  fullness_limit())
	{
		if(item_amount($item[milk of magnesium]) == 0)
		{
			print("Getting milk", "Green");
			buy(1 , $item[milk of magnesium]);
		}
		
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
				
		if(item_amount($item[cold hi mein]) < 1 )
			buy(1 , $item[cold hi mein]);
		eat(1, $item[cold hi mein]);
		
		if(item_amount($item[sweet party mix]) < fullness_limit() - my_fullness())
			buy(fullness_limit() - my_fullness() - item_amount($item[sweet party mix]) , $item[sweet party mix]);
		eat(fullness_limit() - my_fullness(), $item[sweet party mix]);	
	}
	
	if(inebriety_limit() != my_inebriety())
	{
		// Ode time, TODO: Check if you have ode, if so use it, else get a buff.
		int timesToCastOde = ceil(inebriety_limit()-my_inebriety()/10)
		
		if(my_mp() > timesToCastOde * mp_cost($skill[The Ode to Booze]))
		{
			use_skill(timesToCastOde,$skill[The Ode to Booze]);
		}
		else
		{
			restore_mp(timesToCastOde * 50 + 1);
			use_skill(timesToCastOde,$skill[The Ode to Booze]);
		}
		// Wait for the buff to appear.
		if(have_effect($effect[Ode to Booze]) < inebriety_limit())
		{
			repeat 
			{
				wait(5); 
				refresh_status();
			}
			until (have_effect($effect[Ode to Booze]) >= inebriety_limit());
		}
		
		print("Drinking..", "Green");
		if(item_amount($item[perfect dark and stormy]) < floor(inebriety_limit()/3) )
			buy(floor(inebriety_limit()/3) - item_amount($item[perfect dark and stormy]) , $item[perfect dark and stormy]);	
		drink(floor(inebriety_limit()/3), $item[perfect dark and stormy]);
		if(item_amount($item[elemental caipiroska]) < inebriety_limit()-my_inebriety())
			buy(inebriety_limit()-my_inebriety(), $item[elemental caipiroska]);
		drink(inebriety_limit()-my_inebriety(), $item[elemental caipiroska]);
	}
	
	//Spleen and buff time:
	print("Spleening..", "Green");
	if(have_effect($effect[Smithsness Presence] <=390))
	{
		if(item_amount($item[handful of Smithereens]) < 4)
			buy(4 - item_amount($item[handful of Smithereens]), $item[handful of Smithereens]);
		chew(4, $item[handful of Smithereens]);
	}
	if(have_effect($effect[Merry Smithsness] <= 400))
	{
		if(item_amount($item[Flaskfull of Hollow]) < 3)
			buy(3 - item_amount($item[Flaskfull of Hollow]), $item[Flaskfull of Hollow]);
		use(3, $item[Flaskfull of Hollow]);	
	}
	//Fill yourself on Nasal spray, because its cheap.
	if(have_effect($effect[Wasabi Sinuses] < 10)
	{
		if(item_amount($item[Knob Goblin nasal spray]) < spleen_limit() - my_spleen_use())
			buy(spleen_limit() - my_spleen_use() - item_amount($item[Knob Goblin nasal spray]), $item[Knob Goblin nasal spray]);
		chew(spleen_limit() - my_spleen_use(), $item[Knob Goblin nasal spray]);
	}
	
	print("**Burp**", "Green");
	
}

void main()
{
	FillSelfWithGoodness();
}

