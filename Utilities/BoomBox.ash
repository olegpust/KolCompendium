#This script is for learning pourpses. 
#Nightcaping is important!

script "BoomBox.ash";
#notify "Rufus Flecher";

void UseMeatSong()
{
	string page = visit_url("inv_use.php?pwd=&which=3&whichitem=9919");
	matcher boomMatcher = create_matcher("You grab your boombox and select the soundtrack for your life,  which you can do <b>(?:-?)(\\d+)", page);
	int option = 5;
	if(boomMatcher.find())
	{
		int boomsLeft = to_int(boomMatcher.group(1));
	}
	else
	{
		print("Could not find how many songs we have left...", "red");
		option = 6;
	}
	page = visit_url("choice.php?whichchoice=1312&option=" + option);
	if(contains_text(page, "don\'t want to break this thing"))
	{
		print("Unable to change BoomBoxen songen!", "red");
	}
	print("Change successful to " + get_property("boomBoxSong"), "green");
}

void main()
{
	UseMeatSong();
}

