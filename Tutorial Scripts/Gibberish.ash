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
	string page = visit_url("place.php?whichplace=airport_stench&action=airport3_tunnels");
	page = visit_url("choice.php?whichchoice=1067&option=6");
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