/*-------------------------- Autosplitter Made by AidenFear --------------------------*/
/*------------ Credits to zoton2 for finding the "Loading Screen" pointer ------------*/
state("TOD", "GOG")
{
int loading   : 0x63DFF0, 0x2F8, 0xD0, 0x38, 0x348, 0x124;//...Loading screen
int mission   : 0x63DFF0, 0xB08, 0x5C;//.......................Mission number
int FMV       : 0x635ED4;//....................................Video (FMV)
int pauseMenu : 0x0063DFF0, 0xFCC, 0x1E8;//....................Pause screen
int truckNo   : 0x0063CECC, 0xAF8, 0x8, 0x31C;//...............Trucks retrieved
int fertNo    : 0x0063B0C4, 0x5EC, 0xB9C;//....................Fertilizers destroyed
}
startup
{
    settings.CurrentDefaultParent=null;
    settings.Add("Fertilizers",true,"4/4 Fertilizer Tanks AutoSplitter (Splits on each destroyed tank)");
    settings.SetToolTip("Fertilizers","Check this option if you want to split on each destroyed fertilizer tank");
    settings.CurrentDefaultParent=null;
    settings.Add("Trucks",true,"3/3 Trucks AutoSplitter (Splits on each retrieved Truck)");
    settings.SetToolTip("Trucks","Check this option if you want to split on each truck you return");
    settings.CurrentDefaultParent=null;
    settings.Add("Train",true,"Check ✓ if you want to segment the last mission (Wagons/Turret Chase)");
}
init
{
    vars.movies=0;
} 
start
{   
    vars.mission=0;
    vars.truckNo=0;
    vars.FMV=0;
    vars.fertNo=0;
    vars.movies=0;
    if(current.mission==0 && old.FMV==0 && current.FMV==1)
    {
        return true;
    }    
}
split
{   
    if(old.loading==1 && current.loading==0)
    {
        vars.movies=0;
    }
    if(old.FMV==0 && current.FMV==1)
    {
        vars.movies=(vars.movies+1);
    }
    /*the father*/if (old.mission==0 && current.mission==1)
    {
        return true;        
    }
    /*the good son*/else if (old.mission==1 && current.mission==2)
    {
        return true;        
    }
    /*the bad son*/else if (old.mission==3 && current.mission==4)
    {
        return true;        
    }
    /*pC1*/else if (old.mission==30 && current.mission==4)
    {
        return true;        
    }
    /*pC2-rocket*/else if (old.mission==4 && current.mission==5)
    {
        return true;        
    }
    /*smash the stash*/else if (old.mission==5 && current.mission==6)
    {
        return true;        
    }
        /*1_fert*/if (current.mission==5 && old.fertNo==0 && current.fertNo ==1 && settings["Fertilizers"])
        {
            return true;        
        }
        /*2_fert*/if (current.mission==5 && old.fertNo==1 && current.fertNo==2 && settings["Fertilizers"])
        {
            return true;        
        }
        /*3_fert*/if (current.mission==5 && old.fertNo==2 && current.fertNo==3 && settings["Fertilizers"])
        {
            return true;        
        }
        /*4_fert*/if (current.mission==5 && old.fertNo==3 && current.fertNo==4 && settings["Fertilizers"])
        {
            return true;        
        }
    /*steal the wheels*/else if (old.mission==6 && current.mission==7)
    {
        return true;        
    }
    /*pC2*/else if (old.mission==31 && current.mission==7)
    {
        return true;        
    }
    /*pC3*/else if (old.mission==38 && current.mission==7)
    {
        return true;        
    }
    /*get the trucks*/else if (old.mission==8 && current.mission==9)
    {
        return true;        
    }
        /*1_truck*/if (current.mission==8 && old.truckNo==0 && current.truckNo==1 && settings["Trucks"])
        {
            return true;        
        }
        /*2_trucks*/if (current.mission==8 && old.truckNo ==1 && current.truckNo==2 && settings["Trucks"])
        {
            return true;        
        }
        /*3_trucks*/if (current.mission==8 && old.truckNo ==2 && current.truckNo==3 && settings["Trucks"])
        {
            return true;        
        }

    /*pC9*/else if (old.mission==33 && current.mission==9)
    {
        return true;        
    }
    /*scort the trucks*/else if (old.mission==10 && current.mission==11)
    {
        return true;        
    }
    /*the ambush*/else if (old.mission==11 && current.mission==12)
    {
        return true;        
    }
    /*a saving angel*/else if (old.mission==12 && current.mission==13)
    {
        return true;        
    }
    /*pC 10*/else if (old.mission==34 && current.mission==13)
    {
        return true;        
    }
    /*macho meeting*/else if (old.mission==14 && current.mission==16)
    {
        return true;        
    }
    /*kill the bull*/else if (old.mission==16 && current.mission==17)
    {
        return true;        
    }
    /*Race 15*/else if (old.mission==37 && current.mission==17)
    {
        return true;        
    }
    /*car dealer*/else if (old.mission==18 && current.mission==19)
    {
        return true;        
    }
    /*yunk race*/else if (old.mission==35 && current.mission==19)
    {
        return true;        
    }
    /*elvez*/else if (old.mission==20 && current.mission==21)
    {
        return true;        
    }
    /*highway attack*/else if (old.mission==21 && current.mission==22)
    {
        return true;        
    }
    /*the general*/else if (old.mission==23 && current.mission==24)
    {
        return true;        
    }
    /*escape the jungle*/else if (old.mission==24 && current.mission==25)
    {
        return true;        
    }
    /*pC13*/else if (old.mission==63 && current.mission==25)
    {
        return true;        
    }
    /*overdosed*/else if (old.mission==26 && current.mission==27)
    {
        return true;        
    }
    /*save the dea*/else if (old.mission==27 && current.mission==28)
    {
        return true;        
    }
    /*the getaway train*/else if (old.mission==28 && old.FMV==0 && current.FMV==1)
    {
        if(vars.movies==1 && current.FMV==1 && settings["Train"] && (timer.CurrentSplitIndex != timer.Run.Count - 1))
        {
            return true;
        }
        if(vars.movies==3 && current.FMV==1)
        {
            return true;
        }
    }
}
isLoading
{
	if(current.loading == 1)
    {
        return true;
    }   
    else 
    {
        return false;
    }
}
