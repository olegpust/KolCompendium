#This script is for learning pourpses. 
#Get buffs, for farming.

script "Buffer.ash";
#notify "Rufus Flecher";

void Buffme(int advCount)
{
	int advCountDivided = 0;
	if(advCount > 900 || advCount < 0)
	{
		print("Not buffing for more than 900 adventures.. sorry pal", "red");
		return;
	}
	if(have_effect($effect[Polka of Plenty]) < advCount) 
	{
		//Beg for a buff from the buffbot.
		chat_private("Flesh Puppet","buffme");
		chat_private("Flesh Puppet","buffme");
	}
	if(have_effect($effect[How to Scam Tourists]) < advCount)
	{
		advCountDivided = advCount / 20;
		if(item_amount($item[How to Avoid Scams]) > advCountDivided)
		{
			use(advCountDivided, $item[How to Avoid Scams]);
		}
		else
		{
			buy(advCountDivided - item_amount($item[How to Avoid Scams]), $item[How to Avoid Scams]);
			use(advCountDivided, $item[How to Avoid Scams]);
		}
	}
	advCountDivided = advCount / 10;
	if(have_effect($effect[Leash of Linguini]) < advCount)
	{
	int timesToCastLeash = ceil(advCountDivided- have_effect($effect[Leash of Linguini])/10);
	
		if(my_mp() > timesToCastLeash*mp_cost($skill[Leash of Linguini]))
		{
			use_skill(timesToCastLeash,$skill[Leash of Linguini]);
		}
		else
		{
			if(item_amount($item[magical sausage]) > 0)
				eat(1, $item[magical sausage]);
			else
				restore_mp(timesToCastLeash*10);
			use_skill(timesToCastLeash,$skill[Leash of Linguini]);
		}
	}
	if(have_effect($effect[Disco Leer]) < advCount)
	{
	int timesToCastDisco = ceil(advCountDivided- have_effect($effect[Disco Leer])/10);
	
		if(my_mp() > timesToCastDisco*mp_cost($skill[Disco Leer]))
		{
			use_skill(timesToCastDisco,$skill[Disco Leer]);
		}
		else
		{
		
			if(item_amount($item[magical sausage]) > 0)
				eat(1, $item[magical sausage]);
			else
				restore_mp(timesToCastDisco*10);
			use_skill(timesToCastDisco,$skill[Disco Leer]);
		}
	}
	if(have_effect($effect[Blood Bond]) < advCount)
	{
	int timesToCastBond = ceil(advCountDivided- have_effect($effect[Blood Bond])/10);
	
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
				if(my_hp() < 30)
				{
					restore_mp(20);
					use_skill(1, $skill[Cannelloni Cocoon]);
				}
			}
		}
	}
	
	print("Finished buffing...", "Green");
}

void main()
{
	Buffme(100);
}

