// AutoBHH
// originally by izchak
// major revisions by Raorn and Zarqon
// Reformatting by Rufus Flecher
import <canadv.ash>
setvar("do_smallest_bounty",false);

bounty[int] options;
bounty[int] current;
boolean[bounty] avail;

int initiallucre = item_amount($item[filthy lucre]); # gets lucre count for??

string bstring(int n) 
{
   return (options contains n) ? options[n].number+" "+options[n].plural+" from "+options[n].monster : "";
}

string cstring(int n) 
{
   return (current contains n) ? current[n].number+" "+current[n].plural+" from "+current[n].monster : "";
}

boolean can_has_bounty(int n) 
{
//   if (get_safemox(options[n].location) > my_defstat() + to_int(vars["threshold"])) return false;
   return can_adv(options[n].location,false);
}

string visit_bhh(string query) 
{
   options.clear();
   string page = visit_url("bounty.php?pwd"+query);
	int it = 0;
	int cur = 0;
	if (get_property("_untakenEasyBountyItem") != "") 
	{
		options[it] = get_property("_untakenEasyBountyItem").to_bounty();
		avail[options[it]] = can_has_bounty(it);
		vprint(bstring(it), avail[options[it]] ? "green" : "red",3);
		it += 1;
	}
	else if (get_property("currentEasyBountyItem") != "") 
	{
		current[cur] = get_property("currentEasyBountyItem").to_bounty();
		vprint(cstring(it), can_adv(current[cur].location,false) ? "green" : "red",3);
		cur += 1;
	}
	if (get_property("_untakenHardBountyItem") != "") 
	{
		options[it] = get_property("_untakenHardBountyItem").to_bounty();
		avail[options[it]] = can_has_bounty(it);
		vprint(bstring(it), avail[options[it]] ? "green" : "red",3);
		it += 1;
	}
	else if (get_property("currentHardBountyItem") != "") 
	{
		current[cur] = get_property("currentHardBountyItem").to_bounty();
		vprint(cstring(it), can_adv(current[cur].location,false) ? "green" : "red",3);
		cur += 1;
	}
	if (get_property("_untakenSpecialBountyItem") != "") 
	{
		options[it] = get_property("_untakenSpecialBountyItem").to_bounty();
		avail[options[it]] = can_has_bounty(it);
		vprint(bstring(it), avail[options[it]] ? "green" : "red",3);
		it += 1;
	}
	else if (get_property("currentSpecialBountyItem") != "") 
	{
		current[cur] = get_property("currentSpecialBountyItem").to_bounty();
		vprint(cstring(it), can_adv(current[cur].location,false) ? "green" : "red",3);
		cur += 1;
	}
	if (cur > 0) foreach i,r in current
		print("Now hunting: "+cstring(i),"blue");
	#      print("Now hunting: "+cstring(i)+" (hunted so far: "+item_amount(r)+")","blue");
	return page;
}

visit_bhh("");

boolean accept_bounty(int n) 
{
   if (count(options) < 1) 
		return false;
   vprint("Accepting the hunt for "+bstring(n)+"...",2);
   visit_bhh("&action=take"+options[n].kol_internal_type);
   return true;
}

boolean cancel_bounty() 
{
   vprint("Aborting current hunt...",2);
   visit_bhh("&action=giveup_"+substring(current[0].kol_internal_type, 0, 3));
   return true;
}

boolean accept_best_bounty(boolean small) {
   if (count(options) < 1) 
		return false;
   if (small) 
		sort options by value.number;
   else 
		sort options by -get_safemox(value.location);
   foreach i,r in options 
		if (avail[r]) 
			return accept_bounty(i);
		else 
			vprint("Impossible! Skipping...",2);
   return false;
}

record bountyCount 
{
    int place;
    item bountyitem;
    float adventures;
};

bountyCount[int] bestBounty;

#boolean accept_optimal_bounty() 
#{
#   if (count(current) > 0) 
#		return true;
#   foreach i,r in options 
#	{
#      bestBounty[i].place = i;
#      bestBounty[i].bountyitem = options[i].to_string().to_item();
#      foreach it in bountyDB 
#		{
#         if (bountyDB[it].it == options[i].to_string().to_item())
#            bestBounty[i].adventures = average_turns(bountyDB[it], combat_rate_modifier(), have_skill($skill[Transcendent Olfaction]), false, 0);
#      }
#   }
#   sort bestBounty by value.adventures;
#   foreach i in bestBounty 
#		if (avail[bestBounty[i].bountyitem.to_string().to_bounty()]) 
#			return accept_bounty(bestBounty[i].place);
#       else 
#			vprint("Impossible! Skipping...",2);
#   return false;
#}

boolean hunt_bounty() 
{
   if (count(current) < 1 && !accept_best_bounty(to_boolean(vars["do_smallest_bounty"]))) return false;
   foreach i,r in current 
   {
     vprint("Adventuring for "+cstring(i)+"...",2);
     if (count(get_goals()) > 0)
     {
       cli_execute("conditions clear");
     }
     add_item_condition(1, $item[filthy lucre]);
     if (!can_adv(r.location, true)) vprint("Something went wrong getting the area ready for you.",0);
     adventure(my_adventures(),r.location);
	 #     if (get_property("currentBountyItem") != "0") return false;
     visit_bhh("");
   }
   return vprint("You have "+available_amount($item[filthy lucre])+" filthy lucre.",3);
}

void main(string param) 
{
   if (count(options) + count(current) == 0) 
		vprint("Bounty hunt already completed today.",-3);
   else if (initiallucre != item_amount($item[filthy lucre])) 
		vprint("You just turned in your bounty.",-3);
   else switch (param) 
   {
      case "list": 
			return;
      case "cancel":
      case "abort": 
			if (count(current) > 0 && cancel_bounty()) vprint("Bounty hunt canceled.",2); return;
      case "hard":
      case "best": 
			accept_best_bounty(false); return;
      case "smallest":
      case "small": 
			accept_best_bounty(true); return;
	  #      case "optimal": accept_optimal_bounty(); return;
      case "go":
      case "*": 
			if (hunt_bounty()) 
				vprint("Bounty hunt successful.",3);
			else vprint("Bounty hunt failed.",-2); return;
      default: 
			print_html("<b>Usage:</b><p>bounty.ash {go|*}<br>bounty.ash list<br>bounty.ash {best|small|hard}<br>bounty.ash {abort|cancel}");
   }
}
