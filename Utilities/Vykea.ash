#This script is for learning pourpses. 
#Nightcaping is important!

script "Vykea.ash";
#notify "Rufus Flecher";

void MakeVykeaCouch()
{
	if(item_amount($item[VYKEA rail]) < 5)
		buy(5 - item_amount($item[VYKEA rail]), $item[VYKEA rail]);
	if(item_amount($item[VYKEA plank]) < 5)
		buy(5 - item_amount($item[VYKEA plank]), $item[VYKEA plank]);
	if(item_amount($item[VYKEA bracket]) < 5)
		buy(5 - item_amount($item[VYKEA bracket]), $item[VYKEA bracket]);
	if(item_amount($item[VYKEA dowel]) < 37)
		buy(37 - item_amount($item[VYKEA dowel]), $item[VYKEA dowel]);
	if(item_amount($item[VYKEA hex key]) < 1)
		buy(1, $item[VYKEA hex key]);
	if(item_amount($item[VYKEA frenzy rune]) < 1)
		buy(1, $item[VYKEA frenzy rune]);
	cli_execute("create level 5 couch");
}

void main()
{
	MakeVykeaCouch();
}

