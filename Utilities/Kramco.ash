#This script is for learning pourpses. 
#Nightcaping is important!

script "Kramco.ash";
#notify "Rufus Flecher";

//
//Use meat paste to make sausages. YAY!
//
void KramcoSingle(int num)
{
	num = 11 * num + 1; // need 12 meat pastes for 111 points in grinder,
						// need 23 meat pastes for 222 points in grinder etc..
	// Craft meat paste..					
	string page = visit_url("craft.php?action=makepaste&pwd=" + my_hash() + 
		"&qty=" + num + "&whichitem=25");	
	
	set_property("choiceAdventure1339", 1);
	//string pag = visit_url("choice.php&whichchoice=1339&pwd=" + my_hash() + "&qty=" + num+ "&iid=25&option=1");//
	string pag = visit_url("choice.php?pwd&whichchoice=1339&qty=" + num+ "&iid=25&option=1");//
	run_choice(1);
	set_property("choiceAdventure1339", 2);
	//wait(1);
	//string pa = visit_url("choice.php&whichchoice=1339&pwd=" + my_hash() + "&option=2");
	run_choice(2);
}

void Kramco(int num)
{
	if( num < 23 && num > 0)
	{
		int i = 1;
		while(i <= num)
		{
			KramcoSingle(i);
			i++;
		}
	}
}

boolean KramcoExpectedGoblinTurn(int turn)
{
	if( turn == 0 ||
		turn == 5 ||
		turn == 10 ||
		turn == 20 ||
		turn == 30 ||
		turn == 50 ||
		turn == 70 ||
		turn == 90 ||
		turn == 110 ||
		turn == 140 ||
		turn == 170 ||
		turn == 200 ||
		turn == 230 ||
		turn == 260 ||
		turn == 290 ||
		turn == 320 
		)
		return true;
	return false;	
}

boolean KramcoOneAfterExpectedGoblinTurn(int turn)
{
	if(turn > 0)
		return KramcoExpectedGoblinTurn(turn - 1);
	else
		return false;
}

void main()
{
	//KramcoSingle(8);
	Kramco(5);
}

