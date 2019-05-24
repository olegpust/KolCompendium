#This script is for learning pourpses. 
#Eats the foods i want for barf mountain + uses spleen and flaskful of hollow..

script "BarfMountainEater.ash";
#notify "Rufus Flecher";

#import <zlib.ash>

void EatChocolate(int count)
{
	// Cannot use more than 3 per day..
	if(count > 0 && count < 4)
	{
		item chocolateTool;
		boolean classFlag = false;
		if(my_class() == $class[Accordion Thief])
		{
			chocolateTool = $item[chocolate stolen accordion];
			classFlag = true;
		}
		else if(my_class() == $class[Turtle Tamer])
		{
			chocolateTool = $item[chocolate turtle totem];
			classFlag = true;
		}
		else if(my_class() == $class[Seal Clubber])
		{
			chocolateTool = $item[chocolate seal-clubbing club];
			classFlag = true;
		}
		else if(my_class() == $class[Disco Bandit])
		{
			chocolateTool = $item[chocolate disco ball];
			classFlag = true;
		}
		// TODO: Add support for last 2 classes. Maybe have a global class parameter?
		
		// Was able to determine my class.
		if(count > 0 && classFlag)
		{
			if(available_amount(chocolateTool) < count)
			{
				buy(count - available_amount(chocolateTool), chocolateTool);
			}
			if(available_amount(chocolateTool) >= count)
			{
				use(count, chocolateTool);
				print("Ate chocolate", "Green");
			}
		}
	}
}

void FillSelfWithGoodness()
{
	//Spleen and buff time:
	print("Spleening..", "Green");
	if(have_effect($effect[Smithsness Presence]) <= 490)
	{
		if(item_amount($item[handful of Smithereens]) < 5)
			buy(5 - item_amount($item[handful of Smithereens]), $item[handful of Smithereens]);
		chew(5, $item[handful of Smithereens]);
	}
	if(have_effect($effect[Merry Smithsness]) <= 500)
	{
		if(item_amount($item[Flaskfull of Hollow]) < 4)
			buy(4 - item_amount($item[Flaskfull of Hollow]), $item[Flaskfull of Hollow]);
		use(4, $item[Flaskfull of Hollow]);	
	}
	
	if(item_amount($item[coffee pixie stick]) <2)
		buy(2, $item[coffee pixie stick]); // TODO: Change to buying from special trader this part.
	chew(2, $item[coffee pixie stick]);
	
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
			if(item_amount($item[extra-greasy slider]) < 1)
			{
				buy(1, $item[extra-greasy slider]);
			}
			if(item_amount($item[Ol' Scratch's salad fork]) < 1)
			{
				buy(1, $item[Ol' Scratch's salad fork]);
			}
			maximize("hot resistance", false);
			eat(1, $item[extra-greasy slider]);
		}
		if(item_amount($item[meteoreo]) < fullness_limit() - my_fullness())
			buy(fullness_limit() - my_fullness() - item_amount($item[meteoreo]) , $item[meteoreo]);
		eat(fullness_limit() - my_fullness(), $item[meteoreo]);	
	}
	
	//Cleared some spleen room from the slider. Fill it with juice.
	if(item_amount($item[carrot juice]) <2)
		buy(2, $item[carrot juice]);
	chew(2, $item[carrot juice]);
	
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
	
	EatChocolate(2); // At the current rate, not making enough money to use 3 a day.
	
	print("**Burp**", "Green");	
}

void main()
{
	FillSelfWithGoodness();
}

