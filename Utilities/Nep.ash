#This script is for learning pourpses. 
#Nightcaping is important!

script "NEP.ash";
#notify "Rufus Flecher";

//
//Use meat paste to make sausages. YAY!
//
void NepOnce()
{
	set_property("choiceAdventure1322", 2);
	set_property("choiceAdventure1324", 5);
	boolean retval = adv1($location[The Neverending Party], 1,'');
}

void main()
{
	NepOnce();
}