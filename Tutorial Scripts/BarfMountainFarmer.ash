#A script to grind barf mountain to automate what i do after i ascend.
#With ideas taken from Ultimater\Ultibot! Thank you sir!
#https://github.com/Ultimater/farm-barf-mountain/blob/master/farm_barf_mountain/scripts/farm-barf-mountain.ash
#Also using Ezandora's scripts here.

script "BarfMountainFarmer.ash";
#notify "Rufus Flecher";

import <KolCompendium/Utilities/BaseDailyDeeds.ash>
import <KolCompendium/Utilities/LoggoutOutfitter.ash>
import <KolCompendium/Utilities/Overdrinker.ash>
import <KolCompendium/Utilities/BarfMountainEater.ash>
import <KolCompendium/Utilities/Buffer.ash>
import <bastille.ash>
import <VotingBooth.ash>

//predefine function
void main();
void meatEquipment();
void maintainBuffs();

void main()
{
	doDailyDeeds();
	voteInVotingBooth();
	//Use muscle setup due to use of brutal brogues for +8 wt.
	main@bastille("muscle");
	Buffme();
	FillSelfWithGoodness();
	
	//Buy a dinsey pass if you dont have one:
	item it = $item[8204];
	if(available_amount(it) < 1)
	{
		buy(1, it);
	}
	if(available_amount(it) >= 1)
	{
		use(1, it);
	}
	else
	{
		//Something went wrong..
		print("No ticket found: one-day ticket to Dinseylandfill", "red");
	}
		
	//Take the best money familiar i have, which is not the hobo monkey..
	if(use_familiar($familiar[Cornbeefadon]))
	{
		cli_execute("maximize meat, +equip cheap sunglasses -tie");
	}
	
	while((my_adventures() > 1) && (my_inebriety() <= inebriety_limit()))
	{
		boolean retval = adv1($location[Barf Mountain], 1,'');
	}
	
	WearLoggoutSuit();
	
	Nightcap();
	
}