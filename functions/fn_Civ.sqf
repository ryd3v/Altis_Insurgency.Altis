// Params
params
[
	["_axisX",0,[999]], // X axis
	["_axisY",0,[999]] // Y axis
];

_newGrp = createGroup civilian;

// civ1
_unit01 = _newGrp createUnit ["C_man_1_1_F", [_axisX,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit01 setPosASL [_axisX,_axisY,0];

// civ2
_unit02 = _newGrp createUnit ["C_man_polo_1_F_euro", [_axisX + 1,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit02 setPosASL [_axisX + 1,_axisY,0];

// civ3
_unit03 = _newGrp createUnit ["C_man_polo_2_F_euro", [_axisX + 1,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit03 setPosASL [_axisX + 1,_axisY,0];

// civ4
_unit04 = _newGrp createUnit ["C_Nikos_aged", [_axisX + 1,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit04 setPosASL [_axisX + 1,_axisY,0];

// civ5
_unit05 = _newGrp createUnit ["C_Nikos", [_axisX + 1,_axisY,0], [], 0, "CAN_COLLIDE"];
_unit05 setPosASL [_axisX + 1,_axisY,0];

// Enable Dynamic simulation
_newGrp enableDynamicSimulation true;
sleep (30 + (random 30));

//{_x disableAI "Autocombat"} forEach (units _newGrp);
_newGrp setBehaviour "CARELESS";
_newGrp setCombatMode "Red";

