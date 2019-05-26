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
import <KolCompendium/Utilities/Kramco.ash>
import <KolCompendium/Utilities/InventoryClearer.ash>
import <KolCompendium/Tutorial Scripts/SetupIotms.ash>
import <bastille.ash>
import <Party.ash>
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
	int eatedSausagesToday = 2; // Start from 2 for buffer..

	doDailyDeeds();
	voteInVotingBooth();
	Kramco(8);
	
	//Use muscle setup due to use of brutal brogues for +8 wt. TODO: Subject to change..
	main@bastille("muscle");
	
	if(use_familiar($familiar[Cornbeefadon]))
	{
		FillSelfWithGoodness();
	}
	
	//Calculate how many turns of buff i need before i start adventuring.. assuming i dont over-adventure due to sheer luck.
	int numOfTurnsForBuffing = my_adventures() * 1.15;
	numOfTurnsForBuffing /= 20;
	numOfTurnsForBuffing = numOfTurnsForBuffing * 20 + 20; // Normalize it to 
	Buffme(numOfTurnsForBuffing);
	
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

	// NEP here while buffed and strong. Maximizing meat over other stuff..
	if(use_familiar($familiar[Cornbeefadon]))
	{
		cli_execute("maximize meat");
		// Start the NEP with health, so i dont die.
		if(my_hp() < 500)
		{
			restore_mp(20);
			use_skill(1, $skill[Cannelloni Cocoon]);
		}
		main@party("party noquest");
	}

	//Take the best money familiar i have, which is not the hobo monkey..
	if(use_familiar($familiar[Cornbeefadon]))
	{
		cli_execute("maximize meat, +equip cheap sunglasses +equip Mafia thumb ring -tie");
	}
	
	setupIotms();

	int adv_count = 0;
	while((my_adventures() > 0) && (my_inebriety() <= inebriety_limit()))
	{
		if(my_mp() < 70){
			if(item_amount($item[magical sausage]) > 0 && eatedSausagesToday < 8)
			{
				eat(1, $item[magical sausage]);
				eatedSausagesToday++;
			}
			else
				restore_mp(70);
		}
		if(adv_count == 25)
		{ 	
			//Recalculate best equipment coz scratch n sniff item might be broken.
			cli_execute("maximize meat, +equip cheap sunglasses +equip Mafia thumb ring -tie");
		}
		
		//Switch to kramco if i think ill get a goblin..
		if(KramcoExpectedGoblinTurn(adv_count))
		{
			cli_execute("maximize meat, +equip "+ $item[10058] +" +equip cheap sunglasses +equip Mafia thumb ring -tie");
		}
		if(KramcoOneAfterExpectedGoblinTurn(adv_count))
		{
			cli_execute("maximize meat, +equip cheap sunglasses +equip Mafia thumb ring -tie");
		}
		if(my_hp() < 100) // Blood bond is a troublesome skill, so need to check youre not dying now too fast. More mp cost per round but better money gain.
			use_skill(1, $skill[Cannelloni Cocoon]); 
		boolean retval = adv1($location[Barf Mountain], 1,'');
		adv_count++;
	}
	
	doMaintFunds();

	CleanMeatItems();
	
	string page = visit_url("postwarisland.php?action=concert&pwd=" + my_hash() + "&option=2");
	page = visit_url("clan_rumpus.php?preaction=jukebox&whichsong=1");
	page = visit_url("clan_rumpus.php?preaction=ballpit");
	eat(1, $item[magical sausage]);
	
	//Nightcap();
	
	//WearLoggoutSuit();	
}