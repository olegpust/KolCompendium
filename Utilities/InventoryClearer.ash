#This script is for learning pourpses. 
#This script is for use up items that convert to meat when used. Usefull to squize extra needed meat from items one forgets to use.

script "InventoryClearer.ash";
#notify "Rufus Flecher";

void CleanMeatItems()
{
	
	# Meat Producting list of items from wiki:
	# http://kol.coldfront.net/thekolwiki/index.php/Warm_Subject_gift_certificate#Collection
	
	item [int] item_map;
	int item_count = 0;
	
	item_map[0] = $item[ancient vinyl coin purse];
	item_map[1] = $item[bag of park garbage];
	item_map[2] = $item[black pension check];
	item_map[3] = $item[briefcase];
	item_map[4] = $item[chest of the Bonerdagon];
	item_map[5] = $item[collection of tiny spooky objects];
	item_map[6] = $item[CSA discount card];
	item_map[7] = $item[cursed piece of thirteen];
	item_map[8] = $item[dungeon dragon chest];
	item_map[9] = $item[duct tape wallet];
	item_map[10] = $item[fat wallet];
	item_map[11] = $item[flytrap pellet];
	item_map[12] = $item[Gathered Meat-Clip];
	#item_map[13] = $item[handful of tips]; DO NOT USE~!
	#item_map[14] = $item[LOLmec statuette]; RARE~!
	item_map[15] = $item[Orcish meat locker];
	item_map[16] = $item[old leather wallet];
	item_map[17] = $item[Penultimate Fantasy chest];
	item_map[18] = $item[pixel coin];
	item_map[19] = $item[pixellated moneybag];
	item_map[20] = $item[old coin purse];
	item_map[21] = $item[roll of meat];
	item_map[22] = $item[shiny stones];
	#item_map[23] = $item[smut orc keepsake box]; Worth more on market!
	item_map[24] = $item[stolen meatpouch];
	item_map[25] = $item[Warm Subject gift certificate];
	
	foreach key in item_map{
		item_count = item_amount(item_map[key]);
		if(item_count > 0){
			use(item_count, item_map[key]);
		}
	}
	
	#Gets rid of meat products we dont need when cleaning house.
	clear(item_map);
	item_map[0] = $item[meat paste];
	item_map[1] = $item[meat stack];
	item_map[2] = $item[dense meat stack];
	item_map[2] = $item[fat stacks of cash];
	
	foreach key in item_map{
		item_count = item_amount(item_map[key]);
		if(item_count > 0){
			autosell(item_count, item_map[key]);
		}
	}
}

void main()
{
	CleanMeatItems();
}