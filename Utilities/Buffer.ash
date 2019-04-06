#This script is for learning pourpses. 
#Get buffs, for farming.

script "Buffer.ash";
#notify "Rufus Flecher";

void Buffme()
{
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
	if(my_mp() > 30*mp_cost($skill[Leash of Linguini]))
		{
			int i = 0;
			while(i<30)
			{
				use_skill($skill[Leash of Linguini]);
				i++;
				wait(1); 
			}
		}
		else
		{
			restore_mp(361);
			int i = 0;
			while(i<30)
			{
				use_skill($skill[Leash of Linguini]);
				i++;
				wait(1); 
			}
		}
		// Wait for the buff to appear.
		if(have_effect($effect[Leash of Linguini]) < 350)
		{
			repeat 
			{
				wait(5); 
				refresh_status();
			}
			until (have_effect($effect[Leash of Linguini]) > 350);
		}	
}

void main()
{
	Buffme();
}

