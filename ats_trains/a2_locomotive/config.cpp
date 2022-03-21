#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_A2Locomotive
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ATS_Trains"};
	};
};

class CfgVehicles {
	
	class ATS_Trains_Base {
		class AnimationSources;
	};	
	class ATS_Trains_A2Locomotive_Base: ATS_Trains_Base
	{
		scope = private;
		mapSize = 0.7;
		accuracy = 0.5;
		icon = "iconObject_2x5";
		displayName = "A2 Locomotive";
		_generalMacro = "ATS_Trains_A2Locomotive_Base";
		model = "ats\trains\a2_locomotive\a2_loco_nomi2.p3d";
		hiddenSelections[] = {"Camo1"};

		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			class HitGlass2: HitGlass1
			{
				hitpoint = "HitGlass2";
			};
			class HitGlass3: HitGlass1
			{
				hitpoint = "HitGlass3";
			};
			class HitGlass4: HitGlass1
			{
				hitpoint = "HitGlass4";
			};
			class HitGlass5: HitGlass1
			{
				hitpoint = "HitGlass5";
			};
			class HitGlass6: HitGlass1
			{
				hitpoint = "HitGlass6";
			};


			class Hit_Light_L: HitGlass1
			{
				hitpoint = "Light_L";
			};
			class Hit_Light_R: HitGlass1
			{
				hitpoint = "Light_R";
			};
			class Hit_Light_M: HitGlass1
			{
				hitpoint = "Light_M";
			};
			class Hit_Light_Back_L: HitGlass1
			{
				hitpoint = "Light_Back_L";
			};
			class Hit_Light_Back_R: HitGlass1
			{
				hitpoint = "Light_Back_R";
			};
			class Hit_Light_Back_M: HitGlass1
			{
				hitpoint = "Light_Back_M";
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
				passThrough = 1;
				explosionShielding = 2;
			};
			class HitGlass2
			{
				armor = 0.5;
				material = -1;
				name = "glass2";
				visual = "glass2";
				passThrough = 1;
				explosionShielding = 2;
			};
			class HitGlass3
			{
				armor = 0.5;
				material = -1;
				name = "glass3";
				visual = "glass3";
				passThrough = 1;
				explosionShielding = 2;
			};
			class HitGlass4
			{
				armor = 0.5;
				material = -1;
				name = "glass4";
				visual = "glass4";
				passThrough = 1;
				explosionShielding = 2;
			};
			class HitGlass5
			{
				armor = 0.5;
				material = -1;
				name = "glass5";
				visual = "glass5";
				passThrough = 1;
				explosionShielding = 2;
			};
			class HitGlass6
			{
				armor = 0.5;
				material = -1;
				name = "glass6";
				visual = "glass6";
				passThrough = 1;
				explosionShielding = 2;
			};
			class Light_L 
			{
				armor = 0.5;
				material = -1;
				name = "light_l";
				visual = "light_l";
				passThrough = 1;
				convexComponent = "light_l";
			};
			class Light_R 
			{
				armor = 0.5;
				material = -1;
				name = "light_r";
				visual = "light_r";
				passThrough = 1;
				convexComponent = "light_r";
			};
			class Light_L_red 
			{
				armor = 0.5;
				material = -1;
				name = "light_l_red";
				visual = "light_l_red";
				passThrough = 1;
				convexComponent = "light_l_red";
			};
			class Light_R_red 
			{
				armor = 0.5;
				material = -1;
				name = "light_r_red";
				visual = "light_r_red";
				passThrough = 1;
				convexComponent = "light_r_red";
			};
			class Light_M 
			{
				armor = 0.5;
				material = -1;
				name = "light_m";
				visual = "light_m";
				passThrough = 1;
				convexComponent = "light_m";
			};
			class Light_Back_L 
			{
				armor = 0.5;
				material = -1;
				name = "light_back_l";
				visual = "light_back_l";
				passThrough = 1;
				convexComponent = "light_back_l";
			};
			class Light_Back_R 
			{
				armor = 0.5;
				material = -1;
				name = "light_back_r";
				visual = "light_back_r";
				passThrough = 1;
				convexComponent = "light_back_r";
			};
			class Light_Back_L_red
			{
				armor = 0.5;
				material = -1;
				name = "light_back_l_red";
				visual = "light_back_l_red";
				passThrough = 1;
				convexComponent = "light_back_l_red";
			};
			class Light_Back_R_red 
			{
				armor = 0.5;
				material = -1;
				name = "light_back_r_red";
				visual = "light_back_r_red";
				passThrough = 1;
				convexComponent = "light_back_r_red";
			};
			class Light_Back_M 
			{
				armor = 0.5;
				material = -1;
				name = "light_back_m";
				visual = "light_back_m";
				passThrough = 1;
				convexComponent = "light_back_m";
			};
		};

		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\a2_locomotive\data\1.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"A3\data_f\glass_veh.rvmat",			// material mapped in model
				"A3\data_f\Glass_veh_damage.rvmat",		// changes to this one once damage of the part reaches 0.5
				"A3\data_f\Glass_veh_damage.rvmat"		// changes to this one once damage of the part reaches 1
			};
		};
		
		class TextureSources
		{
			class Blue
			{
				displayName = "Blue";
				author = "$STR_A3_Bohemia_Interactive & Eagledude4";
				textures[] = {"ats\trains\a2_locomotive\data\1_co.paa"};
				factions[] = {"CIV_F"};
			};
			class Red
			{
				displayName = "Red";
				author = "$STR_A3_Bohemia_Interactive & Eagledude4";
				textures[] = {"ats\trains\a2_locomotive\data\1r_co.paa"};
				factions[] = {"CIV_F"};
			};
		};
		
		animationList[] = {};
		textureList[] = {"Blue",1,"Red",1};

		class Reflectors	
		{
			// only front lights are considered to be reflectors to save CPU
			class LightCarHeadL01 	// lights on each side consist of two bulbs with different flares
			{
				color[] 		= {1900, 1800, 1700};		// approximate colour of standard lights
				ambient[]		= {5, 5, 5};				// nearly a white one
				position 		= "LightCarHeadL01";		// memory point for start of the light and flare
				direction 		= "LightCarHeadL01_end";	// memory point for the light direction
				hitpoint 		= "Light_L";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_L";				// selection for artificial glow around the bulb, not much used any more
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
			class LightCarHeadR01: LightCarHeadL01 
			{
				position 		= "LightCarHeadR01";		// memory point for start of the light and flare
				direction 		= "LightCarHeadR01_end";	// memory point for the light direction
				hitpoint 		= "Light_R";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_R";				// selection for artificial glow around the bulb, not much used any more
			};

			class LightCarBackL01: LightCarHeadL01 
			{
				position 		= "LightCarBackL01";		// memory point for start of the light and flare
				direction 		= "LightCarBackL01_end";	// memory point for the light direction
				hitpoint 		= "Light_Back_L";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_Back_L";				// selection for artificial glow around the bulb, not much used any more
			};

			class LightCarBackR01: LightCarBackL01 
			{
				position 		= "LightCarBackR01";		// memory point for start of the light and flare
				direction 		= "LightCarBackR01_end";	// memory point for the light direction
				hitpoint 		= "Light_Back_R";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_Back_R";				// selection for artificial glow around the bulb, not much used any more
			};

			class LightCarHeadL02_red: LightCarBackL01 
			{
				position 		= "LightCarHeadL02_red";		// memory point for start of the light and flare
				direction 		= "LightCarHeadL02_red_end";	// memory point for the light direction
				hitpoint 		= "Light_L_red";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_L_red";				// selection for artificial glow around the bulb, not much used any more

				color[] 		= {1900, 100, 100};		// approximate colour of standard lights
				ambient[]		= {5, 0, 0};				// pure red
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
					hardLimitStart 	= 10;		// it is good to have some limit otherwise the light would shine to infinite distance
					hardLimitEnd 	= 30;		// this allows adding more lights into scene
				};
			};

			class LightCarHeadR02_red: LightCarHeadL02_red 
			{
				position 		= "LightCarHeadR02_red";		// memory point for start of the light and flare
				direction 		= "LightCarHeadR02_red_end";	// memory point for the light direction
				hitpoint 		= "Light_R_red";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_R_red";				// selection for artificial glow around the bulb, not much used any more
			};

			class LightCarBackR02_red: LightCarHeadL02_red 
			{
				position 		= "LightCarBackR02_red";		// memory point for start of the light and flare
				direction 		= "LightCarBackR02_red_end";	// memory point for the light direction
				hitpoint 		= "Light_Back_R_red";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_Back_R_red";				// selection for artificial glow around the bulb, not much used any more
			};

			class LightCarBackL02_red: LightCarBackR02_red 
			{
				position 		= "LightCarBackL02_red";		// memory point for start of the light and flare
				direction 		= "LightCarBackL02_red_end";	// memory point for the light direction
				hitpoint 		= "Light_Back_L_red";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_Back_L_red";				// selection for artificial glow around the bulb, not much used any more
			};
			
			class LightCarHeadM01: LightCarHeadL01 
			{
				position 		= "LightCarHeadM01";		// memory point for start of the light and flare
				direction 		= "LightCarHeadM01_end";	// memory point for the light direction
				hitpoint 		= "Light_M";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_M";				// selection for artificial glow around the bulb, not much used any more
				size 			= 1.5;						// size of the light point seen from distance
				intensity 		= 2;						// strength of the light
				flareSize 		= 1.5;						// how big is the flare
			};

			class LightCarBackM01: LightCarBackL01 
			{
				position 		= "LightCarBackM01";		// memory point for start of the light and flare
				direction 		= "LightCarBackM01_end";	// memory point for the light direction
				hitpoint 		= "Light_Back_M";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "Light_Back_M";				// selection for artificial glow around the bulb, not much used any more
				size 			= 1.5;						// size of the light point seen from distance
				intensity 		= 2;						// strength of the light
				flareSize 		= 1.5;						// how big is the flare
			};

			class LightInt: LightCarHeadL01 
			{
				position 		= "LightInt";		// memory point for start of the light and flare
				direction 		= "LightInt_end";	// memory point for the light direction
				hitpoint 		= "";				// point(s) in hitpoint lod for the light (hitPoints are created by engine)
				selection 		= "LightInt";				// selection for artificial glow around the bulb, not much used any more
				useFlare 		= false;						// does the light use flare?
				dayLight 		= true;					// switching light off during day saves CPU a lot
				size 			= 0.5;						// size of the light point seen from distance
				intensity 		= 0.5;						// strength of the light
				flareSize 		= 0.2;						// how big is the flare
				
				class Attenuation
				{
					start 			= 1.0;
					constant 		= 0; 
					linear 			= 0; 
					quadratic 		= 0.25; 
					hardLimitStart 	= 1;		// it is good to have some limit otherwise the light would shine to infinite distance
					hardLimitEnd 	= 1;		// this allows adding more lights into scene
				};
			};
		};

		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01","LightCarHeadM01", "LightCarBackR02_red", "LightCarBackL02_red"}, {"LightCarBackL01","LightCarBackR01","LightCarBackM01","LightCarHeadL02_red", "LightCarHeadR02_red"}, {"LightInt"}}; // aggregating reflectors helps the engine a lot
		// it might be even good to aggregate all lights into one source as it is done for most of the cars
	};

	class ATS_Trains_A2Locomotive_Blue: ATS_Trains_A2Locomotive_Base
	{
		scope = public;
		displayName = "A2 Locomotive (Blue)";
		_generalMacro = "ATS_Trains_A2Locomotive_Blue";
		textureList[] = {"Blue",1};
		editorPreview = "\ats\trains\screenshots\ATS_Trains_A2Locomotive_Blue.jpg";
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
	};
	class ATS_Trains_A2Locomotive_Red: ATS_Trains_A2Locomotive_Base
	{
		scope = public;
		displayName = "A2 Locomotive (Red)";
		_generalMacro = "ATS_Trains_A2Locomotive_Red";
		textureList[] = {"Red",1};
		editorPreview = "\ats\trains\screenshots\ATS_Trains_A2Locomotive_Red.jpg";
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
	};
	
};

class CfgNonAIVehicles
{
	class ProxyRetex;
	class Proxya2_locomotive_wreck: ProxyRetex
	{
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"ats\trains\a2_locomotive\data\1r_co.paa"};
		model = "\ats\trains\a2_locomotive\a2_locomotive_wreck.p3d";
	};
}; 
