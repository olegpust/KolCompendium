#This script is for learning pourpses. 
#Nightcaping is important!

script "BoxingDayCare.ash";
#notify "Rufus Flecher";

///
///Taken as is from Cc_ascend. You are a hero!
///
void TakeNap()
{
	string page = visit_url("place.php?whichplace=town_wrong&action=townwrong_boxingdaycare", false);
	page = visit_url("choice.php?pwd=&whichchoice=1334&option=1");

	if(!get_property("_daycareNap").to_boolean())
	{
		abort("Messed up boxing day care napping..");
	}

	//Do I need to leave as well, I think I do...
	page = visit_url("choice.php?pwd=&whichchoice=1334&option=4");
}

///
///Taken as is from Cc_ascend. You are a hero!
///
void GetBoxingBuff()
{
	string page = visit_url("place.php?whichplace=town_wrong&action=townwrong_boxingdaycare", false);
	page = visit_url("choice.php?pwd=&whichchoice=1334&option=2");
	page = visit_url("choice.php?pwd=&whichchoice=1335&option=3"); //I always use myst, due to item drop.

	if(!get_property("_daycareSpa").to_boolean())
	{
		abort("Messed up boxing day care buffing!");
	}

	//Do I need to leave as well, I think I do...
	page = visit_url("choice.php?pwd=&whichchoice=1334&option=4");
}

void main()
{
	TakeNap();
	GetBoxingBuff();
}

