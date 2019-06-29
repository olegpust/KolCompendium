#This script section is for vip lounge stuff..

script "ClanVIPLounge.ash";

void DoVIPStuff()
{
	visit_url("clan_viplounge.php?action=crimbotree&whichfloor=2");
	visit_url("clan_viplounge.php?action=lookingglass&whichfloor=2");
	int i=0;
	while(i < 3) // +5 Fam weight
	{
		visit_url("clan_viplounge.php?preaction=poolgame&stance=1&whichfloor=2");
		i++;
	}
	visit_url("clan_viplounge.php?preaction=goswimming&subaction=laps&whichfloor=2");
	visit_url("clan_viplounge.php?action=faxmachine&whichfloor=2");
	visit_url("clan_viplounge.php?preaction=receivefax&whichfloor=2");
	
	visit_url("clan_viplounge.php?action=shower&whichfloor=2");
	visit_url("clan_viplounge.php?preation=takeshower&tempreture=5&whichfloor=2");
	
	i=0;
	while(i < 3) // use the game klaw for 3 games
	{
		visit_url("clan_viplounge.php?action=klaw");
		i++;
	}
	
	visit_url("clan_viplounge.php?preaction=lovetester");
	visit_url("choice.php?pwd&whichchoice=1278&option=1&which=-3&whichid=&q1=meat&q2=meat&q3=meat");
	run_choice(1);
	
	visit_url("clan_viplounge.php?action=floundry");
	visit_url("clan_viplounge.php?preaction=buyfloundryitem&whichitem=9001");
}

void main()
{
	//DoVIPStuff();
}