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
import <KolCompendium/Tutorial Scripts/SetupIotms.ash>
import <bastille.ash>
import <VotingBooth.ash>

//predefine function
void main();
void meatEquipment();
void maintainBuffs();

void doMaintFunds()
{
	//Get 3 funds for 1 garbage bag.
	string temp = "";
	temp = visit_url("place.php?whichplace=airport_stench&action=airport3_tunnels");
	temp = visit_url("choice.php?whichchoice=1067&option=6");
}

void main()
{

	doDailyDeeds();
	voteInVotingBooth();
	
	//Use muscle setup due to use of brutal brogues for +8 wt.
	main@bastille("muscle");
	Buffme();
	
	if(use_familiar($familiar[Cornbeefadon]))
	{
		FillSelfWithGoodness();
	}

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
	it = $item[box of familiar jacks];
	if(available_amount(it) < 1)
	{
		buy(1, it);
	}
	//Get amulet coin
	if(use_familiar($familiar[Cornbeefadon]) && available_amount(it) >= 1)
	{
		use(1, it);
	}

	//Take the best money familiar i have, which is not the hobo monkey..
	if(use_familiar($familiar[Cornbeefadon]))
	{
		cli_execute("maximize meat, +equip cheap sunglasses +equip Mafia thumb ring -tie");
	}
	
	setupIotms();
	
	while((my_adventures() > 20) && (my_inebriety() <= inebriety_limit()))
	{
		if(my_mp() < 50){
			restore_mp(50);
		}
		boolean retval = adv1($location[Barf Mountain], 1,'');
	}
		
	doMaintFunds();

	WearLoggoutSuit();

	//Nightcap();
	
}