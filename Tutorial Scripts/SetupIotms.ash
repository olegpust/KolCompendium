#My lame mp meat maid making script.

script "SetupIotms.ash";
//notify "Rufus Flecher";

import <KolCompendium/Utilities/BoomBox.ash>
import <KolCompendium/Utilities/Vykea.ash>
import <KolCompendium/Utilities/BoxingDayCare.ash>

void setupIotms()
{
	MakeVykeaCouch();	//Glaciest
	UseMeatSong(); 		//BoomBox
	TakeNap();			//BoxingDayCare - item
	GetBoxingBuff();	//BoxingDayCare - buff
}

void main()
{
	setupIotms();
}