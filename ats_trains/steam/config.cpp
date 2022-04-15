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

		class Sounds
        {
            class train_engine_idle
            {
                sound[] = {"\ats\core\sounds\train_steam_engine_idle.ogg", 2, 1, 600};
                frequency = "1";
                volume = "CustomSoundController1";
            };
            class train_engine
            {
                sound[] = {"\ats\core\sounds\train_steam_engine.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController2";
            };
            class train_track
            {
                sound[] = {"\ats\core\sounds\train_track.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController3";
            };
            class train_brake
            {
                sound[] = {"\ats\core\sounds\train_brake1.ogg", 0, 1, 800};
                frequency = "1";
                volume = "CustomSoundController4";
            };
        };
	};
	
	class ATS_Trains_Steam_Large : ATS_Trains_Base
	{
		scope = public;
		model = "\ats\trains\steam\models\ats_trains_steam_large.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_Steam_Large.jpg";
		displayName = "Steam Locomotive (Large)";
		author 	= "Profi Developers, imported by badbenson";

		class Sounds
        {
            class train_engine_idle
            {
                sound[] = {"\ats\core\sounds\train_steam_engine_idle.ogg", 2, 1, 600};
                frequency = "1";
                volume = "CustomSoundController1";
            };
            class train_engine
            {
                sound[] = {"\ats\core\sounds\train_steam_engine.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController2";
            };
            class train_track
            {
                sound[] = {"\ats\core\sounds\train_track.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController3";
            };
            class train_brake
            {
                sound[] = {"\ats\core\sounds\train_brake1.ogg", 0, 1, 800};
                frequency = "1";
                volume = "CustomSoundController4";
            };
        };
	};
	
};