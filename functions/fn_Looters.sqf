// Copyright (c) 2023. Ryan Collins hello@ryd3v.com
// Looters
// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

_newGrp = grpNull;
_newGrp = [[_axisX,_axisY,0], Resistance, configFile >> "CfgGroups" >> "Indep" >> "IND_L_F" >> "Infantry" >> (selectRandom ["I_L_LooterGang","I_L_CriminalGang"]), [], [], [0.2, 0.2]] call BIS_fnc_spawnGroup;

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;
_newGrp setCombatBehaviour "COMBAT";
_newGrp setCombatMode "RED";

{_x setSkill ["aimingAccuracy",0.05]} forEach (units _newGrp);

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _newGrp)};
_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;