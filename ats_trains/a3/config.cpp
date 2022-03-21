#define private 0
#define protected 1
#define public 2

class CfgPatches
{
	class ATS_Trains_A3
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ATS_Trains"};
	};
};

class CfgVehicles {
		
	class Land_Locomotive_01_v1_F;
	class ATS_Trains_A3_Loco_1 : Land_Locomotive_01_v1_F
	{
		displayName = "A3 Locomotive 1";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

	class Land_Locomotive_01_v2_F;
	class ATS_Trains_A3_Loco_2 : Land_Locomotive_01_v2_F
	{
		displayName = "A3 Locomotive 2";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

	class Land_Locomotive_01_v3_F;
	class ATS_Trains_A3_Loco_3 : Land_Locomotive_01_v3_F
	{
		displayName = "A3 Locomotive 3";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

	class Land_RailwayCar_01_passenger_F;
	class ATS_Trains_A3_Passenger : Land_RailwayCar_01_passenger_F
	{
		displayName = "A3 Passenger";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

	class Land_RailwayCar_01_sugarcane_empty_F;
	class ATS_Trains_A3_Sugar_Empty : Land_RailwayCar_01_sugarcane_empty_F
	{
		displayName = "A3 Sugarcane (Empty)";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

	class Land_RailwayCar_01_sugarcane_F;
	class ATS_Trains_A3_Sugar_Full : Land_RailwayCar_01_sugarcane_F
	{
		displayName = "A3 Sugarcane (Full)";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

	class Land_RailwayCar_01_tank_F;
	class ATS_Trains_A3_Tank : Land_RailwayCar_01_tank_F
	{
		displayName = "A3 Tank";
		editorCategory = "ATS_Category";
		editorSubCategory = "ATS_Trains_Subcategory";
		destrType = "DestructWreck";
		armor = 500;
		selectionDamage = Damage;
		class Damage
		{
			tex[] = {};
			mat[] = {"a3\props_f_exp\infrastructure\railways\data\locomotive_01.rvmat", "a3\data_f\default.rvmat", "a3\data_f\default.rvmat"};
		};
		#include "\ats\trains\DestructionEffects.hpp"
	};

};