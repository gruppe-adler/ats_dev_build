class ctrlStatic;
class ctrlStaticPictureKeepAspect;
class ctrlButton;
class ctrlControlsGroupNoScrollbars;

#include "CfgRscDefines.hpp"

class ATRAINS_CuratorSwitchDisplay: ctrlControlsGroupNoScrollbars
{
    idd = -1;
    onload = "uiNamespace setVariable ['ATRAINS_CuratorSwitchDisplay', _this select 0];";
    onUnload = "uiNamespace setVariable ['ATRAINS_CuratorSwitchDisplay', displayNull];";
    class controls {

    };
};

class ATRAINS_CuratorTrainDisplay: ctrlControlsGroupNoScrollbars
{
    idd = -1;
    onload = "uiNamespace setVariable ['ATRAINS_CuratorTrainDisplay', _this select 0];";
    onUnload = "uiNamespace setVariable ['ATRAINS_CuratorTrainDisplay', displayNull];";
    class controls {
        class ATRAINS_gui_image: ctrlStaticPictureKeepAspect
        {
            idc = IDC_GUI_IMAGE;
            x = SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = PICTURE_DIMEN_W;
            h = PICTURE_DIMEN_H;
            tooltip = "Picture";
            text = "ats\core\gui\train.paa";
        };
        class ATRAINS_gui_slider
        {
            idc = IDC_GUI_SLIDER;
            x = DIALOG_WIDTH - SLIDER_WIDTH;
            y = SPACING * GRID_H;
            w = SLIDER_WIDTH;
            h = SLIDER_HEIGHT;
            onSliderPosChanged = "_this call ATRAIN_fnc_speedControl";
            sliderStep = 1;
            deletable = 0;
            fade = 0;
            type = 43;
            color[] = {1,1,1,0.6};
            colorActive[] = {1,1,1,1};
            colorDisable[] = {1,1,1,0.4};
            style = 0 + 0x10;
            shadow = 0;
            colorDisabled[] = {1,1,1,0.2};
            arrowEmpty = "#(rgb,8,8,3)color(1,0,0,1)";
            arrowFull = "#(rgb,8,8,3)color(0,1,0,1)";
            border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
            thumb = "#(rgb,8,8,3)color(0,0,1,1)";
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            tooltipColorShade[] = {0,0,0,0.65};
            toolTip = "Thrust";
        };
        class ATRAINS_gui_speed: ctrlStatic
        {
            idc = IDC_GUI_SPEED;
            x = DIALOG_WIDTH - SLIDER_WIDTH;
            y = SPACING * GRID_H;
            w = SLIDER_WIDTH;
            h = SLIDER_HEIGHT;
            text = "0 kmh";
        };
        class ATRAINS_gui_buttonForward_image: ctrlStaticPictureKeepAspect
        {
            idc = IDC_GUI_FORWARD_IMG;
            x = DIALOG_WIDTH - (BASE_UNIT * GRID_W * 2);
            y = SPACING * GRID_H;
            w = PICTURE_DIMEN_W;
            h = PICTURE_DIMEN_H;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.1};
            text = "ats\core\gui\forward_off.paa";
        };
        class ATRAINS_gui_buttonForward: ctrlButton
        {
            idc = IDC_GUI_FORWARD_BTN;
            x = DIALOG_WIDTH - (BASE_UNIT * GRID_W * 2);
            y = SPACING * GRID_H;
            w = PICTURE_DIMEN_W;
            h = PICTURE_DIMEN_H;
            colorActive[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.1};
            colorFocused[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            colorBorder[] = {1,1,1,0.1};
            onButtonClick = "[] call ATRAIN_fnc_directionControl;";
            toolTip = "Forward";
        };
        class ATRAINS_gui_brake_image: ctrlStaticPictureKeepAspect
        {
            idc = IDC_GUI_BRAKE_IMG;
            x = BASE_UNIT * GRID_W + SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = BUTTON_DIMEN_W;
            h = BUTTON_DIMEN_H;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.1};
            text = "ats\core\gui\brake_off.paa";
        };
        class ATRAINS_gui_brake: ctrlButton
        {
            idc = IDC_GUI_BRAKE_BTN;
            x = BASE_UNIT * GRID_W + SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = BUTTON_DIMEN_W;
            h = BUTTON_DIMEN_H;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "_this call ATRAIN_fnc_brakeControl;";
            toolTip = "Emergency Brake";
        };
        class ATRAINS_gui_horn_image: ctrlStaticPictureKeepAspect
        {
            idc = IDC_GUI_HORN_IMG;
            x = 2 * BASE_UNIT * GRID_W + SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = BUTTON_DIMEN_W;
            h = BUTTON_DIMEN_H;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.1};
            text = "ats\core\gui\horn_off.paa";
        };
        class ATRAINS_gui_horn: ctrlButton
        {
            idc = IDC_GUI_HORN_BTN;
            x = 2 * BASE_UNIT * GRID_W + SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = BUTTON_DIMEN_W;
            h = BUTTON_DIMEN_H;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "_this call ATRAIN_fnc_hornControl;";
            toolTip = "Horn";
        };
        class ATRAINS_gui_lights_image: ctrlStaticPictureKeepAspect
        {
            idc = IDC_GUI_LIGHTS_IMG;
            x = 3 * BASE_UNIT * GRID_W + SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = BUTTON_DIMEN_W;
            h = BUTTON_DIMEN_H;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.1};
            text = "ats\core\gui\lights_off.paa";
        };
        class ATRAINS_gui_lights: ctrlButton
        {
            idc = IDC_GUI_LIGHTS_BTN;
            x = 3 * BASE_UNIT * GRID_W + SPACING * GRID_W;
            y = SPACING * GRID_H;
            w = BUTTON_DIMEN_W;
            h = BUTTON_DIMEN_H;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "_this call ATRAIN_fnc_lightControl;";
            toolTip = "Lights";
        };
        class ATRAINS_gui_bg: ctrlStatic
        {
            idc = IDC_GUI_BG;
            x = 0;
            y = 0;
            w = DIALOG_WIDTH;
            h = DIALOG_HEIGHT;
            colorBackground[] = {0,0,0,.5};
            colorBackgroundActive[] = {0,0,0,.5};
            canModify = 0;
        };
    };
};
