/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname, Itemname, BuyPrice, SellPrice }
*
*    Itemname only needs to be filled if you want to rename the original object name.
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 27500, 500 },
            { "hgun_Pistol_heavy_02_F", "", 38500, -1 },
            { "hgun_ACPC2_F", "", 41500, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500 }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_TRG20_F", "", 25000, 2500 },
            { "arifle_Katiba_F", "", 30000, 5000 },
            { "srifle_DMR_01_F", "", 50000, -1 },
            { "arifle_SDAR_F", "", 20000, 7500 }
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300 },
            { "30Rnd_65x39_caseless_green", "", 275 },
            { "10Rnd_762x54_Mag", "", 500 },
            { "20Rnd_556x45_UW_mag", "", 125 }
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500 },
            { "optic_Holosight", "", 3600 },
            { "optic_Hamr", "", 7500 },
            { "acc_flashlight", "", 1000 }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 21500, 500 },
            { "hgun_Pistol_heavy_02_F", "", 31000, -1 },
            { "hgun_Rook40_F", "", 20500, 500 },
            { "hgun_Pistol_heavy_02_F", "", 31500, -1 },
            { "hgun_ACPC2_F", "", 35000, -1 },
            { "hgun_PDW2000_F", "", 95500, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 950 }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 750, -1 },
            { "ItemGPS", "", 500, 45 },
            { "ItemMap", "", 250, 35 },
            { "ItemCompass", "", 250, 25 },
            { "ItemWatch", "", 250, -1 },
            { "FirstAidKit", "", 750, 65 },
            { "NVGoggles", "", 10000, 980 },
            { "Chemlight_red", "", 1500, -1 },
            { "Chemlight_yellow", "", 1500, 50 },
            { "Chemlight_green", "", 1500, 50 },
            { "Chemlight_blue", "", 1500, 50 }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_shop_1 {
        name = "Polisaspirant";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 }
        };
        accs[] = {
            { "muzzle_snds_L", "", 0 },
	        { "acc_flashlight", "", 0, 0 }
        };
    };
	
	class cop_shop_2 {
        name = "Polisinspektör";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
	        { "acc_flashlight", "", 0, 0 }
        };
    };

    class cop_shop_3 {
        name = "Poliskommisarie";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
		    { "acc_flashlight", "", 0, 0 }
        };
    };

    class cop_shop_4 {
        name = "Polisintendent 1";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
		    { "acc_flashlight", "", 0, 0 }
        };
    };
	class cop_shop_5 {
        name = "Polisintendent 2";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
		    { "acc_flashlight", "", 0, 0 }
        };
    };
	class cop_shop_6 {
        name = "Polismästare";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
            		
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
			{ "acc_flashlight", "", 0, 0 }	
        };
    };
	class cop_shop_7 {
        name = "Polismästare";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }
            
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
			{ "acc_flashlight", "", 0, 0 }
        };
    };
	
	class cop_shop_8 {
        name = "Biträdande polisdirektör";
        side = "cop";
        license = "nis";
        level[] = { "life_coplevel", "SCALAR", 8, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }		
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
			{ "acc_flashlight", "", 0, 0 }
        };
    };
	
	class cop_shop_9 {
        name = "Polisdirektör";
        side = "cop";
        license = "nis";
        level[] = { "life_coplevel", "SCALAR", 9, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }		
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
			{ "acc_flashlight", "", 0, 0 }
        };
    };
	
	class cop_shop_10 {
        name = "Rikspolischef";
        side = "cop";
        license = "nis";
        level[] = { "life_coplevel", "SCALAR", 10, "You must be a higher Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 0, 0 },
            { "hgun_P07_F", "", 0, 0 },
			{ "SMG_05_F", "", 0, 0 },
            { "Binocular", "", 0, 0 },
            { "ItemGPS", "", 0, 0 },
            { "FirstAidKit", "", 0, 0 },
            { "NVGoggles_OPFOR", "", 0, 0 }		
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Taser Cartridge", 0 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0 }
        };
        accs[] = {
            { "optic_Aco", "", 0, 0 },
            { "muzzle_snds_L", "", 0 },
			{ "acc_flashlight", "", 0, 0 }
        };
    };


	class cop_nis_shop {
        name = "NIS";
        side = "cop";
        license = "";
        level[] = { "license_cop_nis", "BOOL", 1, "You must be NIS!" };
        items[] = {
			{ "arifle_Mk20_plain_F", "", 0, 0 },
			{ "arifle_SPAR_01_blk_F", "", 0, 0 },
			{ "arifle_SPAR_03_blk_F", "", 0, 0 },
			{ "SmokeShell", "", 0, 0 },
            { "SmokeShellBlue", "", 0, 0 },
			{ "HandGrenade_Stone", "Flashbang", 0, 0 }
		};
		mags[] = {
			{ "30Rnd_556x45_Stanag", "", 0 },
			{ "20Rnd_762x51_Mag", "", 0 }
        };
        accs[] = {
			{ "optic_Hamr", "", 0, 0 },
            { "optic_Aco", "", 0, 0 },
            { "optic_DMS", "", 0, 0 },
            { "optic_AMS", "", 0, 0 }
        };
	};


    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100, 45 },
            { "Binocular", "", 150, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 1200, 980 }
        };
        mags[] = {};
        accs[] = {};
    };
};