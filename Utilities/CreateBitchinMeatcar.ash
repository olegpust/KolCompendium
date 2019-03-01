#My basic meatcar script. There are probably better ones out there!

script "CreateBitchinMeatcar.ash";
#notify "Rufus Flecher";

void make_meatcar()
{
	#Check if you have access to degrasi knoll.
	if(!knoll_available()){
		print("Youre on the wrong path amigo, i dont handle that case", "Red");
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
	if(item_amount( $item[tires] ) < 1)
		buy (1, $item[tires] );
	if(item_amount( $item[sweet rims] ) < 1)
		buy (1, $item[sweet rims] );
		
	craft("combine", 1, $item[spring], $item[sprocket]); 			   				# spring + sprocket
	craft("combine", 1, $item[cog], $item[sprocket assembly]); 		   				# cog + sprocket assembly	
	craft("combine", 1, $item[empty meat tank], $item[meat stack]); 	   			# meat stack + empty meat tank
	craft("combine", 1, $item[cog and sprocket assembly], $item[full meat tank]); 
																					# cog and sprocket assembly + full meat tank
	craft("combine", 1, $item[tires], $item[sweet rims]);							# tires + sweet rims 	
	craft("combine", 1, $item[meat engine], $item[dope wheels]);      			    # meat engine + dope wheels
	
	print("Your meatcar has been made.", "green");
}

void main()
{
	if(my_meat() >= 1500) # you're not p*** a** poor.
	{
		make_meatcar();
	}
}