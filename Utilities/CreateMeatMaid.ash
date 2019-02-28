#My lame mp meat maid making script.

script "CreateMeatMaid.ash";
notify "Rufus Flecher";

void make_meatmaid()
{
	#Check if you have a single adventure OR a disembodied brain for crafting.
	if(my_adventures() < 1 && item_amount( $item[disembodied brain] ) < 1){
		print("You lack the adventures to get the disembodied brain", "Red");
		return;
	}
	
	#Check which items you have already in your inventory before buying stuff..
	if(item_amount( $item[smart skull] ) < 1)
	{
		print("Get a smart skull, buddy!" , "Red");
		return;
	}	
	if(item_amount( $item[spring] ) < 1)
		buy (1, $item[spring] );
	if(item_amount( $item[sprocket] ) < 1)
		buy (1, $item[sprocket] );
	if(item_amount( $item[cog] ) < 1)
		buy (1, $item[cog] );
	if(item_amount( $item[meat stack] ) < 1)
		create(1, $item[meat stack]);
	if(item_amount( $item[empty meat tank] ) < 1)
		buy (1, $item[empty meat tank] );
	if(item_amount( $item[frilly skirt] ) < 1)
		buy (1, $item[frilly skirt] );
	if(item_amount( $item[maiden wig] ) < 1)
		buy (1, $item[maiden wig] );
	if(item_amount( $item[disembodied brain] ) < 1)
	{
		# We need to use a clover to get the disembodied brain
		if(item_amount( $item[disassembled clover] ) >= 1)
		{
			use(1, $item[disassembled clover]);
		}
		if(item_amount( $item[ten-leaf clover] ) < 1)
		{
			hermit(1, $item[ten-leaf clover]);
		}
	}
	else
		return;
	if(item_amount( $item[ten-leaf clover] ) < 1)
	{
		print("No ten-leaf clover", "Red");
		return;
	}
	
	#Assume you have the bloody clover and can adventure in The VERY Unquiet Garves
	adventure(1, $location[The VERY Unquiet Garves]);
	if(item_amount( $item[disembodied brain] ) < 1)
	{
		print("We used an adventure, but didn't get the brain. Change KolMafia's settings please!", "Red");
		print("General -> Preferences -> Item Acquisition -> Protect Clovers" , "Red");
		return;
	}
		
	craft("combine", 1, $item[spring], $item[sprocket]); 			   				# spring + sprocket
	craft("combine", 1, $item[cog], $item[sprocket assembly]); 		   				# cog + sprocket assembly	
	craft("combine", 1, $item[empty meat tank], $item[meat stack]); 	   			# meat stack + empty meat tank
	craft("combine", 1, $item[cog and sprocket assembly], $item[full meat tank]); 
																					# cog and sprocket assembly + full meat tank
	craft("combine", 1, $item[meat engine], $item[frilly skirt]);      			    # meat engine + frilly skirt
	craft("combine", 1, $item[smart skull], $item[disembodied brain]);				# smart skull + disembodied brain 				
	craft("combine", 1, $item[brainy skull], $item[maiden wig]);					# brainy skull + maiden wig			
	craft("combine", 1, $item[maid head], $item[Meat maid body]);					# Meat maid body + maid head
	
	print("Your Meat maid has been.. well.. made..", "green");
}

void main()
{
	if(my_level() >= 7)
	{
		make_meatmaid();
	}
}