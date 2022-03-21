#define private 0
#define protected 1
#define public 2


class CfgPatches
{
	class ATS_Trains_AE
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
	class ATS_Trains_AE_Engine: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\AE\ats_trains_ae_engine.p3d";
		displayName = "High Speed Engine"; 
		author 	= "Arunas B., imported by IN005";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_AE_Engine.jpg";
		
		class AnimationSources : AnimationSources {
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			class HitGlass2 : HitGlass1  { hitpoint = "HitGlass2"; };
			class HitGlass3 : HitGlass1  { hitpoint = "HitGlass3"; };
			class HitGlass4 : HitGlass1  { hitpoint = "HitGlass4"; };
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
		
		class Reflectors	
		{
			// only front lights are considered to be reflectors to save CPU
			class LightCarHeadL01 	// lights on each side consist of two bulbs with different flares
			{
				color[] 		= {1900, 1800, 1700};		// approximate colour of standard lights
				ambient[]		= {5, 5, 5};				// nearly a white one
				position 		= "LightCarHeadL01";		// memory point for start of the light and flare
				direction 		= "LightCarHeadL01_end";	// memory point for the light direction
				hitpoint 		= "Light_L_1";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_L_1";				// selection for artificial glow around the bulb, not much used any more
				size 			= 1;						// size of the light point seen from distance
				innerAngle 		= 100;						// angle of full light
				outerAngle 		= 179;						// angle of some light
				coneFadeCoef 	= 10;						// attenuation of light between the above angles
				intensity 		= 1;						// strength of the light
				useFlare 		= true;						// does the light use flare?
				dayLight 		= false;					// switching light off during day saves CPU a lot
				flareSize 		= 1.0;						// how big is the flare

				class Attenuation
				{
					start 			= 1.0;
					constant 		= 0; 
					linear 			= 0; 
					quadratic 		= 0.25; 
					hardLimitStart 	= 30;		// it is good to have some limit otherwise the light would shine to infinite distance
					hardLimitEnd 	= 60;		// this allows adding more lights into scene
				};
			};
			class LightCarHeadL02: LightCarHeadL01 
			{
				position 		= "LightCarHeadL02";		// memory point for start of the light and flare
				direction 		= "LightCarHeadL02_end";	// memory point for the light direction
				hitpoint 		= "Light_L_2";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_L_2";				// selection for artificial glow around the bulb, not much used any more
			};
			class LightCarHeadR01: LightCarHeadL01 
			{
				position 		= "LightCarHeadR01";		// memory point for start of the light and flare
				direction 		= "LightCarHeadR01_end";	// memory point for the light direction
				hitpoint 		= "Light_R_1";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_R_1";				// selection for artificial glow around the bulb, not much used any more
			};
			class LightCarHeadR02: LightCarHeadL01 
			{
				position 		= "LightCarHeadR02";		// memory point for start of the light and flare
				direction 		= "LightCarHeadR02_end";	// memory point for the light direction
				hitpoint 		= "Light_R_2";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_R_2";				// selection for artificial glow around the bulb, not much used any more
			};
		};

		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadL02","LightCarHeadR01","LightCarHeadR02"}}; // aggregating reflectors helps the engine a lot
		// it might be even good to aggregate all lights into one source as it is done for most of the cars
		
	};
	
	class ATS_Trains_AE_Wagon: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\AE\ats_trains_ae_wagon.p3d";
		displayName = "High Speed Wagon"; 
		author 	= "Arunas B., imported by IN005";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_AE_Wagon.jpg";
		
		class AnimationSources : AnimationSources {
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
			class door_3_source
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1;
				//sound = "GlassServoDoorsSound";
				//soundPosition = "Door_2_trigger";
			};
			class door_4_source
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1;
				//sound = "GlassServoDoorsSound";
				//soundPosition = "Door_2_trigger";
			};
			class door_5_source
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1;
				//sound = "GlassServoDoorsSound";
				//soundPosition = "Door_2_trigger";
			};
			class door_6_source
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1;
				//sound = "GlassServoDoorsSound";
				//soundPosition = "Door_2_trigger";
			};
			
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
			class HitGlass13 : HitGlass1 { hitpoint = "HitGlass13"; };
			class HitGlass14 : HitGlass1 { hitpoint = "HitGlass14"; };
			class HitGlass15 : HitGlass1 { hitpoint = "HitGlass15"; };
			class HitGlass16 : HitGlass1 { hitpoint = "HitGlass16"; };
			class HitGlass17 : HitGlass1 { hitpoint = "HitGlass17"; };
			class HitGlass18 : HitGlass1 { hitpoint = "HitGlass18"; };
			class HitGlass19 : HitGlass1 { hitpoint = "HitGlass19"; };
			class HitGlass20 : HitGlass1 { hitpoint = "HitGlass20"; };
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
			class HitGlass13 : HitGlass1 { name = "glass13"; visual = "glass13"; };
			class HitGlass14 : HitGlass1 { name = "glass14"; visual = "glass14"; };
			class HitGlass15 : HitGlass1 { name = "glass15"; visual = "glass15"; };
			class HitGlass16 : HitGlass1 { name = "glass16"; visual = "glass16"; };
			class HitGlass17 : HitGlass1 { name = "glass17"; visual = "glass17"; };
			class HitGlass18 : HitGlass1 { name = "glass18"; visual = "glass18"; };
			class HitGlass19 : HitGlass1 { name = "glass19"; visual = "glass19"; };
			class HitGlass20 : HitGlass1 { name = "glass20"; visual = "glass20"; };
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
			class OpenDoor_3
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = door_3_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationSourcePhase 'door_3_source') < 0.5 && ((this getVariable ['bis_disabled_Door_3',0]) != 1)); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_3_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_3: CloseDoor_1
			{
				displayName = "Close Door";
				position = door_3_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.2;
				condition = ((this animationSourcePhase 'door_3_source') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_3_source",0]);
			};
			class OpenDoor_4
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = door_4_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationSourcePhase 'door_4_source') < 0.5 && ((this getVariable ['bis_disabled_Door_4',0]) != 1)); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_4_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_4: CloseDoor_1
			{
				displayName = "Close Door";
				position = door_4_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.2;
				condition = ((this animationSourcePhase 'door_4_source') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_4_source",0]);
			};
			class OpenDoor_5
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = door_5_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationSourcePhase 'door_5_source') < 0.5 && ((this getVariable ['bis_disabled_Door_5',0]) != 1)); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_5_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_5: CloseDoor_1
			{
				displayName = "Close Door";
				position = door_5_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.2;
				condition = ((this animationSourcePhase 'door_5_source') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_5_source",0]);
			};
			class OpenDoor_6
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = door_6_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationSourcePhase 'door_6_source') < 0.5 && ((this getVariable ['bis_disabled_Door_6',0]) != 1)); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_6_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_6: CloseDoor_1
			{
				displayName = "Close Door";
				position = door_6_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.2;
				condition = ((this animationSourcePhase 'door_6_source') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_6_source",0]);
			};
		};
		
	};
};

class CfgNonAIVehicles
{
	class ProxyRetex;
	
	class Proxyats_trains_ae_engine_wreck: ProxyRetex
	{
		hiddenSelections[] = {"damage"};
		model = "ats\trains\AE\ats_trains_ae_engine_wreck.p3d";
	};
	
	class Proxyats_trains_ae_wagon_wreck: ProxyRetex
	{
		hiddenSelections[] = {"damage"};
		model = "ats\trains\AE\ats_trains_ae_wagon_wreck.p3d";
	};
	
}; 

