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
        class ATRAINS_gui_bg: ctrlStatic
        {
            idc = IDC_GUI_BG;
            x = 0;
            y = 0;
            w = DIALOG_WIDTH;
            h = DIALOG_HEIGHT;
            colorBackground[] = {0,0,0,1};
        };
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
            x = DIALOG_WIDTH - SLIDER_HEIGHT;
            y = 0;
            w = SLIDER_HEIGHT;
            h = DIALOG_HEIGHT;
            onSliderPosChanged = "_this call ATRAIN_fnc_speedControl";
            sliderRange[] = {0,80};
            sliderStep = 0.5;
            sliderPosition = 0;
            deletable = 0;
            fade = 0;
            type = CT_XSLIDER ;
            color[] = {1,1,1,0.6};
            colorActive[] = {1,1,1,1};
            colorDisable[] = {1,1,1,0.4};
            style = SL_VERT + SL_TEXTURES;
            shadow = 0;
            colorDisabled[] = {1,1,1,0.2};
            arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
            arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
            border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
            thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
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
            x = DIALOG_WIDTH - 10*GRID_W;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/2;
            text = "ats\core\gui\forward_off.paa";
        };
        class ATRAINS_gui_buttonForward: ctrlButton 
        {
            idc = IDC_GUI_FORWARD_BTN;
            x = DIALOG_WIDTH - 10*GRID_W;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/2;
            colorText[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0 };
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            colorBorder[] = {1,1,1,0.1};
            onButtonClick = "systemChat str _this";
        };
        class ATRAINS_gui_buttonBackward_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_BACKWARD_IMG;
            x = DIALOG_WIDTH - 10*GRID_W;
            y = DIALOG_HEIGHT/4;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/2;
            text = "ats\core\gui\backward_off.paa";
        };
        class ATRAINS_gui_buttonBackward: ctrlButton 
        {
            idc = IDC_GUI_BACKWARD_BTN;
            x = DIALOG_WIDTH - 10*GRID_W;
            y = DIALOG_HEIGHT/4;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN/2;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "systemChat str _this";
        };
        class ATRAINS_gui_brake_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_BRAKE_IMG;
            x = BUTTONS_X;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.5};
            text = "ats\core\gui\brake_off.paa";
        };
        class ATRAINS_gui_brake: ctrlButton 
        {
            idc = IDC_GUI_BRAKE_BTN;
            x = BUTTONS_X;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "_this call ATRAIN_fnc_brakeControl;";
        };
        class ATRAINS_gui_horn_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_HORN_IMG;
            x = BUTTONS_X + BUTTON_DIMEN;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.6};
            text = "ats\core\gui\horn_off.paa";
        };
        class ATRAINS_gui_horn: ctrlButton 
        {
            idc = IDC_GUI_HORN_BTN;
            x = BUTTONS_X + BUTTON_DIMEN;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "_this call ATRAIN_fnc_hornControl;";
        };
        class ATRAINS_gui_lights_image: ctrlStaticPictureKeepAspect 
        {
            idc = IDC_GUI_LIGHTS_IMG;
            x = BUTTONS_X + BUTTON_DIMEN*2;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.7};
            text = "ats\core\gui\lights_off.paa";
        };
        class ATRAINS_gui_lights: ctrlButton 
        {
            idc = IDC_GUI_LIGHTS_BTN;
            x = BUTTONS_X + BUTTON_DIMEN*2;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            color[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorBorder[] = {1,0,0,1};
            onButtonClick = "_this call ATRAIN_fnc_lightControl;";
        };
    };
};
