#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class Life_Cop_Placeables {
    idd = 20000;
    name= "life_cop_placeables";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "";
    
    class controlsBackground {
        class MainBackground: Life_RscText
		{
			idc = -1;

			x = 8.4 * GUI_GRID_W + GUI_GRID_X;
			y = 6.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
    };
    
    class controls {
        class Title: Life_RscTitle
		{
			idc = -1;

			text = "Available placeables"; //--- ToDo: Localize;
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
        
        class PlaceablesList: Life_RscListBox
		{
			idc = 20001;
			text = "";
            sizeEx = 0.035;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		
		class PlaceablesImage: life_RscPicture
		{
			idc = 20002;
			text = "";
            sizeEx = 0.035;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
		};

        class CloseButtonKey: Life_RscButtonMenu
		{
			text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
			idc = 1004;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
        
        class RemoveAll: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_placeablesRemoveAll";
			sizeEx = 0.035;
			idc = 1005;
			text = "Remove all"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.2,0,0,0.8};
			tooltip = "Remove all placed by you"; //--- ToDo: Localize;
		};
        
        class Place: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_placeablePlace;";
			sizeEx = 0.035;
			idc = 1006;
			text = "      Take Out"; //--- ToDo: Localize;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.25 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		
		class infotext: Life_RscText
		{
			sizeEx = 0.035;
			idc = 1007;
			text = "Press 'SPACEBAR' to place any object you are holding."; //--- ToDo: Localize;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
    };
};