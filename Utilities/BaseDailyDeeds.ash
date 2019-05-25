#This script is for learning pourpses. 
#It is advisable to use kolmafia's Daily deeds feature.

script "BaseDailyDeeds.ash";
#notify "Rufus Flecher";


skill[int] skillsMap;
skillsMap[0] = $skill[Advanced Saucecrafting];
skillsMap[1] = $skill[Perfect Freeze];
skillsMap[2] = $skill[Advanced Cocktailcrafting];
skillsMap[3] = $skill[Pastamastery];
skillsMap[4] = $skill[Acquire Rhinestones];
skillsMap[5] = $skill[Prevent Scurvy and Sobriety];

item[int] itemsMap;
itemsMap[0] = $item[The Cocktail Shaker];
itemsMap[1] = $item[infinite BACON machine];
itemsMap[2] = $item[cheap toaster];

void doDailyDeeds()
{
	#uses daily skills, if you have them, and have the mp for them:
	foreach dailySkill in skillsMap
	{
		if(have_skill(skillsMap[dailySkill]))
		{
			if(is_unrestricted(skillsMap[dailySkill]))
			{
				if(my_mp() > mp_cost(skillsMap[dailySkill]))
				{
					use_skill(skillsMap[dailySkill]);
				}
				else
				{
					//Recover Mp to half of what i can have.
					restore_mp(my_maxmp()/2);
					//TODO: Make sure you cannot fail this part.
					use_skill(skillsMap[dailySkill]);
				}
			}
			else
			{
				print("Cannot use the skill " + skillsMap[dailySkill], "red");
			}
		}
	}
	
	#Use daily items, if you have them available:
	foreach dailyItem in itemsMap
	{
		if (item_amount(itemsMap[dailyItem]) > 0)
		{
			if(is_unrestricted(itemsMap[dailyItem]))
			{
				use(1, itemsMap[dailyItem]);
			}
			else
			{
				print("Cannot use the item " + itemsMap[dailyItem], "red");
			}
		}
	}
	
	string page = visit_url("clan_rumpus.php?action=click&spot=9&furni=3"); // Visit meat tree in clan hall.
}

void main()
{
	doDailyDeeds();
}