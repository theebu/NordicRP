#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart
    Description:
    Sets skins for players by their side and uniform.
*/
private ["_skinName"];

switch (playerSide) do {
    case civilian: {
        if (LIFE_SETTINGS(getNumber,"civ_skins") isEqualTo 1) then {
            if (uniform player isEqualTo "U_C_Poloshirt_blue") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_1.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_2.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_stripped") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_3.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_tricolour") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_4.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_salmon") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_5.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_6.jpg"];
            };
            if (uniform player isEqualTo "U_C_Commoner1_1") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_7.jpg"];
            };
        };
    };

    case west: {
        if (uniform player isEqualTo "U_BG_Guerrilla_6_1") then {
            _skinName = "textures\police\troja\sweater_uniform_1.paa";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if ((FETCH_CONST(life_coplevel) >= 4) && (FETCH_CONST(life_coplevel) <= 7)) then {
                    _skinName = ["textures\police\troja\sweater_uniform_",(call life_coplevel),".paa"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		if (uniform player isEqualTo "U_O_OfficerUniform_ocamo") then {
            _skinName = "textures\police\Jacka\cop_uniform_1.paa";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName = ["textures\police\Jacka\cop_uniform_",(call life_coplevel),".paa"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
            _skinName = "textures\police\NIS\NIS_uniform_5.paa";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if ((FETCH_CONST(life_coplevel) >= 5) && (FETCH_CONST(life_coplevel) <= 6))then {
                    _skinName = ["textures\police\NIS\NIS_uniform_",(call life_coplevel),".paa"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		if (uniform player isEqualTo "U_B_HeliPilotCoveralls") then {
            _skinName = "textures\police\Pilot\polisPIlot.paa";
            player setObjectTextureGlobal [0, _skinName];
        };
		
		if ((backpack player) in ["B_TacticalPack_blk","B_AssaultPack_blk","B_FieldPack_blk"]) then
		{
			(backpack player) setObjectTextureGlobal [0,""];
		};
    };

    case independent: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            player setObjectTextureGlobal [0, "textures\Medic\medicuniform.jpg"];
        };
    };
};