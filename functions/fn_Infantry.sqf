// Copyright (c) 2023. Ryan Collins hello@ryd3v.com
// Infantry
// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

_newGrp = grpNull;
_newGrp = [[_axisX,_axisY,0], Resistance, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> (selectRandom ["OIA_InfSquad","OIA_InfSquad_Weapons", "OIA_InfTeam", "OIA_InfTeam_AT", "OIA_InfTeam_AA", "OIA_InfSentry", "OI_reconTeam", "OI_reconPatrol", "OI_reconSentry", "OI_SniperTeam", "OIA_InfAssault", "OIA_ReconSquad", "O_InfTeam_AT_Heavy"]), [], [], [0.2, 0.2]] call BIS_fnc_spawnGroup;

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;

{_x setSkill ["aimingAccuracy",0.05]} forEach (units _newGrp);

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _newGrp)};
_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;