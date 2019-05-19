#This script is for learning pourpses. 
#This script contains basic url manipulation.

script "VisitTesters.ash";
#notify "Rufus Flecher";

void main()
{
	if(visit($coinmaster[Hermit])) {
		if(sells_item($coinmaster[Hermit], $item[ten-leaf clover])) 
		{
			print("There is still a ten-leaf clover available to purchase today! Am buying them for you"); 
			int my_tokens = $item_amount($coinmaster[Hermit].token);
			if(my_tokens == 0)
			{
				buy(1,
			}
			buy($coinmaster[Hermit],1,$item[ten-leaf clover])
		}
		else 
			print("The Hermit is out of clovers. :("); 
	}
 	else 
		print(inaccessible_reason($coinmaster[Hermit]));
}