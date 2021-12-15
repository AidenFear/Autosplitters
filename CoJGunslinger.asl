/*------------------- Autosplitter + LRT Made by AidenFear -------------------*/
state("CoJGunslinger","1.0.5.0")
{
    byte loading  : 0x00AB706C, 0x320;//----------Game is Loading
    int startSc   : 0x121A918;//------------------Start Mission Screen
    int mission   : 0x2AEC26C;//------------------Current Mission
    byte movie    : "wmvdecod.dll", 0x17C778;//---A Movie is Playing
    byte fA       : 0x2A73734;//------------------Flag for LRT in Finale
    int brushTr   : 0x125D484;//------------------Brush Transition (Loading)   
    byte inLvl    : 0x121C6C4;
    
}
startup
{
        settings.Add("CH1",true,"Once Upon a Time in Stinking Springs");
        settings.Add("CH2",true,"Fistful of Hot Lead");
        settings.Add("CH3",true,"Bullet for the Old Man");
        settings.Add("CH4",true,"Gunfight at the Sawmill");
        settings.Add("CH5",true,"The Magnificent One");
        settings.Add("CH6",true,"Be Quick or Be Dead");
        settings.Add("CH7",true,"Dances with Renegades");
        settings.Add("CH8",true,"They Call Me Bounty Hunter");
        settings.Add("CH9",true,"Bounty Hunter is Still My Name");
        settings.Add("CH10",true,"Not so Great Train Robbery");
        settings.Add("CH11",true,"1:30 to Hell");
        settings.Add("CH12",true,"Death Rides a Steel Stallion");
        settings.Add("CH13",true,"Without Forgiveness");
        settings.Add("CH14",true,"The Good, The Bad and the Dead");
        settings.Add("FINALE",true,"Finale");
}
init
{
    vars.flagA=0;      
}
start
{
    vars.flagA=0;
    if (old.startSc==1 && current.startSc==2)
    {
        return true;
    }
}
split
{  
    if(current.startSc==26 && old.fA==220 && current.fA==30)
    {
        vars.flagA=1;
    }
    //splits
    /*
    The line → ""(timer.CurrentSplitIndex != timer.Run.Count - 1)"" asks if the current split is not the last split in the list,
    so that they don't become true on the last split which shares splitting values with them.
    */
    if(settings["CH1"] && old.mission==12 && current.mission==13  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH2"] &&old.mission==14 && current.mission==15  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH3"] &&old.mission==16 && current.mission==17  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    }
    if(settings["CH4"] &&old.mission==18 && current.mission==19  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH5"] &&old.mission==20 && current.mission==21  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH6"] &&old.mission==22 && current.mission==23  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    }
    if(settings["CH7"] &&old.mission==24 && current.mission==25  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH8"] &&old.mission==26 && current.mission==27 && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH9"] &&old.mission==27 && current.mission==28  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH10"] &&old.mission==29 && current.mission==30  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH11"] &&old.mission==30 && current.mission==31  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    } 
    if(settings["CH12"] &&old.mission==32 && current.mission==33  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    }
    if(settings["CH13"] &&old.mission==33 && current.mission==34  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    }
    if(settings["CH14"] &&old.mission==35 && current.mission==36  && (timer.CurrentSplitIndex != timer.Run.Count - 1))
    {
        return true;
    }
    if(settings["FINALE"] &&current.mission==37 && old.movie==0 && current.movie==1 && current.inLvl!=2 && current.inLvl!=0)
    {
        return true;
    }
}
isLoading
{
    if(current.inLvl==0 || current.inLvl==2 || (current.mission == 37 && vars.flagA<1) 
    || current.movie==1 || current.brushTr==16777216)
    {
        return true;
    }
    else
    {
        return false;
    }
}
reset
{
    if(old.mission!=0 && current.mission==0)
    {
        return true;
    }
    else
    {
        return false;
    }
}
