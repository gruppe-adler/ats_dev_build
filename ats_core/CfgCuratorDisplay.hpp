class ctrlStatic;
class ctrlStaticPictureKeepAspect ;
class ctrlButton;
class ctrlSliderH;
class ctrlControlsGroupNoScrollbars;

#define GRID_W (pixelW * pixelGrid)
#define GRID_H (pixelH * pixelGrid)
#define QUOTE(var1) #var1
#define CENTER_X(w) (safezoneX + (safezoneW - w) / 2)
#define CENTER_Y(h) (safezoneY + (safezoneH - h) / 2)
#define SPACING 1

#define DIALOG_WIDTH (100 * GRID_W)
#define DIALOG_HEIGHT (20 * GRID_H)

#define SLIDER_HEIGHT (2 * GRID_H)

#define PICTURE_DIMEN (10 * GRID_H)

#define BUTTON_DIMEN (10 * GRID_H)

#define BUTTONS_X (DIALOG_WIDTH/2 - BUTTON_DIMEN*2)


class ATRAINS_CuratorDisplay: ctrlControlsGroupNoScrollbars 
{   
    idd = -1;
    onload = "uiNamespace setVariable ['ATRAINS_CuratorDisplay', _this select 0];";
    onUnload = "uiNamespace setVariable ['ATRAINS_CuratorDisplay', displayNull];";
    class controls {
        class ATRAINS_gui_bg: ctrlStatic
        {
            idc = 1000;
            x = 0;
            y = 0;
            w = DIALOG_WIDTH;
            h = DIALOG_HEIGHT;
            colorBackground[] = {0,0,0,1};
        };

        class ATRAINS_gui_image: ctrlStaticPictureKeepAspect 
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0;
            y = 0;
            w = PICTURE_DIMEN;
            h = PICTURE_DIMEN;
            tooltip = "Picture"; //--- ToDo: Localize;
        };
        class ATRAINS_gui_slider: ctrlSliderH
        {
            idc = 1900;
            x = 0;
            y = 0;
            w = DIALOG_WIDTH;
            h = SLIDER_HEIGHT;
        };
        class ATRAINS_gui_buttonForward: ctrlButton 
        {
            idc = 1600;
            x = DIALOG_WIDTH - 10*GRID_W;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {0.2,0.4,0.2,1};
        };
        class ATRAINS_gui_buttonBackward: ctrlButton 
        {
            idc = 1601;
            x = DIALOG_WIDTH - 10*GRID_W;
            y = DIALOG_HEIGHT/2;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {0.4,0.2,0.2,1};
        };
        class ATRAINS_gui_button1: ctrlButton 
        {
            idc = 1602;
            x = BUTTONS_X;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.5};
        };
        class ATRAINS_gui_button2: ctrlButton 
        {
            idc = 1603;
            x = BUTTONS_X + BUTTON_DIMEN;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.6};
        };
        class ATRAINS_gui_button3: ctrlButton 
        {
            idc = 1604;
            x = BUTTONS_X + BUTTON_DIMEN*2;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.7};
        };
        class ATRAINS_gui_button4: ctrlButton 
        {
            idc = 1605;
            x = BUTTONS_X + BUTTON_DIMEN*3;
            y = 0;
            w = BUTTON_DIMEN;
            h = BUTTON_DIMEN;
            colorBackground[] = {1,1,1,0.8};
        };
    };
};
