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


// IDC
#define IDC_GUI_BG 1000
#define IDC_GUI_IMAGE 1001
#define IDC_GUI_SLIDER 1002
#define IDC_GUI_SPEED 1003

#define IDC_GUI_FORWARD_IMG 2001
#define IDC_GUI_FORWARD_BTN 2002

#define IDC_GUI_BACKWARD_IMG 2003
#define IDC_GUI_BACKWARD_BTN 2004

#define IDC_GUI_BRAKE_IMG 2005
#define IDC_GUI_BRAKE_BTN 2006

#define IDC_GUI_HORN_IMG 2007
#define IDC_GUI_HORN_BTN 2008

#define IDC_GUI_LIGHTS_IMG 2009
#define IDC_GUI_LIGHTS_BTN 2010

