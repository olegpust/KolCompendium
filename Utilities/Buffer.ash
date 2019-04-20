#This script is for learning pourpses. 
#Get buffs, for farming.

script "Buffer.ash";
#notify "Rufus Flecher";

void Buffme()
{
//TODO: 400 was chosen arbitarially, should consider making this function take a parameter.

	if(have_effect($effect[Polka of Plenty] < 400)) 
		//Beg for a buff from the buffbot.
		chat_private("Flesh Puppet","buffme");
		
	if(have_effect($effect[How to Scam Tourists]) < 400)
	{
		if(item_amount($item[How to Avoid Scams]) > 20)
		{
			use(20, $item[How to Avoid Scams]);
		}
		else
		{
			buy(20 - item_amount($item[How to Avoid Scams]), $item[How to Avoid Scams]);
			use(20, $item[How to Avoid Scams]);
		}
	}
	if(have_effect($effect[Leash of Linguini] < 400))
	{
	int timesToCastLeash = ceil(40-$effect[Leash of Linguini]/10)
	
		if(my_mp() > timesToCastLeash*mp_cost($skill[Leash of Linguini]))
		{
			{
				use_skill(timesToCastLeash,$skill[Leash of Linguini]);
			}
			else
			{
				restore_mp(timesToCastLeash*10);
				use_skill(timesToCastLeash,$skill[Leash of Linguini]);

			}
		}
	}
}

void main()
{
	Buffme();
}

