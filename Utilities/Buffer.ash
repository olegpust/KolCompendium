#This script is for learning pourpses. 
#Get buffs, for farming.

script "Buffer.ash";
#notify "Rufus Flecher";

void Buffme()
{
//TODO: 400 was chosen arbitarially, should consider making this function take a parameter.

	if(have_effect($effect[Polka of Plenty]) < 450) 
		//Beg for a buff from the buffbot.
		chat_private("Flesh Puppet","buffme");
		
	if(have_effect($effect[How to Scam Tourists]) < 450)
	{
		if(item_amount($item[How to Avoid Scams]) > 23)
		{
			use(23, $item[How to Avoid Scams]);
		}
		else
		{
			buy(23 - item_amount($item[How to Avoid Scams]), $item[How to Avoid Scams]);
			use(23, $item[How to Avoid Scams]);
		}
	}
	if(have_effect($effect[Leash of Linguini]) < 450)
	{
	int timesToCastLeash = ceil(45- have_effect($effect[Leash of Linguini])/10);
	
		if(my_mp() > timesToCastLeash*mp_cost($skill[Leash of Linguini]))
		{
			use_skill(timesToCastLeash,$skill[Leash of Linguini]);
		}
		else
		{
			restore_mp(timesToCastLeash*10);
			use_skill(timesToCastLeash,$skill[Leash of Linguini]);
		}
	}
	if(have_effect($effect[Disco Leer]) < 450)
	{
	int timesToCastDisco = ceil(45- have_effect($effect[Disco Leer])/10);
	
		if(my_mp() > timesToCastDisco*mp_cost($skill[Disco Leer]))
		{
			use_skill(timesToCastDisco,$skill[Disco Leer]);
		}
		else
		{
			restore_mp(timesToCastDisco*10);
			use_skill(timesToCastDisco,$skill[Disco Leer]);
		}
	}
	if(have_effect($effect[Blood Bond]) < 450)
	{
	int timesToCastBond = ceil(45- have_effect($effect[Blood Bond])/10);
	
		if(my_hp() > timesToCastBond*30) // TODO: Change hardcoding to function.
		{
			use_skill(timesToCastBond,$skill[Blood Bond]);
		}
		else
		{
			restore_mp(20);
			use_skill(1, $skill[Cannelloni Cocoon]);
			while(my_hp() > 30 && timesToCastBond > 0)
			{
				use_skill(1,$skill[Blood Bond]);
				timesToCastBond = timesToCastBond - 1;
			}
		}
	}
}

void main()
{
	Buffme();
}

