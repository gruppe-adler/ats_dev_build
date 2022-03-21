#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_Steam
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ATS_Trains"};
	};
};

class CfgVehicles {
	
	class Items_base_F;
    class ATS_Trains_Base: Items_base_F {
        class AnimationSources;
    };
	class ATS_Trains_Steam_Small : ATS_Trains_Base
	{
		scope = public;
		model = "\ats\trains\steam\models\ats_trains_steam_small.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_Steam_Small.jpg";
		displayName = "Steam Locomotive (Small)";
		author 	= "Profi Developers, imported by badbenson";
	};
	
	class ATS_Trains_Steam_Large : ATS_Trains_Base
	{
		scope = public;
		model = "\ats\trains\steam\models\ats_trains_steam_large.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_Steam_Large.jpg";
		displayName = "Steam Locomotive (Large)";
		author 	= "Profi Developers, imported by badbenson";		
	};
	
};