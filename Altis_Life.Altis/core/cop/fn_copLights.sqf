/*
    File: fn_copLights.sqf
    Author: [GSN] Pager & [GSN] Paronity
    Website: GSNGaming.com
    Date Created: 2.24.2015
    Date Modified: 3.3.2015 v1.3
*/

private ["_veh","_lightRed","_lightWhite","_lightBlue","_lightsOn","_brightnessHigh","_brightnessLow","_attach","_leftLights","_rightLights","_type","_attenuation"];

_veh = (_this select 0);
_type = typeOf _veh;
_sun = (sunOrMoon < 1);

if (isNil "_veh" || isNull _veh || !(_veh getVariable "lights")) exitWith {};

_lightRed = [255, 0, 0];
_lightWhite = [255, 255, 255];
_lightBlue = [0, 0, 255];

if (_sun) then
{
    _brightnessLow = 0;
    _brightnessHigh = 120;
    _attenuation = [0.001, 3000, 0, 900000];
} else {
    _brightnessLow = 0;
    _brightnessHigh = 60;
    _attenuation = [0.001, 3000, 0, 500000];
};

_flashes = 3;
_flashOn = 0.1;
_flashOff = 0.001;

_leftLights = [];
_rightLights = [];

_attach =
{
    _isLight = _this select 0;
    _color = _this select 1;
    _position = _this select 2;
    _light = "#lightpoint" createVehicleLocal getPos _veh;
    _light setLightBrightness 0;
    _light setLightAmbient [0,0,0];
    _light setLightAttenuation _attenuation;
    _light setLightIntensity 100;
    _light setLightFlareSize 1;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;

    switch (_color) do
    {
        case "red": { _light setLightColor _lightRed; };
        case "white": { _light setLightColor _lightWhite; };
        case "blue": { _light setLightColor _lightBlue; };
    };

    if (_isLight) then
    {
        _leftLights pushBack [_light, _position];
    } else {
        _rightLights pushBack [_light, _position];
    };

    _light lightAttachObject [_veh, _position];
};

switch (_type) do
{
    case "C_Offroad_01_blue_F":
    {
        [false, "blue", [-0.44, 0, 0.525]] call _attach;
        [true, "blue", [0.345, 0, 0.525]] call _attach;
        [false, "blue", [0.575, -2.95, -0.77]] call _attach;
        [true, "blue", [-0.645, -2.95, -0.77]] call _attach;
        [false, "white", [0.61, 2.2825, -0.355]] call _attach;
        [true, "white", [-0.695, 2.2825, -0.355]] call _attach;
    };

    case "C_SUV_01_F":
    {
        [false, "blue", [-0.39, 2.28, -0.52]] call _attach;
        [true, "blue", [0.38, 2.28, -0.52]] call _attach;
        [false, "blue", [-0.86, -2.75, -0.18]] call _attach;
        [true, "blue", [0.86, -2.75, -0.18]] call _attach;
        [false, "white", [0.8, 1.95, -0.48]] call _attach;
        [true, "white", [-0.8, 1.95, -0.48]] call _attach;

    };

    case "C_Hatchback_01_sport_blue_F":
    {
        [false, "blue", [-0.03, -0, 0.2]] call _attach;
        [true, "blue", [-0.03, -0, 0.2]] call _attach;
        [false, "blue", [-0.8, -2.25, -0.3]] call _attach;
        [true, "blue", [0.78, -2.25, -0.3]] call _attach;
        [false, "white", [0.75, 1.615, -0.52]] call _attach;
        [true, "white", [-0.8, 1.615, -0.525]] call _attach;
    };

    case "B_MRAP_01_F":
    {
        [false, "blue", [-0.85, -0.9, 0.6]] call _attach;
        [true, "blue", [0.85, -0.9, 0.6]] call _attach;
        [true, "blue", [-0.93, -2.8, 0.6]] call _attach;
        [false, "blue", [0.93, -2.8, 0.6]] call _attach;
        [true, "white", [-0.85, 1.475, -0.75]] call _attach;
        [false, "white", [0.85, 1.475, -0.75]] call _attach;
    };
	
	case "B_Quadbike_01_F":
	{
	    [true,"blue", [-0.07, 1, -0.7]] call _attach;
		[false,"blue", [0.07, 1, -0.7]] call _attach;
		[false,"white", [0, -2.3, 0.7]] call _attach;
	};
	case "O_MRAP_02_F":
	{
	    [false, "blue", [-1.3, -1.35, 0.6]] call _attach;
        [true, "blue", [1.3, -1.35, 0.6]] call _attach;
        [true, "blue", [-0.93, -4.1, 0.6]] call _attach;
        [false, "blue", [0.93, -4.1, 0.6]] call _attach;
        [true, "white", [-0.75, 1.275, -0.95]] call _attach;
        [false, "white", [0.75, 1.275, -0.95]] call _attach;
	};
	case "B_MRAP_01_hmg_F":
	{
	    [false, "blue", [-0.85, -0.9, 0.6]] call _attach;
        [true, "blue", [0.85, -0.9, 0.6]] call _attach;
        [true, "blue", [-1.1, -2.8, 0.6]] call _attach;
        [false, "blue", [1.1, -2.8, 0.6]] call _attach;
        [true, "white", [-0.85, 1.475, -0.55]] call _attach;
        [false, "white", [0.85, 1.475, -0.55]] call _attach;
	};
	case "I_Truck_02_covered_F":
	{
	    [false, "red", [-0.65, -0.2, 0.6]] call _attach;
		[true, "blue", [0.65, -0.2, 0.6]] call _attach;
	};
};

_lightsOn = true;
while {(alive _veh)} do
{
    if (!(_veh getVariable "lights")) exitWith {};
    if (_lightsOn) then
    {
        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (_x select 0) setLightBrightness _brightnessHigh; } forEach _leftLights;
            uiSleep _flashOn;
            { (_x select 0) setLightBrightness _brightnessLow; } forEach _leftLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _leftLights;

        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (_x select 0) setLightBrightness _brightnessHigh; } forEach _rightLights;
            uiSleep _flashOn;
            { (_x select 0) setLightBrightness _brightnessLow; } forEach _rightLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _rightLights;
    };
};

{ deleteVehicle (_x select 0) } foreach _leftLights;
{ deleteVehicle (_x select 0) } foreach _rightLights;

_leftLights = [];
_rightLights = [];
 
