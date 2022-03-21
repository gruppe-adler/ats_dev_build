#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_Metro
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
	class ATS_Trains_Metro_Car_LA: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\metro\metro.p3d";
		displayName = "LA Metro Car"; 
		author 	= "pr0l4m3";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_Metro_Car_LA.jpg";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"ats\trains\metro\textures\metro_train_decals_512.paa"};
		
		class AnimationSources : AnimationSources
		{
			class Door_1_source
			{
				source = user; // "user" = custom source = not controlled by some engine value
				initPhase = 0; // Initial value of animations based on this source
				animPeriod = 1; // Coefficient for duration of change of this animation
				sound = "GenericDoorsSound"; /// Selects sound class from CfgAnimationSourceSounds that is going to be used for sounds of doors
			};
			class Door_2_source
			{
				source = user; // "user" = custom source = not controlled by some engine value
				initPhase = 0; // Initial value of animations based on this source
				animPeriod = 1; // Coefficient for duration of change of this animation
				sound = "GenericDoorsSound"; /// Selects sound class from CfgAnimationSourceSounds that is going to be used for sounds of doors
			};
		};
		class Reflectors	
		{
			class LightCarHeadL01 	/// lights on each side consist of two bulbs with different flares
			{
				color[] 		= {1900, 1800, 1700};		/// approximate colour of standard lights
				ambient[]		= {5, 5, 5};				/// nearly a white one
				position 		= "light1_pos";		/// memory point for start of the light and flare
				direction 		= "light1_dir";	/// memory point for the light direction
				hitpoint 		= "light1_pos";				/// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "light1_pos";				/// selection for artificial glow around the bulb, not much used any more
				size 			= 1;						/// size of the light point seen from distance
				innerAngle 		= 100;						/// angle of full light
				outerAngle 		= 179;						/// angle of some light
				coneFadeCoef 	= 10;						/// attenuation of light between the above angles
				intensity 		= 0.2;						/// strength of the light
				useFlare 		= true;						/// does the light use flare?
				dayLight 		= false;					/// switching light off during day saves CPU a lot
				flareSize 		= 1.0;						/// how big is the flare

				class Attenuation
				{
					start 			= 1.0;
					constant 		= 0;
					linear 			= 0;
					quadratic 		= 0.25;
					hardLimitStart 	= 30;		/// it is good to have some limit otherwise the light would shine to infinite distance
					hardLimitEnd 	= 60;		/// this allows adding more lights into scene
				};
			};

			class LightCarHeadL02: LightCarHeadL01
			{
				position 	= "light2_pos";
				direction 	= "light2_dir";
				hitpoint 	= "light2_pos";				/// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 	= "light2_pos";				/// selection for artificial glow around the bulb, not much used any more
			};
			class LightCarHeadL03: LightCarHeadL01
			{
				position 	= "light3_pos";
				direction 	= "light3_dir";
				hitpoint 	= "light3_pos";				/// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 	= "light3_pos";				/// selection for artificial glow around the bulb, not much used any more
			};
			class LightCarHeadL04: LightCarHeadL01
			{
				position 	= "light4_pos";
				direction 	= "light4_dir";
				hitpoint 	= "light4_pos";				/// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 	= "light4_pos";				/// selection for artificial glow around the bulb, not much used any more
			};
			class LightCarHeadL05 	// lights on each side consist of two bulbs with different flares
			{
				color[] 		= {1900, 1800, 1700};		// approximate colour of standard lights
				ambient[]		= {5, 5, 5};				// nearly a white one
				position 		= "headlight1_pos";		// memory point for start of the light and flare
				direction 		= "headlight1_dir";	// memory point for the light direction
				hitpoint 		= "headlight1_pos";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "headlight1_pos";				// selection for artificial glow around the bulb, not much used any more
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
			class LightCarHeadL06: LightCarHeadL05 
			{
				position 		= "headlight2_pos";		// memory point for start of the light and flare
				direction 		= "headlight2_dir";	// memory point for the light direction
				hitpoint 		= "headlight2_pos";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "headlight2_pos";				// selection for artificial glow around the bulb, not much used any more
			};
		};

		aggregateReflectors[] = {
									{"LightCarHeadL01", "LightCarHeadL02", "LightCarHeadL03", "LightCarHeadL04"},
									{"LightCarHeadL05", "LightCarHeadL06"}
		};
		class UserActions
		{
			class OpenDoor_1
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = Door_1_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 3; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationPhase 'Door_1_rot') < 0.5); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_1_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_1: OpenDoor_1
			{
				displayName = "Close Door";
				priority = 0.2;
				condition = ((this animationPhase 'Door_1_rot') >= 0.5); // Checks if the door is currently open and not destroyed.
				statement = (this animateSource ["door_1_source",0]);
			};
			class OpenDoor_2
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Door"; // Label of the action used in the action menu itself.
				position = Door_2_trigger; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 3; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = ((this animationPhase 'Door_2_rot') < 0.5); // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = (this animateSource ["door_2_source",1]); // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_2: OpenDoor_2
			{
				displayName = "Close Door";
				priority = 0.2;
				condition = ((this animationPhase 'Door_2_rot') >= 0.5); // Checks if the door is currently open and not destroyed.
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
				
				"ats\trains\metro\textures\chrome.rvmat", // material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"ats\trains\metro\textures\metallic.rvmat", // material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"A3\data_f\glass_veh.rvmat",			// material mapped in model
				"A3\data_f\Glass_veh_damage.rvmat",		// changes to this one once damage of the part reaches 0.5
				"A3\data_f\Glass_veh_damage.rvmat"		// changes to this one once damage of the part reaches 1
			};
		};
	};
};
