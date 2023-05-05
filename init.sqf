// Sling loading
execVM "scripts\slingloading\fn_advancedSlingLoadingInit.sqf";

// BON
execVM "bon_recruit_units\init.sqf";

//Stamina
if (hasinterface) then
    {
    waitUntil {!isnull player};
    player enableStamina false;
    player setCustomAimCoef 0;
    player addEventHandler ["Respawn", {player enableStamina  false}];
    player addEventHandler ["Respawn", {player setCustomAimCoef  0}];
    };
forceWeatherChange;