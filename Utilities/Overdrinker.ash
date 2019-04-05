#This script is for learning pourpses. 
#Nightcaping is important!

script "Overdrinker.ash";
#notify "Rufus Flecher";

void Nightcap()
{
	// Change familiar to 
	if(use_familiar($familiar[Stooper]))
	{
		// Ode time, TODO: Check if you have ode, if so use it, else get a buff.
		if(my_mp() > mp_cost($skill[The Ode to Booze]))
		{
			use_skill($skill[The Ode to Booze]);
		}
		else
		{
			restore_mp(51);
			use_skill($skill[The Ode to Booze]);
		}
		// Wait for the buff to appear.
		if(have_effect($effect[Ode to Booze]) < 1)
		{
			repeat 
			{
				wait(5); 
				refresh_status();
			}
			until (have_effect($effect[Ode to Booze]) > 1);
		}
		int size1 = available_amount($item[elemental caipiroska]);
		int size6 = available_amount($item[Psychotic Train wine]);
		if(size1 < 1)
			buy(1 , $item[elemental caipiroska]);
		drink(1, $item[elemental caipiroska]);
		
		//TODO: Add pinky ring equipping
		if(size6 < 1)
			buy(1 , $item[Psychotic Train wine]);
		drink(1, $item[Psychotic Train wine]);
	}
}

void main()
{
	Nightcap();
}

