#My lame mp meat maid making script.

script "Gibberish.ash";
//notify "Rufus Flecher";

string olfact_tourist(int round, monster opp, string text) {
   if(opp != $monster[garbage tourist])
      return get_ccs_action(round);
   if(round == 1 && have_effect($effect[On the Trail]) < 1)
      return "skill transcendent olfaction";
   return get_ccs_action(round - 1);
}

void run()
{
	//cli_execute("maximize meat, +equip cheap sunglasses -tie");
	//adventure(1 , $location[Barf Mountain], "olfact_tourist");
	
	//use(1,$item[SongBoom™ BoomBox]);
	//wait(2);
	//cli_execute("ashq run_choice(5)");
	//string page = visit_url("place.php?whichplace=airport_stench&action=airport3_tunnels");
	//page = visit_url("choice.php?whichchoice=1067&option=6");
	
	//set_location($location[Mysterious Island Arena]);
	//https://www.kingdomofloathing.com/postwarisland.php?place=concert
	//string page = visit_url("postwarisland.php?place=concert?option=2",true); //TODO: Try this out!
	//print(page);
	//string page = visit_url("friars.php?bro=1"); //TODO: Try this out!
	//print(page);
	//equip($item[mafia pinky ring]);
	//string page = visit_url("inv_use.php?&which=1&whichitem=3323"); //TODO: Try this out!
	//<select name=whichitem><option value=7772>"meat" stick (6)
	//matcher whatToEat = create_matcher("Select an item:")//&which=1
	//maximize("hot resistance", false);
	//string page = visit_url("inv_eat.php?utensil=3323&pwd=" + my_hash() + "&which=1&whichitem=3327");
	
	//Kramco
	//string page = visit_url("choice.php?whichchoice=1339&pwd=" + my_hash() + "&qty=33&iid=25&option=1");
	//page = visit_url("choice.php?whichchoice=1339&pwd=" + my_hash() + "&option=2");
	
	//meat paste:
	//string page = visit_url("craft.php?action=makepaste&pwd=" + my_hash() + "&qty=1&whichitem=25");
	
	//Pot Meat
	//string page = visit_url("clan_rumpus.php?action=click&spot=9&furni=3");
	
	//Concert.
	//string page = visit_url("postwarisland.php?action=concert&pwd=" + my_hash() + "&option=2");
	
	//Clan rumpus room..
	//page = visit_url("clan_rumpus.php?preaction=jukebox&whichsong=1");
	//page = visit_url("clan_rumpus.php?preaction=ballpit");
}

/*
void barfCSS(){
	[garbage tourist]
	try to steal an item
	skill transcendent olfaction
	skill sing along
	attack with weapon
	attack with weapon
	
	[default]
	try to steal an item
	skill sing along
	attack with weapon
	attack with weapon
}
*/

void main()
{
	run();
}