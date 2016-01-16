/*
 **  BLOWOUT MODULE - Nightstalkers: Shadow of Namalsk
 *   ..created by Sumrak, ©2010
 *   http://www.nightstalkers.cz
 *   sumrak<at>nightstalkers.cz
 *   PBO edition
 *   SERVER-SIDE script 
*/
private["_emp_tg_namalsk"];
diag_log "BLOWOUT SERVER - Loaded";
// init
while {true} do {
 _emp_tg_namalsk = 0;
 if (isNil("ns_blow_emp")) then { ns_blow_emp = false; }; 
 if (isNil("ns_blowout")) then { ns_blowout = true; }; 
 if (isNil("ns_blowout_exile")) then { ns_blowout_exile = false; };
 if (isNil("ns_blow_delaymod")) then { ns_blow_delaymod = 1; };
 if (isNil("ns_blow_prep")) then { ns_blow_prep = false; };
 
  private["_prodleva"];
  if(ns_blowout_exile) then {
   _prodleva = random (6000 * ns_blow_delaymod);
   while {_prodleva < (3000 * ns_blow_delaymod)} do {
     _prodleva = random (6000 * ns_blow_delaymod);
   };
  } else {
   _prodleva = (random (1600 * ns_blow_delaymod));
   while {_prodleva < (800 * ns_blow_delaymod)} do {
     _prodleva = random (1600 * ns_blow_delaymod);
   };
  };
  
  diag_log format["[NAC BLOWOUT SERVER] :: Next blowout in _delay (_delay = %1), delay modifier is %2 (ns_blow_delaymod)", _prodleva, ns_blow_delaymod];
  sleep _prodleva;

  if(!ns_blowout) then {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is temporarily OFF ns_blowout (ns_blowout = %1)", ns_blowout];
  } else {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is ON ns_blowout (ns_blowout = %1)", ns_blowout];
  };
  
  if(ns_blowout_exile) then {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is in DayZ mode ns_blowout_exile (ns_blowout_exile = %1)", ns_blowout_exile];
  };
  
  // Stop variable check
  waitUntil{ns_blowout};

  if (ns_blow_emp) then {
     diag_log format["[NAC BLOWOUT SERVER] :: Boosting up efficiency, EMP target Namalsk and surroundings (ns_blow_emp = %1)", ns_blow_emp];
     _emp_tg_namalsk = 1;
  } else {
     diag_log format["[NAC BLOWOUT SERVER] :: Normal output, EMP target surroundings of Namalsk (ns_blow_emp = %1)", ns_blow_emp];
     _emp_tg_namalsk = 0;
  };
  
  // Preparations before blowout - APSI / players running to take a cover
  ns_blow_prep = true;
  publicVariable "ns_blow_prep";
  diag_log format["[NAC BLOWOUT SERVER] :: Preparations are under way (ns_blow_prep = %1)", ns_blow_prep];
  sleep 10;
  ns_blow_prep = false;
  publicVariable "ns_blow_prep";
  diag_log format["[NAC BLOWOUT SERVER] :: Preparations are finished (ns_blow_prep = %1)", ns_blow_prep];
  
  // main blowout variable - 1 == blowout in progress, 0 == no current blowout
  ns_blow_status = true;
  publicVariable "ns_blow_status";
  diag_log format["[NAC BLOWOUT SERVER] :: Blowout in progress (ns_blow_status = %1)", ns_blow_status];
  sleep 2;
  if (ns_blow_status) then {
    ns_blow_action = true;
    publicVariable "ns_blow_action";
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout actions in progress (ns_blow_action = %1)", ns_blow_action];
	sleep 10;
    ns_blow_action = false;
    publicVariable "ns_blow_action";
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout actions finished (ns_blow_action = %1)", ns_blow_action];
  };
  sleep 10;
  ns_blow_status = false; 
  publicVariable "ns_blow_status";
  diag_log format["[NAC BLOWOUT SERVER] :: Blowout finished (ns_blow_status = %1)", ns_blow_status];
};