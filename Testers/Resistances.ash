#This script is for learning pourpses. 
#This script contains basic item manipulation.

script "LoggoutOutfitter.ash";
#notify "Rufus Flecher";

void main()
{
	maximize("cold resistance, spooky resistance",1000, 1000, true,);
    print(numeric_modifier("Generated:_spec", "cold resistance"));
    print(numeric_modifier("Generated:_spec", "Maximum HP"));
    print(numeric_modifier("Generated:_spec", "Spooky Resistance"));
}