#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_A2Wagons
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
	class ATS_Trains_A2Wagon_Box: ATS_Trains_Base
	{
		scope = public;
		mapSize = 0.7;
		accuracy = 0.5;
		icon = "iconObject_2x5";
		displayName = "A2 Wagon (Box)";
		_generalMacro = "ATS_A2Wagon_Box";
		model = "ats\trains\a2_wagons\wagon_box.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_A2Wagon_Box.jpg";

		class AnimationSources: AnimationSources
		{
			class Door_L
			{
				source = "user";
				animPeriod = 1;
				initPhase = 0;
			};
			class Door_R
			{
				source = "user";
				animPeriod = 1;
				initPhase = 0;
			};
		};
		
		class UserActions
		{
			class OpenDoor_L
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Left Door"; // Label of the action used in the action menu itself.
				position = "door_left_begin"; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = "((this animationPhase ""Door_L"") < 2.4) && ((this getVariable [""bis_disabled_Door_1"",0]) != 1)"; // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = "this animate [""Door_"",2.4]; this enableVehicleCargo true"; // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_L
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Close Left Door"; // Label of the action used in the action menu itself.
				position = "door_left_begin"; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = "((this animationPhase ""Door_L"") > 0) && ((this getVariable [""bis_disabled_Door_1"",0]) != 1)"; // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = "this animate [""Door_L"",0]; this enableVehicleCargo false"; // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class OpenDoor_R
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Open Right Door"; // Label of the action used in the action menu itself.
				position = "door_right_begin"; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = "((this animationPhase ""Door_R"") < 2.4) && ((this getVariable [""bis_disabled_Door_2"",0]) != 1)"; // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = "this animate [""Door_R"",2.4]; this enableVehicleCargo true"; // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
			class CloseDoor_R
			{
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; // This is displayed in the center of the screen just below crosshair. In this case it's an icon, not a text.
				displayName = "Close Right Door"; // Label of the action used in the action menu itself.
				position = "door_right_begin"; // Point in Memory lod in p3d around which the action is available.
				priority = 0.4; // Priority coefficient used for sorting action in the action menu.
				radius = 1.5; // Range around the above defined point in which you need to be to access the action.
				onlyForPlayer = false; // Defines if the action is available only to players or AI as well.
				condition = "((this animationPhase ""Door_R"") > 0) && ((this getVariable [""bis_disabled_Door_2"",0]) != 1)"; // Condition for showing the action in action menu. In this case it checks if the door is closed and if the part of the house in which the door is located hasn't been destroyed yet).
				statement = "this animate [""Door_R"",0]; this enableVehicleCargo false"; // Action taken when this action is selected in the action menu. In this case it calls a function that opens the door.
			};
		};
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\a2_wagons\data\box_wagon.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat"	// changes to this one once damage of the part reaches 1
			};
		};
		
		class VehicleTransport
		{
			class Carrier
			{
				cargoBayDimensions[]        = {"limit_1", "limit_2"};   // Memory points in model defining cargo space
				disableHeightLimit          = 1;                             // If set to 1 disable height limit of transported vehicles
				maxLoadMass                 = 200000;                           // Maximum cargo weight (in Kg) which the vehicle can transport
				cargoAlignment[]            = {"center", "front"};                // Array of 2 elements defining alignment of vehicles in cargo space. Possible values are left, right, center, front, back. Order is important.
				cargoSpacing[]              = {0, 0.15, 0};                     // Offset from X,Y,Z axes (in metres)
				exits[]                     = {"exit_1", "exit_2"};     // Memory points in model defining loading ramps, could have multiple
				unloadingInterval           = 2;                                // Time between unloading vehicles (in seconds)
				loadingDistance             = 10;                               // Maximal distance for loading in exit point (in meters).
				loadingAngle                = 60;                               // Maximal sector where cargo vehicle must be to for loading (in degrees).
				//parachuteClassDefault       = B_Parachute_02_F;                 // Type of parachute used when dropped in air. Can be overridden by parachuteClass in Cargo.
				//parachuteHeightLimitDefault = 50;                               // Minimal height above terrain when parachute is used. Can be overriden by parachuteHeightLimit in Cargo.
			};
		};
		
		class EventHandlers
		{
			init = "(_this select 0) enableVehicleCargo false";
		};
	};
	
			
	class ATS_Trains_A2Wagon_TNT: ATS_Trains_Base
	{
		scope = public;
		displayName = "A2 Wagon (TNT)";
		model = "ats\trains\a2_wagons\wagon_tnt.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_A2Wagon_TNT.jpg";

		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\a2_wagons\data\box_wagon.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat"	// changes to this one once damage of the part reaches 1
			};
		};
		
	};

	class ATS_Trains_A2Wagon_Flat: ATS_Trains_Base
	{
		scope = public;
		mapSize = 0.7;
		accuracy = 0.5;
		icon = "iconObject_2x5";
		displayName = "A2 Wagon (Flat)";
		_generalMacro = "ATS_A2Wagon_Flat";
		model = "ats\trains\a2_wagons\wagon_flat.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_A2Wagon_Flat.jpg";

		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\a2_wagons\data\flat_wagon.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat"	// changes to this one once damage of the part reaches 1
			};
		};
		
		class VehicleTransport
		{
			class Carrier
			{
				cargoBayDimensions[]        = {"limit_1", "limit_2"};   // Memory points in model defining cargo space
				disableHeightLimit          = 1;                             // If set to 1 disable height limit of transported vehicles
				maxLoadMass                 = 200000;                           // Maximum cargo weight (in Kg) which the vehicle can transport
				cargoAlignment[]            = {"center", "front"};                // Array of 2 elements defining alignment of vehicles in cargo space. Possible values are left, right, center, front, back. Order is important.
				cargoSpacing[]              = {0, 0.15, 0};                     // Offset from X,Y,Z axes (in metres)
				exits[]                     = {"exit_1", "exit_2"};     // Memory points in model defining loading ramps, could have multiple
				unloadingInterval           = 2;                                // Time between unloading vehicles (in seconds)
				loadingDistance             = 10;                               // Maximal distance for loading in exit point (in meters).
				loadingAngle                = 60;                               // Maximal sector where cargo vehicle must be to for loading (in degrees).
				//parachuteClassDefault       = B_Parachute_02_F;                 // Type of parachute used when dropped in air. Can be overridden by parachuteClass in Cargo.
				//parachuteHeightLimitDefault = 50;                               // Minimal height above terrain when parachute is used. Can be overriden by parachuteHeightLimit in Cargo.
			};
		};
		
		class EventHandlers
		{
			init = "(_this select 0) enableVehicleCargo true";
		};
	};

	class ATS_Trains_A2Wagon_Tanker: ATS_Trains_Base
	{
		scope = public;
		mapSize = 0.7;
		accuracy = 0.5;
		icon = "iconObject_2x5";
		displayName = "A2 Wagon (Tanker)";
		_generalMacro = "ATS_A2Wagon_Tanker";
		model = "ats\trains\a2_wagons\wagon_tanker.p3d";
		editorPreview = "\ats\trains\screenshots\ATS_Trains_A2Wagon_Tanker.jpg";
		
		class Damage // damage changes material in specific places (visual in hitPoint)
		{
			tex[]={};
			mat[]=
			{
				"ats\trains\a2_wagons\data\tanker_wagon.rvmat", 			// material mapped in model
				"ats\trains\data\damage.rvmat", 		// changes to this one once damage of the part reaches 0.5
				"ats\trains\data\destruct.rvmat"	// changes to this one once damage of the part reaches 1
			};
		};
	};
		
};

class CfgNonAIVehicles
{
	class ProxyRetex;
	class Proxywagon_tanker_wreck: ProxyRetex
	{
		hiddenSelections[] = {"damage"};
		hiddenSelectionsTextures[] = {"ats\trains\a2_wagons\data\tanker_01_co.paa"};
		model = "ats\trains\a2_wagons\wagon_tanker_wreck.p3d";
	};
}; 