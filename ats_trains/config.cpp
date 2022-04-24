#define private 0
#define protected 1
#define public 2

class CfgPatches
{
    class ATS_Trains
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {};
    };
};

class CfgEditorCategories
{
    class ATS_Category
    {
        displayName = "ATS";
    };
};

class CfgEditorSubcategories
{
    class ATS_Trains_Subcategory
    {
        displayName = "Trains";
    };
};

class CfgVehicles {
    class Items_base_F;
    class ATS_Trains_Base: Items_base_F {
        armor = 200;
        scope = private;
        mapSize = 0.7;
        accuracy = 0.5;
        side = 3;
        editorCategory = "ATS_Category";
        editorSubCategory = "ATS_Trains_Subcategory";
        icon = "iconObject_2x5";
        destrType = "DestructWreck";
        selectionDamage = "damage";

        simulation = "carx";
        gearbox[] = {-18, 0, 110, 16.15, 14.44, 13.33};
        startEngine = 0;
        canFloat = 0;
        hasdriver = 0;
        hasGunner = 0;
        castCargoShadow = 0;
        transportSoldier = 0;
        hideWeaponsDriver = 1;
        hideWeaponsCargo = 1;
        cargoCanEject = 0;
        driverCanEject = 0;
        gunnerCanEject = 0;
        ejectDeadGunner = 0;
        ejectDeadCargo = 0;
        ejectDeadDriver = 0;
        disableInventory = 1;
        radarTargetSize = 0;
        visualTargetSize = 0;
        irTargetSize = 0;
        cargoDoors[] = {};
        cargoGetInAction[] = {};
        cargoGetOutAction[] = {};
        cargoAction[] = {};
        preciseGetInOut = 0;
        cargoPreciseGetInOut[] = {0};
        cargoProxyIndexes[] = {};
        driverAction = "";
        getInAction = "";
        getOutAction = "";
        driverDoor = "";
        driverLeftHandAnimName = "";
        driverLeftLegAnimName = "";
        driverRightHandAnimName = "";
        driverRightLegAnimName = "";
        memoryPointLMissile = "";
        memoryPointRMissile = "";
        memoryPointMissile = "";
        memoryPointMissileDir = "";
        memoryPointLRocket = "";
        memoryPointRRocket = "";
        memoryPointsGetInDriver = "";
        memoryPointsGetInDriverDir = "";
        memoryPointsGetInCargo = "";
        memoryPointsGetInCargoDir = "";
        memoryPointDriverOptics[] = {};
        memoryPointsGetInCoDriver = "";
        memoryPointsGetInCoDriverDir = "";
        memoryPointsLeftEngineEffect = "";
        memoryPointsLeftWaterEffect = "";
        memoryPointsRightEngineEffect = "";
        memoryPointsRightWaterEffect = "";
        
        memoryPointTrackFLL = "";
        memoryPointTrackFLR = "";
        memoryPointTrackBLL = "";
        memoryPointTrackBLR = "";
        memoryPointTrackFRL = "";
        memoryPointTrackFRR = "";
        memoryPointTrackBRL = "";
        memoryPointTrackBRR = "";
        
        usePreciseGetInAction = 0;
        leftDustEffect = "";
        rightDustEffect = "";
        leftDustEffects[] = {};
        rightDustEffects[] = {};
        leftWaterEffect = "";
        rightWaterEffect = "";
        selectionBackLights = "";
        selectionBrakeLights = "";
        selectionClan = "";
        selectionDashboard = "";
        selectionFireAnim = "";
        selectionLeftOffset = "";
        selectionRightOffset = "";
        selectionShowDamage = "";
        tracksSpeed = 0;
        damperDamping = 0;
        damperForce = 0;
        damperSize = 0;
        

        alphaTracks = 0;
        
        turnCoef = 1;
        terrainCoef = 1;
        
        class complexGearbox
        {
            GearboxRatios[]    = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.870,"D3",1.241,"D4",0.970,"D5",0.711};
            TransmissionRatios[] = {"High",4.111}; // Optional: defines transmission ratios (for example, High and Low range as commonly found in offroad vehicles)
            gearBoxMode        = "auto"; //gearbox can be of type: full-auto (only requires 'W' or 'S'), auto (requires shift between drive and reverse), semi-auto, manual
            moveOffGear        = 1; // defines what gear an automatic or semi-automatic gearbox will move off from stationary in. 1 by default.
            driveString        = "D"; // string to display in the HUD for forward gears.
            neutralString      = "N"; // string to display in the HUD for neutral gear.
            reverseString      = "R"; // string to display in the HUD for reverse gears.
        };
        
        scudModel = "";
        armorStructural = 1;
        damageResistance = 0.004;
        damageEffect = "";
        crewCrashProtection = 0;
        crewVulnerable = 1;
        scopeCurator = 0;
        holdOffroadFormation = 0;
        driveOnComponent[] = {};
        picture = "";
        occludeSoundsWhenIn = 0;
        obstructSoundsWhenIn = 0;
        soundGetIn[] = {"", 0, 1};
        soundGetOut[] = {"", 0, 1};
        soundEngine[] = {"", 0, 1};
        soundEnviron[] = {"", 0, 1};
        soundGear[] = {"", 0.000177828, 1};
        unitInfoType = "RscUnitInfoSoldier";
        hideUnitInfo = 1;
        weapons[] = {};
        magazines[] = {};
        extCameraPosition[] = {0, 5, -9};
        threat[] = {0, 0, 0};
        class ViewPilot
        {
            initFov = 1;
            minFov = 1;
            maxFov = 1;
            initAngleX = 0;
            minAngleX = 0;
            maxAngleX = 0;
            initAngleY = 0;
            minAngleY = 0;
            maxAngleY = 0;
            minMoveX = 0;
            maxMoveX = 0;
            minMoveY = 0;
            maxMoveY = 0;
            minMoveZ = 0;
            maxMoveZ = 0;
        };
        class TransportWeapons
        {
        };
        class TransportMagazines
        {
        };
        class Exhausts
        {
        };
        
        /*
        class Reflectors
        {
        };
        */
        
        class Sounds
        {
            class train_engine_idle
            {
                sound[] = {"\ats\trains\sounds\train_engine_idle.ogg", 2, 1, 600};
                frequency = "1";
                volume = "CustomSoundController1";
            };
            class train_engine
            {
                sound[] = {"\ats\trains\sounds\train_engine.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController2";
            };
            class train_track
            {
                sound[] = {"\ats\trains\sounds\train_track.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController3";
            };
            class train_brake
            {
                sound[] = {"\ats\trains\sounds\train_brake1.ogg", 2, 1, 800};
                frequency = "1";
                volume = "CustomSoundController4";
            };
        };
        class UserActions
        {
        };
        class MFD
        {
        };
        class RenderTargets
        {
        };
        
        class SquadTitles
        {
            color[] = {0, 0, 0, 0};
            name = "";
        };
        
        class Turrets
        {
        };
        fuelCapacity = 0;
        transportAmmo = 0;
        transportMaxMagazines = 0;
        transportMaxWeapons = 0;
        transportMaxBackpacks = 0;
        transportFuel = 0;
        transportRepair = 0;
        transportVehiclesMass = 0;
        
        /*
        class HitPoints
        {
            class HitHull
            {
                armor = 1;
                convexComponent = "hit_Hull";
                depends = "Total";
                explosionShielding = 0;
                material = -1;
                minimalHit = 0.02;
                name = "hit_Hull";
                passThrough = 1;
                radius = 0.5;
                visual = "Camo1";
                class DestructionEffects
                {
                };
            };
        };

       
        
        animationList[] = {};
        textureList[] = {};
        */
        
        class Damage
        {
            tex[]={};
            mat[]=
            {
                "ats\trains\data\default_super.rvmat",
                "ats\trains\data\damage.rvmat",
                "ats\trains\data\destruct.rvmat",
                
                "a3\data_f\glass_veh.rvmat",
                "a3\data_f\Glass_veh_damage.rvmat",
                "a3\data_f\Glass_veh_damage.rvmat"
            };
        };
        
        class AnimationSources { //DO NOT REMOVE
            class Wheels_source
            {
                source = "user";
                animPeriod = 1;
                initPhase = 0;
            };
        };
    
        #include "\ats\trains\DestructionEffects.hpp"
    };
};