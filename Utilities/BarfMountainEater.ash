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
		
		if(item_amount($item[Special Seasoning]) < 11)
			buy(11, $item[Special Seasoning]);
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
		if(item_amount($item[jumping horseradish]) < 9 )
		buy(9 - item_amount($item[jumping horseradish]) , $item[jumping horseradish]);
		eat(9, $item[jumping horseradish]);
		
		if(fullness_limit() - my_fullness() > 5)
		{
			if(item_amount($item[karma shawarma]) < 1)
			{
				buy(1, $item[karma shawarma]);
			}
			eat(1, $item[karma shawarma]);
		}
		if(item_amount($item[meteoreo]) < fullness_limit() - my_fullness())
			buy(fullness_limit() - my_fullness() - item_amount($item[meteoreo]) , $item[meteoreo]);
		eat(fullness_limit() - my_fullness(), $item[meteoreo]);	
	}
	
	if(inebriety_limit() != my_inebriety())
	{
		// Ode time, TODO: Check if you have ode, if so use it, else get a buff.
		int timesToCastOde = ceil(inebriety_limit()-my_inebriety())/10;
		
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
		drink(floor((inebriety_limit()-my_inebriety())/3), $item[perfect dark and stormy]);
		if(item_amount($item[elemental caipiroska]) < inebriety_limit()-my_inebriety())
			buy(inebriety_limit()-my_inebriety(), $item[elemental caipiroska]);
		drink(inebriety_limit()-my_inebriety(), $item[elemental caipiroska]);
	}
	
	//Spleen and buff time:
	print("Spleening..", "Green");
	if(have_effect($effect[Smithsness Presence]) <= 490)
	{
		if(item_amount($item[handful of Smithereens]) < 5)
			buy(5 - item_amount($item[handful of Smithereens]), $item[handful of Smithereens]);
		chew(5, $item[handful of Smithereens]);
	}
	if(have_effect($effect[Merry Smithsness]) <= 400)
	{
		if(item_amount($item[Flaskfull of Hollow]) < 3)
			buy(3 - item_amount($item[Flaskfull of Hollow]), $item[Flaskfull of Hollow]);
		use(3, $item[Flaskfull of Hollow]);	
	}
	
	//Fill yourself on Nasal spray, because its cheap.
	//if(have_effect($effect[Wasabi Sinuses]) < 10)
	//{
	//	if(item_amount($item[Knob Goblin nasal spray]) < spleen_limit() - my_spleen_use())
	//		buy(spleen_limit() - my_spleen_use() - item_amount($item[Knob Goblin nasal spray]), $item[Knob Goblin nasal spray]);
	//	chew(spleen_limit() - my_spleen_use(), $item[Knob Goblin nasal spray]);
	//}
	if(item_amount($item[carrot juice]) <3)
		buy(3, $item[carrot juice]);
	chew(3, $item[carrot juice]);
	
	if(my_class() == $class[Accordion Thief])
	{
		item it = $item[chocolate stolen accordion];
		if(available_amount(it) < 1)
		{
			buy(1, it);
		}
		if(available_amount(it) >= 1)
		{
			use(1, it);
			print("Ate chocolate accordion", "Green");
		}
	}
	print("**Burp**", "Green");
	
}

void main()
{
	FillSelfWithGoodness();
}

