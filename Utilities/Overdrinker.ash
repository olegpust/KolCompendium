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
		if(my_mp() > 2 * mp_cost($skill[The Ode to Booze]))
		{
			use_skill(2,$skill[The Ode to Booze]);
		}
		else
		{
			restore_mp(100);
			use_skill(2,$skill[The Ode to Booze]);
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
		equip($item[mafia pinky ring]);
		
		int size1 = available_amount($item[elemental caipiroska]);
		int size10 = available_amount($item[bucket of wine]);
		if(size1 < 1)
			buy(1 , $item[elemental caipiroska]);
		drink(1, $item[elemental caipiroska]);
		
		if(size10 < 1)
			buy(1 , $item[bucket of wine]);
		overdrink(1, $item[bucket of wine]);
	}
}

void main()
{
	Nightcap();
}

