#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_Cable
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
	class ATS_Trains_Cable_Car : ATS_Trains_Base {
		scope = public;
		editorPreview = "\ats\trains\screenshots\ATS_Trains_Cable_Car.jpg";
		displayName = "Cable Car";
		model = "\ats\trains\cable\ats_trains_cable_car.p3d";
		author 	= "Turgut G, imported by hcpookie";
		
		class AnimationSources {
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			class HitGlass2 : HitGlass1  { hitpoint = "HitGlass2"; };
			class HitGlass3 : HitGlass1  { hitpoint = "HitGlass3"; };
			class HitGlass4 : HitGlass1  { hitpoint = "HitGlass4"; };
			class HitGlass5 : HitGlass1  { hitpoint = "HitGlass5"; };
			class HitGlass6 : HitGlass1  { hitpoint = "HitGlass6"; };
			class HitGlass7 : HitGlass1  { hitpoint = "HitGlass7"; };
			class HitGlass8 : HitGlass1  { hitpoint = "HitGlass8"; };
			class HitGlass9 : HitGlass1  { hitpoint = "HitGlass9"; };
			class HitGlass10 : HitGlass1 { hitpoint = "HitGlass10"; };
			class HitGlass11 : HitGlass1 { hitpoint = "HitGlass11"; };
			class HitGlass12 : HitGlass1 { hitpoint = "HitGlass12"; };
			
			class door_1_source
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1;
				//sound = "GlassServoDoorsSound";
				//soundPosition = "Door_2_trigger";
			};
			class door_2_source
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1;
				//sound = "GlassServoDoorsSound";
				//soundPosition = "Door_2_trigger";
			};
		};
		
		class HitPoints
		{
			class HitGlass1
			{
				armor = 0.5;
				material = -1;
				name = "glass1";
				visual = "glass1";
				passThrough = 0;
				explosionShielding = 2;
			};
			class HitGlass2 : HitGlass1  { name = "glass2";  visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3";  visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4";  visual = "glass4"; };
			class HitGlass5 : HitGlass1  { name = "glass5";  visual = "glass5"; };
			class HitGlass6 : HitGlass1  { name = "glass6";  visual = "glass6"; };
			class HitGlass7 : HitGlass1  { name = "glass7";  visual = "glass7"; };
			class HitGlass8 : HitGlass1  { name = "glass8";  visual = "glass8"; };
			class HitGlass9 : HitGlass1  { name = "glass9";  visual = "glass9"; };
			class HitGlass10 : HitGlass1 { name = "glass10"; visual = "glass10"; };
			class HitGlass11 : HitGlass1 { name = "glass11"; visual = "glass11"; };
			class HitGlass12 : HitGlass1 { name = "glass12"; visual = "glass12"; };
		};
		
		class UserActions
		{
			class OpenDoor_1
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = door_1_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationSourcePhase 'door_1_source') < 0.5 && ((this getVariable ['bis_disabled_Door_1',0]) != 1)); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_1_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_1: OpenDoor_1
			{
				displayName = "Close Door";
				position = door_1_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.2;
				condition = ((this animationSourcePhase 'door_1_source') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_1_source",0]);
			};
			class OpenDoor_2
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = door_2_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationSourcePhase 'door_2_source') < 0.5 && ((this getVariable ['bis_disabled_Door_2',0]) != 1)); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_2_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_2: CloseDoor_1
			{
				displayName = "Close Door";
				position = door_2_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.2;
				condition = ((this animationSourcePhase 'door_2_source') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_2_source",0]);
			};
		};
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\data\default_super.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"A3\data_f\glass_veh.rvmat",			// material mapped in model
				"A3\data_f\Glass_veh_damage.rvmat",		// changes to this one once damage of the part reaches 0.5
				"A3\data_f\Glass_veh_damage.rvmat"		// changes to this one once damage of the part reaches 1
			};
		};
	};
};