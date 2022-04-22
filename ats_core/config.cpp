#define _ARMA_

class CfgPatches
{
    class ATS_Core
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {};
    };
};

#include "CfgSounds.hpp"
#include "CfgRsc.hpp"
#include "CfgCuratorDisplay.hpp"

class CfgNetworkMessages
{
    class AdvancedTrainSimulatorRemoteExecClient
    {
        module = "AdvancedTrainSimulator";
        parameters[] = {"ARRAY","STRING","OBJECT","BOOL"};
    };
    class AdvancedTrainSimulatorRemoteExecServer
    {
        module = "AdvancedTrainSimulator";
        parameters[] = {"ARRAY","STRING","BOOL"};
    };
};
class CfgFunctions
{
    class ATS
    {
        tag = "ATRAIN";
        class Main
        {
            file = "ats\core\functions";
            class init
            {
                postInit = 1;
            };
        };
        class Camera
        {
            file = "ats\core\functions\camera";
            class cameraMouseMoveHandler{};
            class cameraMouseZoomHandler{};
            class cameraUpdatePosition{};
            class disable3rdPersonCamera{};
            class enable3rdPersonCamera{};
        };
        class Common
        {
            file = "ats\core\functions\common";
            class addEventHandler{};
            class animateUI{};
            class getTypeOf{};
            class hidePlayerObjectGlobal{};
            class rebuildArrayLookupIndexes{};
            class RemoteExec{};
            class RemoteExecServer{};
            class removeAllEventHandlers{};
            class removeEventHandler{};
            class disableLoadingScreen{};
            class setLoadingScreenMessage{};
            class addZENModules{ postinit = 1; };
            class createZeusControl{};
            class createSwitchControl{};
        };
        class customLights {
            file = "ats\core\functions\customLights";

            class attachLights{};
            class lightDirection{};
        };
        class Debugging
        {
            file = "ats\core\functions\debugging";
            class createMarker{};
            class getProfile{};
            class initTrackTestAction{};
            class printProfiles{};
            class profileInit{};
            class profileMethodStart{};
            class profileMethodStop{};
            class resetProfile{};
        };
        class gui
        {
            file = "ats\core\functions\gui";
            class brakeControl;
            class brakeDisplay;
            class directionControl;
            class directionDisplay;
            class hornControl;
            class hornDisplay;
            class lightControl;
            class lightDisplay;
            class speedControl;
            class switchControl;

        };
        class Server
        {
            file = "ats\core\functions\server";
            class attachTrainToTrackMap{};
            class initServer{};
            class registerTrain{};
            class registerTrainCar{};
            class updateServerTrackMap{};
            class updateTrackMap{};
            class requestATSInstall{};
        };
        class Track
        {
            file = "ats\core\functions\track";
            class addWorldPaths{};
            class buildTrackMap{};
            class findAlignedTrackWorldPath{};
            class getTrackDefinition{};
            class getTrackMapConnection{};
            class getTracksAtPosition{};
            class getTrackUnderTrainCar{};
            class getTrackWorldPaths{};
            class initTracks{};
            class lookupTrackMapPosition{};
            class preloadAllTracksNearEditorPlacedConnections{};
            class getTrackEndPoints{};
            class findPathsToNearestNodes{};
            class findPathToNearestNode{};
            class findAttachedTrack{};
            class switchAction{};
            class getSwitch{};
        };
        class Train
        {
            file = "ats\core\functions\train";
            class initTrains{};
        };
        class TrainCommon
        {
            file = "ats\core\functions\train\common";
            class calculateTrainAlignment{};
            class getPositionAndDirectionOnPath{};
            class getTrainAtPosition{};
            class getTrainDefinition{};
            class getTrainPositionAndDirection{};
            class getTrainUnderPlayer{};
            class hideTrainObjectGlobal{};
            class hideTrainReplaceWithNew{};
            class isPassengerMoving{};
            class isTrain{};
            class rebuildTrain{};
            class getNearestTrainCar{};
            class getTrainCars{};
            class getTrain{};
            class getTrainEngine{};
            class getTrainCar{};
            class getOrCreateTrainCar{};
            class getTrainDriver{};
            class disconnectTrainCar{};
            class attachTrainCar{};
            class findRearCar{};
            class findFrontCar{};
            class createTrainCar{};
            class createTrain{};
            class getNearestTrainCars{};
            class derailTrain{};
            class getTrainDriveCondition{};
            class getTrainRideCondition{};
            class setTrainDriveCondition{};
            class setTrainRideCondition{};
        };
        class TrainCargo
        {
            file = "ats\core\functions\train\cargo";
            class attachCargo{};
            class cargoEnabled{};
            class getCargo{};

        };
        class TrainClutch
        {
            file = "ats\core\functions\train\clutch";
            class clutchConnect{};
            class clutchCreate{};

        };
        class TrainControls
        {
            file = "ats\core\functions\train\controls";
            class attachToTrainCar{};
            class disableTrainPassengerInputHandlers{};
            class enableTrainPassengerInputHandlers{};
            class exitTrain{};
            class getInTrainDriver{};
            class getInTrainPassenger{};
            class managePlayerTrainActions{};
            class passengerMoveInputHandler{};
            class rideOnTrain{};
            class rideOnTrainEventHandler{};
            class toggleCruiseControl{};
            class toggleLights{};
        };
        class Trainfx
        {
            file = "ats\core\functions\train\fx";
            class sparksEffectClient{ postinit = 1; };
            class sparkSmall{};
        };
        class TrainHud
        {
            file = "ats\core\functions\train\hud";
            class disableHud{};
            class enableHud{};
        };
        class TrainSimulation
        {
            file = "ats\core\functions\train\simulation";
            class cleanUpNodePath{};
            class drawEventHandler{};
            class drawTrain{};
            class setWheelSpeed{};
            class simulateTrain{};
            class simulateTrainAttachment{};
            class simulateTrainParticleEffects{};
            class simulateTrainVelocity{};
            class handleDamage{};
            class handleKilled{};
            class simulateTrainCarsKilled{};
            class simulateTrainCollision{};
            class simulateTrainSound{};
            class trainVelocityHandler { postInit = 1; };
        };
    };
};
