#This script is for learning pourpses. 
#This script contains basic item manipulation.
#This one is for equipping +adv on rollover items, which like most players i forgot to equip more than once.
#Item comparrison based on the table at http://kol.coldfront.net/thekolwiki/index.php/Maximizing_Your_Rollover_Adventures

script "LoggoutOutfitter.ash";
#notify "Rufus Flecher";

int item_count = 0;
int[item] yourInventory;
item[int] stuffToWearOnRollover;
item[int] hats;
item[int] back;
item[int] shirt;
item[int] pants;
item[int] mainhand;
item[int] offhand;
item[int] accessory;
item[int][int] equipmentMap;

hats[0] = $item[leather aviator\'s cap];
hats[1] = $item[Admiral\'s hat];
hats[2] = $item[very pointy crown];
hats[3] = $item[Hairpiece On Fire];
hats[4] = $item[Uncle Crimbo\'s hat];
hats[5] = $item[sea cowboy hat];
hats[6] = $item[Grimacite goggles];
hats[7] = $item[time helmet];
hats[8] = $item[Psychic\'s circlet];
hats[9] = $item[Genie\'s turbane];

back[0] = $item[Burning cape];
back[1] = $item[Drunkula\'s cape]; # TODO: Check if class is sauceror!
back[2] = $item[chalk chlamys];
back[3] = $item[octolus-skin cloak];
back[4] = $item[Time Bandit Time Towel];

#Check if player has torso awarness
shirt[0] = $item[Sneaky Pete\'s leather jacket];
shirt[1] = $item[General Sage\'s Lonely Diamonds Club Jacket];
shirt[2] = $item[shoe ad T-shirt];

pants[0] = $item[stinky cheese diaper];
pants[1] = $item[Ratskin pajama pants];
pants[2] = $item[Pantaloons of Hatred];
pants[3] = $item[Grimacite gaiters];
pants[4] = $item[time trousers];
pants[5] = $item[ninjammies];
pants[6] = $item[electronic dulcimer pants];
pants[7] = $item[paperclip pants];
pants[8] = $item[Wicker knickers];

mainhand[0] = $item[alarm accordion]; #TODO: check if class is accordion theif & has Accordion Appreciation!!
mainhand[1] = $item[The Nuge\'s favorite crossbow];
mainhand[2] = $item[staph of homophones];
mainhand[3] = $item[sword behind inappropriate prepositions];
mainhand[4] = $item[Staff of Kitchen Royalty];
mainhand[5] = $item[time sword];
mainhand[6] = $item[The Nuge\'s favorite crossbow];
mainhand[7] = $item[carob cannon];
mainhand[8] = $item[chrome crossbow];
mainhand[9] = $item[chrome staff];
mainhand[10] = $item[chrome sword];
mainhand[11] = $item[meatspout staff];
mainhand[12] = $item[scepter of the Skeleton Lord];
mainhand[13] = $item[deadfall branch];

#TODO: add mainhand + offhand support.

offhand[0] = $item[Green LavaCo Lamp™]; # TODO: check for player's main stat to see which one is better to equip on rollover.
offhand[1] = $item[Red LavaCo Lamp™];
offhand[2] = $item[Blue LavaCo Lamp™];
offhand[3] = $item[The Nuge\'s favorite crossbow];
offhand[4] = $item[depleted Grimacite gravy boat];
offhand[5] = $item[Royal scepter];
offhand[6] = $item[astral statuette];
offhand[7] = $item[Latte lovers member's mug]; # TODO: check it mug has +4 adventures
offhand[8] = $item[Loathing Legion moondial];
offhand[9] = $item[ancient calendar];
offhand[10] = $item[Mer-kin stopwatch];
offhand[11] = $item[silver cow creamer];
offhand[12] = $item[time sword];
offhand[13] = $item[novelty monorail ticket];

#TODO: add watch exclussivity considerations.

accessory[0] = $item[Counterclockwise Watch];
accessory[1] = $item[snow belt];
accessory[2] = $item[Draftsman's driving gloves];
accessory[3] = $item[fudgecycle];
accessory[4] = $item[Uncle Hobo\'s epic beard];
accessory[5] = $item[Gingerbeard];
accessory[6] = $item[ticksilver ring];
accessory[7] = $item[Treads of Loathing];
accessory[8] = $item[Spacegate scientist\'s insignia];
accessory[9] = $item[grandfather watch];
accessory[10] = $item[Sasq™ watch];
accessory[11] = $item[numberwang];
accessory[12] = $item[meteorthopedic shoes];
accessory[13] = $item[over-the-shoulder Folder Holder]; #TODO: check folder (sports car)!
accessory[14] = $item[your cowboy boots]; # TODO: check ticksilver spurs!
accessory[15] = $item[Crimbolex watch];
accessory[16] = $item[dead guy\'s memento];
accessory[17] = $item[time halo];
accessory[18] = $item[depleted Grimacite grappling hook];
accessory[19] = $item[depleted Grimacite weightlifting belt];
accessory[20] = $item[Official Council Aide Pin];
accessory[21] = $item[BGE pocket calendar];
accessory[22] = $item[Boots of Twilight Whispers];
accessory[23] = $item[Aerogel ascot];
accessory[24] = $item[plexiglass pocketwatch];
accessory[25] = $item[astral bracer];
accessory[26] = $item[wristwatch of the white knight];
accessory[27] = $item[imitation nice watch];
accessory[28] = $item[glow-in-the-dark wristwatch];
accessory[29] = $item[stainless steel solitaire];
accessory[30] = $item[tiny die-cast golden ring];
accessory[30] = $item[tiny plastic bitchin\' meatcar];
accessory[30] = $item[tiny plastic Crimbo reindeer];
accessory[30] = $item[tiny plastic golden gundam];
accessory[30] = $item[tiny plastic skeletal reindeer];
accessory[30] = $item[gold wedding ring];
accessory[30] = $item[dead guy\'s watch];

equipmentMap[0] = hats;
equipmentMap[1] = back;
equipmentMap[2] = shirt;
equipmentMap[3] = pants;
equipmentMap[4] = mainhand;
equipmentMap[5] = offhand;
equipmentMap[6] = accessory;
equipmentMap[7] = accessory;
equipmentMap[8] = accessory;


void ChooseBestLoggoutItems()
{
	yourInventory = get_inventory();
	print(equipmentMap);
	foreach part in equipmentMap
	{
		foreach index in equipmentMap[part]
		{
			# does not work: print("hahaha" + yourInventory[equipmentMap[part][index]]);
			# print("Item: " + equipmentMap[part][index]);
			item_count = yourInventory[equipmentMap[part][index]];
				if(item_count > 0)
				{	
					stuffToWearOnRollover[part] = equipmentMap[part][index];
					continue;
				}
			}
	}
}

void EquipBestLoggoutItems()
{
	foreach type in stuffToWearOnRollover
	{
		print("Equipping " + stuffToWearOnRollover[type]);
		if(item_type(stuffToWearOnRollover[type]) == "shirt") # can wear shirt
		{
			if(have_skill($skill[Torso Awaregness]))
			{
				equip(stuffToWearOnRollover[type]);
			}
			else
			{
			print("Could not equip " + stuffToWearOnRollover[type]);
			continue;
			}
		}
		if(equipped_amount(stuffToWearOnRollover[type]) == 0)
			equip(stuffToWearOnRollover[type]);
	}
}

void main()
{
	ChooseBestLoggoutItems();
	EquipBestLoggoutItems();
}