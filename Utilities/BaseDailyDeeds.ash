#This script is for learning pourpses. 
#It is advisable to use kolmafia's Daily deeds feature.

script "BaseDailyDeeds.ash";
#notify "Rufus Flecher";

void doDailyDeeds()
{
	#uses daily skills, if you have them, and have the mp for them:
	if(have_skill($skill[Advanced Saucecrafting])){
		use_skill($skill[Advanced Saucecrafting]);
	}
	if(have_skill($skill[Perfect Freeze])){
		use_skill($skill[Perfect Freeze]);
	}
	if(have_skill($skill[Advanced Cocktailcrafting])){
		use_skill($skill[Advanced Cocktailcrafting]);
	}
	if(have_skill($skill[Pastamastery])){
		use_skill($skill[Pastamastery]);
	}
	
	#Use daily items, if you have them available:
	if (item_amount($item[The Cocktail Shaker]) > 0){
		use(1, $item[The Cocktail Shaker]);
	}
	if (item_amount($item[infinite BACON machine]) > 0){
		use(1, $item[infinite BACON machine]);
	}
}

void main()
{
	doDailyDeeds();
}