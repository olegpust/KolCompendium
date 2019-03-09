#This script is for learning pourpses. 
#It is advisable to use kolmafia's Daily deeds feature.

script "BaseDailyDeeds.ash";
#notify "Rufus Flecher";


skill[int] skillsMap;
skillsMap[0] = $skill[Advanced Saucecrafting];
skillsMap[1] = $skill[Perfect Freeze];
skillsMap[2] = $skill[Advanced Cocktailcrafting];
skillsMap[3] = $skill[Pastamastery];

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
				use_skill(skillsMap[dailySkill]);
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

}

void main()
{
	doDailyDeeds();
}