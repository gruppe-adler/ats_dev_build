#define private 0
#define protected 1
#define public 2

class CfgPatches
{
    class ATS_Trains_SD60
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"ATS_Trains"};
    };
};

class CfgVehicles {
    
    class Items_base_F;
    class ATS_Trains_Base;
    class ATS_Trains_SD60_Engine: ATS_Trains_Base
    {
        scope = public;
        model = "ats\trains\SD60\ats_trains_sd60_engine.p3d";
        displayName = "SD60 Union Pacific Engine";
        author  = "PolySquid, imported by IN005";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Engine.jpg";
        
        class Reflectors    
        {
            // only front lights are considered to be reflectors to save CPU
            class LightCarHeadM01
            {
                color[]         = {1900, 1800, 1700};       // approximate colour of standard lights
                ambient[]       = {5, 5, 5};                // nearly a white one
                position        = "LightCarHeadM01";        // memory point for start of the light and flare
                direction       = "LightCarHeadM01_end";    // memory point for the light direction
                hitpoint        = "Light_M_1";              // point(s) in hitpoint lod for the light (hitPoints are created by engine)
                selection       = "Light_M_1";              // selection for artificial glow around the bulb, not much used any more
                size            = 1.5;                      // size of the light point seen from distance
                innerAngle      = 100;                      // angle of full light
                outerAngle      = 179;                      // angle of some light
                coneFadeCoef    = 10;                       // attenuation of light between the above angles
                intensity       = 2;                        // strength of the light
                useFlare        = true;                     // does the light use flare?
                dayLight        = false;                    // switching light off during day saves CPU a lot
                flareSize       = 1.5;                      // how big is the flare
                
                class Attenuation
                {
                    start           = 1.0;
                    constant        = 0; 
                    linear          = 0; 
                    quadratic       = 0.25; 
                    hardLimitStart  = 30;       // it is good to have some limit otherwise the light would shine to infinite distance
                    hardLimitEnd    = 60;       // this allows adding more lights into scene
                };
            };
            class LightCarHeadM02: LightCarHeadM01 
            {
                position        = "LightCarHeadM02";        // memory point for start of the light and flare
                direction       = "LightCarHeadM02_end";    // memory point for the light direction
                hitpoint        = "Light_M_2";              // point(s) in hitpoint lod for the light (hitPoints are created by engine)
                selection       = "Light_M_2";              // selection for artificial glow around the bulb, not much used any more
            };
        };

        aggregateReflectors[] = {{"LightCarHeadM01","LightCarHeadM02"}}; // aggregating reflectors helps the engine a lot
        // it might be even good to aggregate all lights into one source as it is done for most of the cars
    };
    class ATS_Trains_SD60_Flatbed: ATS_Trains_Base
    {
        scope = public;
        model = "ats\trains\SD60\ats_trains_sd60_flatbed.p3d";
        displayName = "SD60 Flatbed";
        author  = "PolySquid, imported by IN005";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Flatbed.jpg";
        transportVehiclesCount = 100;

        class VehicleTransport
            {
            class Carrier
            {
                cargoBayDimensions[] = {{1.5,7.6,3.1},{-1.77,-7.6,-1.62}};
                disableHeightLimit = 1;
                maxLoadMass = 200000;
                cargoAlignment[] = {"center","front"};
                cargoSpacing[] = {0,0.2,-0.1};
                exits[] = {"Exit_1","Exit_2"};
                unloadingInterval = 2;
                loadingDistance = 10;
                loadingAngle = 180;
                parachuteClassDefault = "";
                parachuteHeightLimitDefault = 100;
            };
        };
        class EventHandlers
        {
            init = "(_this select 0) enableVehicleCargo true; (_this select 0) allowDamage false; diag_log 'ATS Trains VehicleTransport added';";
        };
    };
    class ATS_Trains_SD60_Oil_Tank: ATS_Trains_Base
    {
        scope = public;
        model = "ats\trains\SD60\ats_trains_sd60_oil_tank.p3d";
        displayName = "SD60 Oil Tank";
        author  = "PolySquid, imported by IN005";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Oil_Tank.jpg";
        
        //model.cfg references these for their source
        class AnimationSources {
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
    };
    class ATS_Trains_SD60_Open_Wagon: ATS_Trains_Base
    {
        scope = public;
        model = "ats\trains\SD60\ats_trains_sd60_open_wagon.p3d";
        displayName = "SD60 Open Wagon";
        author  = "PolySquid, imported by IN005";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Open_Wagon.jpg";
    };
    class ATS_Trains_SD60_Covered_Wagon: ATS_Trains_Base
    {
        scope = public;
        model = "ats\trains\SD60\ats_trains_sd60_covered_wagon.p3d";
        displayName = "SD60 Covered Wagon (Red)";
        author  = "PolySquid, imported by IN005";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Covered_Wagon.jpg";
        hiddenSelections[] = {"camo1"};
        
        class TextureSources
        {
            class Red
            {
                displayName = "Red";
                author = "PolySquid, imported by IN005";
                textures[] = {"ats\trains\SD60\data\car1_color.paa"};
                factions[] = {"CIV_F"};
            };
            class Black
            {
                displayName = "Black";
                author = "PolySquid, imported by IN005";
                textures[] = {"ats\trains\SD60\data\car1_extra\car1_black.paa"};
                factions[] = {"CIV_F"};
            };
            class Blue
            {
                displayName = "Blue";
                author = "PolySquid, imported by IN005";
                textures[] = {"ats\trains\SD60\data\car1_extra\car1_blue.paa"};
                factions[] = {"CIV_F"};
            };
            class Green
            {
                displayName = "Green";
                author = "PolySquid, imported by IN005";
                textures[] = {"ats\trains\SD60\data\car1_extra\car1_green.paa"};
                factions[] = {"CIV_F"};
            };
            class Grey
            {
                displayName = "Grey";
                author = "PolySquid, imported by IN005";
                textures[] = {"ats\trains\SD60\data\car1_extra\car1_grey.paa"};
                factions[] = {"CIV_F"};
            };
        };
        textureList[] = {"Red",1};
        class EventHandlers
        {
            init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        };
        
    };
    class ATS_Trains_SD60_Covered_Wagon_Black: ATS_Trains_SD60_Covered_Wagon
    {
        scope = public;
        displayName = "SD60 Covered Wagon (Black)";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Covered_Wagon_Black.jpg";
        textureList[] = {"Black",1};
    };
    class ATS_Trains_SD60_Covered_Wagon_Blue: ATS_Trains_SD60_Covered_Wagon
    {
        scope = public;
        displayName = "SD60 Covered Wagon (Blue)";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Covered_Wagon_Blue.jpg";
        textureList[] = {"Blue",1};
    };
    class ATS_Trains_SD60_Covered_Wagon_Green: ATS_Trains_SD60_Covered_Wagon
    {
        scope = public;
        displayName = "SD60 Covered Wagon (Green)";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Covered_Wagon_Green.jpg";
        textureList[] = {"Green",1};
    };
    class ATS_Trains_SD60_Covered_Wagon_Grey: ATS_Trains_SD60_Covered_Wagon
    {
        scope = public;
        displayName = "SD60 Covered Wagon (Grey)";
        editorPreview = "\ats\trains\screenshots\ATS_Trains_SD60_Covered_Wagon_Grey.jpg";
        textureList[] = {"Grey",1};
    };
};

class CfgNonAIVehicles
{
    class ProxyRetex;
    class Proxyats_trains_sd60_oil_tank_wreck: ProxyRetex
    {
        hiddenSelections[] = {"damage"};
        hiddenSelectionsTextures[] = {"ats\trains\sd60\data\car3_color.paa"};
        model = "ats\trains\SD60\ats_trains_sd60_oil_tank_wreck.p3d";
    };
}; 
