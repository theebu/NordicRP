#define ST_CENTER         0x02
#define IDC_LIFE_BAR_SeatBelt 4203
/*
    Author: Daniel Stuart

    File: hud_stats.hpp
*/

class playerHUD {
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] = {
        //Life_RscBackground_HUD,
        Life_RscProgress_HUDFood,
        Life_RscProgress_HUDHealth,
        Life_RscProgress_HUDWater,
        Life_RscText_HUDFood,
        Life_RscText_HUDHealth,
        Life_RscText_HUDWater,
		LIFE_BAR_SeatBelt
    };

    /* Background */
    /*class Life_RscBackground_HUD: Life_RscBackground {
        colorBackground[] = {0,0,0,0.35};
        x = 0.414815 * safezoneW + safezoneX;
        y = 0.966667 * safezoneH + safezoneY;
        w = 0.170371 * safezoneW;
        h = 0.0333333 * safezoneH;
    };*/
	/* WaterMark 
	class LIFE_PICTURE_WATERMARK: Life_RscPicture{
		idc = 9999;
		text = "textures\nrpwater.paa";
		x = 0.85 * safezoneW + safezoneX;
		y = 0.85 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.128 * safezoneH;
	};*/
    /* Progress Bars */
    class LIFE_RscProgress_HUDCommon: Life_RscProgress {
        colorFrame[] = {0, 0, 0, 0.8};
        y = 0.972223 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscProgress_HUDFood: LIFE_RscProgress_HUDCommon {
        idc = 2200;
        colorBar[] = {0.05,0.21,0.00,0.6};
		x = 0.475 * safezoneW + safezoneX;
		y = 0.95  * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
    };

    class Life_RscProgress_HUDHealth: LIFE_RscProgress_HUDCommon {
		idc = 2201;
        colorBar[] = {0.21,0.00,0.05,0.6};
		x = 0.375 * safezoneW + safezoneX;
		y = 0.95  * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
    };

    class Life_RscProgress_HUDWater: LIFE_RscProgress_HUDCommon {
        idc = 2202;
        colorBar[] = {0.00,0.02,0.21,0.6};
		x = 0.575 * safezoneW + safezoneX;
		y = 0.95  * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
    };

    /* Texts */
    class Life_RscText_HUDCommon: Life_RscText {
        SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        style = ST_CENTER;
        y = 0.970023 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscText_HUDFood: Life_RscText_HUDCommon {
        idc = 1200;
        text = "$STR_HUD_Food";
        x = 0.495 * safezoneW + safezoneX;
		y = 0.953 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.012 * safezoneH;
    };

    class Life_RscText_HUDHealth: Life_RscText_HUDCommon {
        idc = 1201;
        text = "$STR_HUD_Health";
        x = 0.395 * safezoneW + safezoneX;
		y = 0.953 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.012 * safezoneH;
    };

    class Life_RscText_HUDWater: Life_RscText_HUDCommon {
        idc = 1202;
        text = "$STR_HUD_Water";
        x = 0.595 * safezoneW + safezoneX;
		y = 0.953  * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.012 * safezoneH;
    };
	
	class LIFE_BAR_SeatBelt: Life_RscPicture
	{
		idc = IDC_LIFE_BAR_SeatBelt;
		text = "";
		x = 0.952292 * safezoneW + safezoneX;
		y = 0.664333 * safezoneH + safezoneY;
		w = 0.0331042 * safezoneW;
		h = 0.0589743 * safezoneH;
	};
};