// DEFAULT CLASSES
#define CT_XSLIDER        43
#define SL_VERT           0

#define SL_TEXTURES       0x10


// GRID
#define GRID_W (pixelW * pixelGrid)
#define GRID_H (pixelH * pixelGrid)
#define QUOTE(var1) #var1
#define CENTER_X(w) (safezoneX + (safezoneW - w) / 2)
#define CENTER_Y(h) (safezoneY + (safezoneH - h) / 2)
#define SPACING 1
#define BASE_UNIT 24

#define DIALOG_WIDTH (BASE_UNIT * 6 * GRID_W)
#define DIALOG_HEIGHT (BASE_UNIT * GRID_H)

#define SLIDER_WIDTH (22 * GRID_W)
#define SLIDER_HEIGHT (22 * GRID_H)

#define PICTURE_DIMEN_W (22 * GRID_W)
#define PICTURE_DIMEN_H (22 * GRID_H)

#define THUMB_DIMEN_W (12 * GRID_W)
#define THUMB_DIMEN_H (12 * GRID_H)

#define BUTTON_DIMEN_W (22 * GRID_W)
#define BUTTON_DIMEN_H (22 * GRID_H)

#define BUTTONS_X (DIALOG_WIDTH/2 - BUTTON_DIMEN*2)


// IDC
#define IDC_GUI_BG 71000
#define IDC_GUI_IMAGE 71001
#define IDC_GUI_SLIDER 71002
#define IDC_GUI_SPEED 71003

#define IDC_GUI_FORWARD_IMG 72001
#define IDC_GUI_FORWARD_BTN 72002

#define IDC_GUI_BACKWARD_IMG 72003
#define IDC_GUI_BACKWARD_BTN 72004

#define IDC_GUI_BRAKE_IMG 72005
#define IDC_GUI_BRAKE_BTN 72006

#define IDC_GUI_HORN_IMG 72007
#define IDC_GUI_HORN_BTN 72008

#define IDC_GUI_LIGHTS_IMG 72009
#define IDC_GUI_LIGHTS_BTN 72010
