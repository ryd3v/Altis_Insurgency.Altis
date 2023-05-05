// Copyright (c) 2023. Ryan Collins hello@ryd3v.com
// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

private _Heli = [[_axisX,_axisY,1000], random 360, "O_Heli_Attack_02_dynamicLoadout_F", east] call BIS_fnc_spawnVehicle;


_newGrp = createGroup east;
_unit01 = _newGrp createUnit ["_Heli", [_axisX,_axisY,100], [], 0, "CAN_COLLIDE"];
_unit01 setPosASL [_axisX,_axisY,100], random 360;
_unit01 enableDynamicSimulation true;
_unit01 setCombatBehaviour "COMBAT";
_unit01 setCombatMode "RED";

// Stalk players
waitUntil {sleep 5; simulationEnabled (leader _unit01)};
_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;

