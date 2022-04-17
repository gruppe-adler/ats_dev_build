class ctrlStatic;
class ctrlStaticPictureKeepAspect;
class ctrlButton;
class ctrlControlsGroupNoScrollbars;

#include "CfgRscDefines.hpp"

class ATRAINS_CuratorDisplay: ctrlControlsGroupNoScrollbars 
{   
    idd = -1;
    onload = "uiNamespace setVariable ['ATRAINS_CuratorDisplay', _this select 0];";
    onUnload = "uiNamespace setVariable ['ATRAINS_CuratorDisplay', displayNull];";
    class controls {
        class ATRAINS_gui_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_IMAGE;
            x = 0;
            y = 0;
            w = PICTURE_DIMEN;
            h = PICTURE_DIMEN;
            tooltip = "Picture"; //--- ToDo: Localize;
            text = "ats\core\gui\train.paa";
        };
        class ATRAINS_gui_slider
        {
            idc = IDC_GUI_SLIDER;
            x = DIALOG_WIDTH - BUTTON_DIMEN*2;
            y = BUTTON_DIMEN/2;
            w = BUTTON_DIMEN*2;
            h = BUTTON_DIMEN/6;
            onSliderPosChanged = "_this call ATRAIN_fnc_speedControl";
            deletable = 0;
            fade = 0;
            type = 43;
            color[] = {1,1,1,0.6};
            colorActive[] = {1,1,1,1};
            colorDisable[] = {1,1,1,0.4};
            style = 0x400 + 0x10;
            shadow = 0;
            sliderStep = 1;
            colorDisabled[] = {1,1,1,0.2};
            arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
            arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
            border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
            thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            tooltipColorShade[] = {0,0,0,0.65};
            toolTip = "Thrust";
        };
        class ATRAINS_gui_speed: ctrlStatic 
        {
            idc = IDC_GUI_SPEED;
            x = 0;
            y = 0;
            w = DIALOG_WIDTH;
            h = BUTTON_DIMEN;
            text = "0 kmh";
        };
        class ATRAINS_gui_buttonForward_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_FORWARD_IMG;
            x = DIALOG_WIDTH - (BUTTON_DIMEN);
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/1.5;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            text = "ats\core\gui\forward_off.paa";
        };
        class ATRAINS_gui_buttonForward: ctrlButton 
        {
            idc = IDC_GUI_FORWARD_BTN;
            x = DIALOG_WIDTH - (BUTTON_DIMEN);
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/1.5;
            colorActive[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            colorBorder[] = {1,1,1,0.1};
            onButtonClick = "[true] call ATRAIN_fnc_directionControl;";
            toolTip = "Forward";
        };
        class ATRAINS_gui_buttonBackward_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_BACKWARD_IMG;
            x = DIALOG_WIDTH - (BUTTON_DIMEN*2);
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/1.5;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            text = "ats\core\gui\backward_off.paa";
        };
        class ATRAINS_gui_buttonBackward: ctrlButton 
        {
            idc = IDC_GUI_BACKWARD_BTN;
            x = DIALOG_WIDTH - (BUTTON_DIMEN*2);
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/1.5;
            colorActive[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            colorBorder[] = {1,1,1,0.1};
            onButtonClick = "[false] call ATRAIN_fnc_directionControl;";
            toolTip = "Backward";
        };
        class ATRAINS_gui_brake_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_BRAKE_IMG;
            x = BUTTONS_X;
            y = BUTTON_DIMEN/4;
            w = BUTTON_DIMEN/2;
            h = BUTTON_DIMEN/1.5;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            text = "ats\core\gui\brake_off.paa";
        };
        class ATRAINS_gui_brake: ctrlButton 
        {
            idc = IDC_GUI_BRAKE_BTN;
            x = BUTTONS_X;
            y = BUTTON_DIMEN/4;
            w = BUTTON_DIMEN/2;
            h = BUTTON_DIMEN/1.5;
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
            x = BUTTONS_X + BUTTON_DIMEN;
            y = BUTTON_DIMEN/4;
            w = BUTTON_DIMEN/2;
            h = BUTTON_DIMEN/1.5;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            text = "ats\core\gui\horn_off.paa";
        };
        class ATRAINS_gui_horn: ctrlButton 
        {
            idc = IDC_GUI_HORN_BTN;
            x = BUTTONS_X + BUTTON_DIMEN;
            y = BUTTON_DIMEN/4;
            w = BUTTON_DIMEN/2;
            h = BUTTON_DIMEN/1.5;
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
            x = BUTTONS_X + BUTTON_DIMEN*2;
            y = BUTTON_DIMEN/4;
            w = BUTTON_DIMEN/2;
            h = BUTTON_DIMEN/1.5;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            text = "ats\core\gui\lights_off.paa";
        };
        class ATRAINS_gui_lights: ctrlButton 
        {
            idc = IDC_GUI_LIGHTS_BTN;
            x = BUTTONS_X + BUTTON_DIMEN*2;
            y = BUTTON_DIMEN/4;
            w = BUTTON_DIMEN/2;
            h = BUTTON_DIMEN/1.5;
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
