#This script is for learning pourpses. 
#This script is for use up items that convert to meat when used. Usefull to squize extra needed meat from items one forgets to use.

script "InventoryClearer.ash";
#notify "Rufus Flecher";

void CleanMeatItems()
{
	
	# Meat Producting list of items from wiki:
	# http://kol.coldfront.net/thekolwiki/index.php/Warm_Subject_gift_certificate#Collection
	
	item_count = item_amount($item[ancient vinyl coin purse]);
	if(item_count > 0){
		use(item_count, $item[ancient vinyl coin purse]);
	}
	int item_count = 0;
	item_count = item_amount($item[bag of park garbage]);
	if(item_count > 0){
		use(item_count, $item[bag of park garbage]);
	}
	item_count = item_amount($item[old leather wallet]);
	if(item_count > 0){
		use(item_count, $item[old leather wallet]);
	}
	item_count = item_amount($item[old coin purse]);
	if(item_count > 0){
		use(item_count, $item[old coin purse]);
	}
	item_count = item_amount($item[shiny stones]);
	if(item_count > 0){
		use(item_count, $item[shiny stones]);
	}
	item_count = item_amount($item[Warm Subject gift certificate]);
	if(item_count > 0){
		use(item_count, $item[Warm Subject gift certificate]);
	}
}

void main()
{
	CleanMeatItems();
}