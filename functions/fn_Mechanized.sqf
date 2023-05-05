// Copyright (c) 2023. Ryan Collins hello@ryd3v.com
// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

_newGrp = grpNull;
_newGrp = [[_axisX,_axisY,0], Resistance, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Mechanized" >> (selectRandom ["OIA_MechInfSquad","OIA_MechInf_AT", "OIA_MechInf_AA", "OIA_MechInf_Support"]), [], [], [0.2, 0.2]] call BIS_fnc_spawnGroup;

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;
_newGrp setCombatBehaviour "COMBAT";
_newGrp setCombatMode "RED";
{_x setSkill ["aimingAccuracy",0.05]} forEach (units _newGrp);

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _newGrp)};
_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
