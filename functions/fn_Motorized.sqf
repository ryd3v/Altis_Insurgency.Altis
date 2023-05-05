// Copyright (c) 2023. Ryan Collins hello@ryd3v.com
// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

_newGrp = grpNull;
_newGrp = [[_axisX,_axisY,0], Resistance, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> (selectRandom ["OIA_MotInf_Team","OIA_MotInf_AT", "OIA_MotInf_AA", "OIA_MotInf_MGTeam", "OIA_MotInf_GMGTeam", "OIA_MotInf_MortTeam", "OIA_MotInf_Reinforce", "O_MotInf_ReconViperTeam", "O_MotInf_AssaultViperTeam"]), [], [], [0.2, 0.2]] call BIS_fnc_spawnGroup;

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;
_newGrp setCombatBehaviour "COMBAT";
_newGrp setCombatMode "RED";
{_x setSkill ["aimingAccuracy",0.05]} forEach (units _newGrp);

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _newGrp)};
_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
