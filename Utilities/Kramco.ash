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
	page = visit_url("choice.php?whichchoice=1339&pwd=" + my_hash() + 
		"&qty=" + num + "&iid=25&option=1");
	page = visit_url("choice.php?whichchoice=1339&pwd=" + my_hash() + "&option=2");
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
		turn == 7 ||
		turn == 17 ||
		turn == 27 ||
		turn == 32 ||
		turn == 36 ||
		turn == 44 ||
		turn == 54 ||
		turn == 70 ||
		turn == 90 )
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
	//Kramco(8);
}

