#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_VL
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ATS_Trains","ATS_Objects"};
	};
};

class CfgVehicles {
	
	class ATS_Objects_Base;
	
	class ATS_Trains_VL_Wire_1 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\st1.p3d";
		displayName = "Overhead Wires 1";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Wire_1.jpg";
    };
	
	class ATS_Trains_VL_Wire_2 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\st2.p3d";
		displayName = "Overhead Wires 2";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Wire_2.jpg";
    };
	
	class ATS_Trains_VL_Wire_3 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\st3.p3d";
		displayName = "Overhead Wires 3";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Wire_3.jpg";
    };
	
	class ATS_Trains_VL_Platform_1 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\plat1.p3d";
		displayName = "Platform 1";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Platform_1.jpg";
    };

	class ATS_Trains_VL_Platform_2 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\plat2.p3d";
		displayName = "Platform 2";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Platform_2.jpg";
    };

	class ATS_Trains_VL_Platform_3 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\plat3.p3d";
		displayName = "Platform 3";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Platform_3.jpg";
    };

	class ATS_Trains_VL_Platform_4 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\plat4.p3d";
		displayName = "Platform 4";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Platform_4.jpg";
    };

	class ATS_Trains_VL_Platform_5 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\plat5.p3d";
		displayName = "Platform 5";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Platform_5.jpg";
    };

	class ATS_Trains_VL_Platform_6 : ATS_Objects_Base
	{
        scope = public;
        model = "ats\trains\vl\plat6.p3d";
		displayName = "Platform 6";
		destrType = "DestructNo";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Platform_6.jpg";
    };
	
	class Items_base_F;
	class ATS_Trains_Base : Items_base_F {
		class AnimationSources;
	};
		
	class ATS_Trains_VL_M62: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\m62.p3d";
		displayName = "VL M62"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_M62.jpg";
		
		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
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
			class HitGlass2 : HitGlass1  { name = "glass2"; visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3"; visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4"; visual = "glass4"; };
		};
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\2m62_body.rvmat", 			// material mapped in model
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
		};

		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01","LightCarHeadM01"}}; // aggregating reflectors helps the engine a lot
		// it might be even good to aggregate all lights into one source as it is done for most of the cars
	};
	class ATS_Trains_VL_VL10: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\vl10.p3d";
		displayName = "VL VL10"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_VL10.jpg";
		
		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
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
			class HitGlass2 : HitGlass1  { name = "glass2"; visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3"; visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4"; visual = "glass4"; };
			class HitGlass5 : HitGlass1  { name = "glass5"; visual = "glass5"; };
			class HitGlass6 : HitGlass1  { name = "glass6"; visual = "glass6"; };
		};
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\vl11_body.rvmat", 			// material mapped in model
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
		};

		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01","LightCarHeadM01"}}; // aggregating reflectors helps the engine a lot
		// it might be even good to aggregate all lights into one source as it is done for most of the cars
	};
	class ATS_Trains_VL_TVZ: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\tvz.p3d";
		displayName = "VL TVZ"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_TVZ.jpg";
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\carriage_body.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat"	// changes to this one once damage of the part reaches 1
			};
		};
	};
	class ATS_Trains_VL_CH4: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\ch4.p3d";
		displayName = "VL CH4"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_CH4.jpg";
		
		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
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
			class HitGlass2 : HitGlass1  { name = "glass2"; visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3"; visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4"; visual = "glass4"; };
			class HitGlass5 : HitGlass1  { name = "glass5"; visual = "glass5"; };
			class HitGlass6 : HitGlass1  { name = "glass6"; visual = "glass6"; };
			class HitGlass7 : HitGlass1  { name = "glass7"; visual = "glass7"; };
			class HitGlass8 : HitGlass1  { name = "glass8"; visual = "glass8"; };
			class HitGlass9 : HitGlass1  { name = "glass9"; visual = "glass9"; };
			class HitGlass10 : HitGlass1  { name = "glass10"; visual = "glass10"; };
			class HitGlass11 : HitGlass1  { name = "glass11"; visual = "glass11"; };
			class HitGlass12 : HitGlass1  { name = "glass12"; visual = "glass12"; };
		};
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\transnorm1.rvmat", 			// material mapped in model
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
		};

		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01","LightCarHeadM01"}}; // aggregating reflectors helps the engine a lot
		// it might be even good to aggregate all lights into one source as it is done for most of the cars
	};
	class ATS_Trains_VL_CI: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\ci.p3d";
		displayName = "VL CI"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_CI.jpg";
		
		class AnimationSources: AnimationSources {
			class HitHull
			{
				source = "Hit";
				hitpoint = "HitHull";
				raw = 1;
			};
			class HitBody
			{
				source = "Hit";
				hitpoint = "HitBody";
				raw = 1;
			};
		};
		
		class HitPoints
		{
			class HitHull
			{
				armor = 0.1;
				material = -1;
				name = "hull";
				visual = "hull";
				passThrough = 0;
				explosionShielding = 0;
			};
			class HitBody
			{
				armor = 0.2;
				material = -1;
				name = "damage";
				visual = "damage";
				passThrough = 0;
				explosionShielding = 1;
			};
		};
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\veh_cisternabok.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"ats\trains\vl\data\veh_cisternafront.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat"	// changes to this one once damage of the part reaches 1
			};
		};
	};
	class ATS_Trains_VL_Elgolova: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\elgolova.p3d";
		displayName = "VL Electric Engine"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_Elgolova.jpg";
		
		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
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
			class HitGlass21 : HitGlass1 { hitpoint = "HitGlass21"; };
			class HitGlass22 : HitGlass1 { hitpoint = "HitGlass22"; };
			class HitGlass23 : HitGlass1 { hitpoint = "HitGlass23"; };
			class HitGlass24 : HitGlass1 { hitpoint = "HitGlass24"; };
			class HitGlass25 : HitGlass1 { hitpoint = "HitGlass25"; };
			class HitGlass26 : HitGlass1 { hitpoint = "HitGlass26"; };
			class HitGlass27 : HitGlass1 { hitpoint = "HitGlass27"; };
			class HitGlass28 : HitGlass1 { hitpoint = "HitGlass28"; };
			class HitGlass29 : HitGlass1 { hitpoint = "HitGlass29"; };
			class HitGlass30 : HitGlass1 { hitpoint = "HitGlass30"; };
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
			class HitGlass2 : HitGlass1  { name = "glass2"; visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3"; visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4"; visual = "glass4"; };
			class HitGlass5 : HitGlass1  { name = "glass5"; visual = "glass5"; };
			class HitGlass6 : HitGlass1  { name = "glass6"; visual = "glass6"; };
			class HitGlass7 : HitGlass1  { name = "glass7"; visual = "glass7"; };
			class HitGlass8 : HitGlass1  { name = "glass8"; visual = "glass8"; };
			class HitGlass9 : HitGlass1  { name = "glass9"; visual = "glass9"; };
			class HitGlass10 : HitGlass1  { name = "glass10"; visual = "glass10"; };
			class HitGlass11 : HitGlass1  { name = "glass11"; visual = "glass11"; };
			class HitGlass12 : HitGlass1  { name = "glass12"; visual = "glass12"; };
			class HitGlass13 : HitGlass1  { name = "glass13"; visual = "glass13"; };
			class HitGlass14 : HitGlass1  { name = "glass14"; visual = "glass14"; };
			class HitGlass15 : HitGlass1  { name = "glass15"; visual = "glass15"; };
			class HitGlass16 : HitGlass1  { name = "glass16"; visual = "glass16"; };
			class HitGlass17 : HitGlass1  { name = "glass17"; visual = "glass17"; };
			class HitGlass18 : HitGlass1  { name = "glass18"; visual = "glass18"; };
			class HitGlass19 : HitGlass1  { name = "glass19"; visual = "glass19"; };
			class HitGlass20 : HitGlass1  { name = "glass20"; visual = "glass20"; };
			class HitGlass21 : HitGlass1  { name = "glass21"; visual = "glass21"; };
			class HitGlass22 : HitGlass1  { name = "glass22"; visual = "glass22"; };
			class HitGlass23 : HitGlass1  { name = "glass23"; visual = "glass23"; };
			class HitGlass24 : HitGlass1  { name = "glass24"; visual = "glass24"; };
			class HitGlass25 : HitGlass1  { name = "glass25"; visual = "glass25"; };
			class HitGlass26 : HitGlass1  { name = "glass26"; visual = "glass26"; };
			class HitGlass27 : HitGlass1  { name = "glass27"; visual = "glass27"; };
			class HitGlass28 : HitGlass1  { name = "glass28"; visual = "glass28"; };
			class HitGlass29 : HitGlass1  { name = "glass29"; visual = "glass29"; };
			class HitGlass30 : HitGlass1  { name = "glass30"; visual = "glass30"; };
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
			
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\ed4m.rvmat", 			// material mapped in model
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
		};

		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01","LightCarHeadM01"}}; // aggregating reflectors helps the engine a lot
		// it might be even good to aggregate all lights into one source as it is done for most of the cars
	};
	class ATS_Trains_VL_EW: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\elvag2.p3d";
		displayName = "VL Electric Wagon"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_EW.jpg";
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\ed4m_motor.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"A3\data_f\glass_veh.rvmat",			// material mapped in model
				"A3\data_f\Glass_veh_damage.rvmat",		// changes to this one once damage of the part reaches 0.5
				"A3\data_f\Glass_veh_damage.rvmat"		// changes to this one once damage of the part reaches 1
			};
		};
		
		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
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
			class HitGlass21 : HitGlass1 { hitpoint = "HitGlass21"; };
			class HitGlass22 : HitGlass1 { hitpoint = "HitGlass22"; };
			class HitGlass23 : HitGlass1 { hitpoint = "HitGlass23"; };
			class HitGlass24 : HitGlass1 { hitpoint = "HitGlass24"; };
			class HitGlass25 : HitGlass1 { hitpoint = "HitGlass25"; };
			class HitGlass26 : HitGlass1 { hitpoint = "HitGlass26"; };
			class HitGlass27 : HitGlass1 { hitpoint = "HitGlass27"; };
			class HitGlass28 : HitGlass1 { hitpoint = "HitGlass28"; };
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
			class HitGlass2 : HitGlass1  { name = "glass2"; visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3"; visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4"; visual = "glass4"; };
			class HitGlass5 : HitGlass1  { name = "glass5"; visual = "glass5"; };
			class HitGlass6 : HitGlass1  { name = "glass6"; visual = "glass6"; };
			class HitGlass7 : HitGlass1  { name = "glass7"; visual = "glass7"; };
			class HitGlass8 : HitGlass1  { name = "glass8"; visual = "glass8"; };
			class HitGlass9 : HitGlass1  { name = "glass9"; visual = "glass9"; };
			class HitGlass10 : HitGlass1  { name = "glass10"; visual = "glass10"; };
			class HitGlass11 : HitGlass1  { name = "glass11"; visual = "glass11"; };
			class HitGlass12 : HitGlass1  { name = "glass12"; visual = "glass12"; };
			class HitGlass13 : HitGlass1  { name = "glass13"; visual = "glass13"; };
			class HitGlass14 : HitGlass1  { name = "glass14"; visual = "glass14"; };
			class HitGlass15 : HitGlass1  { name = "glass15"; visual = "glass15"; };
			class HitGlass16 : HitGlass1  { name = "glass16"; visual = "glass16"; };
			class HitGlass17 : HitGlass1  { name = "glass17"; visual = "glass17"; };
			class HitGlass18 : HitGlass1  { name = "glass18"; visual = "glass18"; };
			class HitGlass19 : HitGlass1  { name = "glass19"; visual = "glass19"; };
			class HitGlass20 : HitGlass1  { name = "glass20"; visual = "glass20"; };
			class HitGlass21 : HitGlass1  { name = "glass21"; visual = "glass21"; };
			class HitGlass22 : HitGlass1  { name = "glass22"; visual = "glass22"; };
			class HitGlass23 : HitGlass1  { name = "glass23"; visual = "glass23"; };
			class HitGlass24 : HitGlass1  { name = "glass24"; visual = "glass24"; };
			class HitGlass25 : HitGlass1  { name = "glass25"; visual = "glass25"; };
			class HitGlass26 : HitGlass1  { name = "glass26"; visual = "glass26"; };
			class HitGlass27 : HitGlass1  { name = "glass27"; visual = "glass27"; };
			class HitGlass28 : HitGlass1  { name = "glass28"; visual = "glass28"; };
		};
	};
	class ATS_Trains_VL_EE: ATS_Trains_Base
	{
		scope = public;
		model = "ats\trains\vl\elvag.p3d";
		displayName = "VL Electric Wagon 2"; 
		author 	= "Citizenship, CUP";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_VL_EE.jpg";
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\vl\data\ed4m_motor.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat",	// changes to this one once damage of the part reaches 1
				
				"A3\data_f\glass_veh.rvmat",			// material mapped in model
				"A3\data_f\Glass_veh_damage.rvmat",		// changes to this one once damage of the part reaches 0.5
				"A3\data_f\Glass_veh_damage.rvmat"		// changes to this one once damage of the part reaches 1
			};
		};
		
		//model.cfg references these for their source
		class AnimationSources: AnimationSources {
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
			class HitGlass21 : HitGlass1 { hitpoint = "HitGlass21"; };
			class HitGlass22 : HitGlass1 { hitpoint = "HitGlass22"; };
			class HitGlass23 : HitGlass1 { hitpoint = "HitGlass23"; };
			class HitGlass24 : HitGlass1 { hitpoint = "HitGlass24"; };
			class HitGlass25 : HitGlass1 { hitpoint = "HitGlass25"; };
			class HitGlass26 : HitGlass1 { hitpoint = "HitGlass26"; };
			class HitGlass27 : HitGlass1 { hitpoint = "HitGlass27"; };
			class HitGlass28 : HitGlass1 { hitpoint = "HitGlass28"; };
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
			class HitGlass2 : HitGlass1  { name = "glass2"; visual = "glass2"; };
			class HitGlass3 : HitGlass1  { name = "glass3"; visual = "glass3"; };
			class HitGlass4 : HitGlass1  { name = "glass4"; visual = "glass4"; };
			class HitGlass5 : HitGlass1  { name = "glass5"; visual = "glass5"; };
			class HitGlass6 : HitGlass1  { name = "glass6"; visual = "glass6"; };
			class HitGlass7 : HitGlass1  { name = "glass7"; visual = "glass7"; };
			class HitGlass8 : HitGlass1  { name = "glass8"; visual = "glass8"; };
			class HitGlass9 : HitGlass1  { name = "glass9"; visual = "glass9"; };
			class HitGlass10 : HitGlass1  { name = "glass10"; visual = "glass10"; };
			class HitGlass11 : HitGlass1  { name = "glass11"; visual = "glass11"; };
			class HitGlass12 : HitGlass1  { name = "glass12"; visual = "glass12"; };
			class HitGlass13 : HitGlass1  { name = "glass13"; visual = "glass13"; };
			class HitGlass14 : HitGlass1  { name = "glass14"; visual = "glass14"; };
			class HitGlass15 : HitGlass1  { name = "glass15"; visual = "glass15"; };
			class HitGlass16 : HitGlass1  { name = "glass16"; visual = "glass16"; };
			class HitGlass17 : HitGlass1  { name = "glass17"; visual = "glass17"; };
			class HitGlass18 : HitGlass1  { name = "glass18"; visual = "glass18"; };
			class HitGlass19 : HitGlass1  { name = "glass19"; visual = "glass19"; };
			class HitGlass20 : HitGlass1  { name = "glass20"; visual = "glass20"; };
			class HitGlass21 : HitGlass1  { name = "glass21"; visual = "glass21"; };
			class HitGlass22 : HitGlass1  { name = "glass22"; visual = "glass22"; };
			class HitGlass23 : HitGlass1  { name = "glass23"; visual = "glass23"; };
			class HitGlass24 : HitGlass1  { name = "glass24"; visual = "glass24"; };
			class HitGlass25 : HitGlass1  { name = "glass25"; visual = "glass25"; };
			class HitGlass26 : HitGlass1  { name = "glass26"; visual = "glass26"; };
			class HitGlass27 : HitGlass1  { name = "glass27"; visual = "glass27"; };
			class HitGlass28 : HitGlass1  { name = "glass28"; visual = "glass28"; };
		};
	};
};

class CfgNonAIVehicles
{
	class ProxyRetex;
	class Proxyelgolova_wreck: ProxyRetex
	{
		hiddenSelections[] = {"damage","damage2","damage3"};
		hiddenSelectionsTextures[] = {"ats\trains\vl\data\ed4m_ca.paa","ats\trains\vl\data\ed4m_doors_ca.paa","ats\trains\vl\data\ed9m_interrior_ca.paa"};
		model = "ats\trains\vl\elgolova_wreck.p3d";
	};
	class Proxyelvag_wreck: ProxyRetex
	{
		hiddenSelections[] = {"damage","damage2","damage3"};
		hiddenSelectionsTextures[] = {"ats\trains\vl\data\ed4m_motor_ca.paa","ats\trains\vl\data\ed4m_doors_ca.paa","ats\trains\vl\data\ed9m_interrior_ca.paa"};
		model = "ats\trains\vl\elvag_wreck.p3d";
	};
	class Proxyelvag2_wreck: ProxyRetex
	{
		hiddenSelections[] = {"damage","damage2","damage3"};
		hiddenSelectionsTextures[] = {"ats\trains\vl\data\ed4m_motor_ca.paa","ats\trains\vl\data\ed4m_doors_ca.paa","ats\trains\vl\data\ed9m_interrior_ca.paa"};
		model = "ats\trains\vl\elvag2_wreck.p3d";
	};
}; 
