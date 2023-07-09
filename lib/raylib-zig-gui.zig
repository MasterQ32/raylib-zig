// raylib-zig (c) Nikolas Wipper 2023

const rl = @import("raylib.math");

const Matrix = rl.Matrix;
const Quaternion = rl.Quaternion;
const Vector2 = rl.Vector2;
const Vector3 = rl.Vector3;
const Vector4 = rl.Vector4;
const Rectangle = rl.Rectangle;
const Font = rl.Font;
const Color = rl.Color;

pub const GuiStyleProp = extern struct {
    controlId: c_ushort,
    propertyId: c_ushort,
    propertyValue: c_uint,
};

pub const GuiState = enum(c_uint) {
    STATE_NORMAL = 0,
    STATE_FOCUSED = 1,
    STATE_PRESSED = 2,
    STATE_DISABLED = 3,
};

pub const GuiTextAlignment = enum(c_uint) {
    TEXT_ALIGN_LEFT = 0,
    TEXT_ALIGN_CENTER = 1,
    TEXT_ALIGN_RIGHT = 2,
};

pub const GuiControl = enum(c_uint) {
    // Default -> populates to all controls when set
    DEFAULT = 0,

    // Basic controls
    LABEL = 1, // Used also for: LABELBUTTON
    BUTTON = 2,
    TOGGLE = 3, // Used also for: TOGGLEGROUP
    SLIDER = 4, // Used also for: SLIDERBAR
    PROGRESSBAR = 5,
    CHECKBOX = 6,
    COMBOBOX = 7,
    DROPDOWNBOX = 8,
    TEXTBOX = 9, // Used also for: TEXTBOXMULTI
    VALUEBOX = 10,
    SPINNER = 11, // Uses: BUTTON, VALUEBOX
    LISTVIEW = 12,
    COLORPICKER = 13,
    SCROLLBAR = 14,
    STATUSBAR = 15,
};

/// Gui base properties for every control
/// NOTE: RAYGUI_MAX_PROPS_BASE properties (by default 16 properties)
pub const GuiControlProperty = enum(c_uint) {
    BORDER_COLOR_NORMAL = 0,
    BASE_COLOR_NORMAL = 1,
    TEXT_COLOR_NORMAL = 2,
    BORDER_COLOR_FOCUSED = 3,
    BASE_COLOR_FOCUSED = 4,
    TEXT_COLOR_FOCUSED = 5,
    BORDER_COLOR_PRESSED = 6,
    BASE_COLOR_PRESSED = 7,
    TEXT_COLOR_PRESSED = 8,
    BORDER_COLOR_DISABLED = 9,
    BASE_COLOR_DISABLED = 10,
    TEXT_COLOR_DISABLED = 11,
    BORDER_WIDTH = 12,
    TEXT_PADDING = 13,
    TEXT_ALIGNMENT = 14,
    RESERVED = 15,
};

/// DEFAULT extended properties
/// NOTE: Those properties are common to all controls or global
pub const GuiDefaultProperty = enum(c_uint) {
    TEXT_SIZE = 16,
    TEXT_SPACING = 17,
    LINE_COLOR = 18,
    BACKGROUND_COLOR = 19,
};

pub const GuiToggleProperty = enum(c_uint) {
    GROUP_PADDING = 16,
};

pub const GuiSliderProperty = enum(c_uint) {
    SLIDER_WIDTH = 16,
    SLIDER_PADDING = 17,
};

pub const GuiProgressBarProperty = enum(c_uint) {
    PROGRESS_PADDING = 16,
};

pub const GuiScrollBarProperty = enum(c_uint) {
    ARROWS_SIZE = 16,
    ARROWS_VISIBLE = 17,
    SCROLL_SLIDER_PADDING = 18,
    SCROLL_SLIDER_SIZE = 19,
    SCROLL_PADDING = 20,
    SCROLL_SPEED = 21,
};

pub const GuiCheckBoxProperty = enum(c_uint) {
    CHECK_PADDING = 16,
};

pub const GuiComboBoxProperty = enum(c_uint) {
    COMBO_BUTTON_WIDTH = 16,
    COMBO_BUTTON_SPACING = 17,
};

pub const GuiDropdownBoxProperty = enum(c_uint) {
    ARROW_PADDING = 16,
    DROPDOWN_ITEMS_SPACING = 17,
};

pub const GuiTextBoxProperty = enum(c_uint) {
    TEXT_INNER_PADDING = 16,
    TEXT_LINES_SPACING = 17,
    TEXT_ALIGNMENT_VERTICAL = 18,
    TEXT_MULTILINE = 19,
    TEXT_WRAP_MODE = 20,
};

pub const GuiListViewProperty = enum(c_uint) {
    SPIN_BUTTON_WIDTH = 16,
    SPIN_BUTTON_SPACING = 17,
};
pub const GuiSpinnerProperty = enum(c_uint) {
    LIST_ITEMS_HEIGHT = 16,
    LIST_ITEMS_SPACING = 17,
    SCROLLBAR_WIDTH = 18,
    SCROLLBAR_SIDE = 19,
};

pub const GuiColorPickerProperty = enum(c_uint) {
    COLOR_SELECTOR_SIZE = 16,
    HUEBAR_WIDTH = 17,
    HUEBAR_PADDING = 18,
    HUEBAR_SELECTOR_HEIGHT = 19,
    HUEBAR_SELECTOR_OVERFLOW = 20,
};

pub const SCROLLBAR_LEFT_SIDE: c_int = 0;
pub const SCROLLBAR_RIGHT_SIDE: c_int = 1;

pub extern fn GuiEnable() void;
pub extern fn GuiDisable() void;
pub extern fn GuiLock() void;
pub extern fn GuiUnlock() void;
pub extern fn GuiIsLocked() bool;
pub extern fn GuiFade(alpha: f32) void;
pub extern fn GuiSetState(state: GuiState) void;
pub extern fn GuiGetState() c_int;
pub extern fn GuiSetFont(font: Font) void;
pub extern fn GuiGetFont() Font;
pub extern fn GuiSetStyle(control: GuiControl, property: c_int, value: c_int) void;
pub extern fn GuiGetStyle(control: GuiControl, property: c_int) c_int;
pub extern fn GuiLoadStyle(fileName: [*c]const u8) void;
pub extern fn GuiLoadStyleDefault() void;
pub extern fn GuiEnableTooltip() void;
pub extern fn GuiDisableTooltip() void;
pub extern fn GuiSetTooltip(tooltip: [*c]const u8) void;
pub extern fn GuiIconText(iconId: c_int, text: [*c]const u8) [*c]const u8;
pub extern fn GuiSetIconScale(scale: c_int) void;
pub extern fn GuiGetIcons() [*c]c_uint;
pub extern fn GuiLoadIcons(fileName: [*c]const u8, loadIconsName: bool) [*c][*c]u8;
pub extern fn GuiDrawIcon(iconId: c_int, posX: c_int, posY: c_int, pixelSize: c_int, color: Color) void;
pub extern fn GuiWindowBox(bounds: Rectangle, title: [*c]const u8) c_int;
pub extern fn GuiGroupBox(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiLine(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiPanel(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiTabBar(bounds: Rectangle, text: [*c][*c]const u8, count: c_int, active: [*c]c_int) c_int;
pub extern fn GuiScrollPanel(bounds: Rectangle, text: [*c]const u8, content: Rectangle, scroll: [*c]Vector2, view: [*c]Rectangle) c_int;
pub extern fn GuiLabel(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiButton(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiLabelButton(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiToggle(bounds: Rectangle, text: [*c]const u8, active: [*c]bool) c_int;
pub extern fn GuiToggleGroup(bounds: Rectangle, text: [*c]const u8, active: [*c]c_int) c_int;
pub extern fn GuiCheckBox(bounds: Rectangle, text: [*c]const u8, checked: [*c]bool) c_int;
pub extern fn GuiComboBox(bounds: Rectangle, text: [*c]const u8, active: [*c]c_int) c_int;
pub extern fn GuiDropdownBox(bounds: Rectangle, text: [*c]const u8, active: [*c]c_int, editMode: bool) c_int;
pub extern fn GuiSpinner(bounds: Rectangle, text: [*c]const u8, value: [*c]c_int, minValue: c_int, maxValue: c_int, editMode: bool) c_int;
pub extern fn GuiValueBox(bounds: Rectangle, text: [*c]const u8, value: [*c]c_int, minValue: c_int, maxValue: c_int, editMode: bool) c_int;
pub extern fn GuiTextBox(bounds: Rectangle, text: [*c]u8, textSize: c_int, editMode: bool) c_int;
pub extern fn GuiSlider(bounds: Rectangle, textLeft: [*c]const u8, textRight: [*c]const u8, value: [*c]f32, minValue: f32, maxValue: f32) c_int;
pub extern fn GuiSliderBar(bounds: Rectangle, textLeft: [*c]const u8, textRight: [*c]const u8, value: [*c]f32, minValue: f32, maxValue: f32) c_int;
pub extern fn GuiProgressBar(bounds: Rectangle, textLeft: [*c]const u8, textRight: [*c]const u8, value: [*c]f32, minValue: f32, maxValue: f32) c_int;
pub extern fn GuiStatusBar(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiDummyRec(bounds: Rectangle, text: [*c]const u8) c_int;
pub extern fn GuiGrid(bounds: Rectangle, text: [*c]const u8, spacing: f32, subdivs: c_int, mouseCell: [*c]Vector2) c_int;
pub extern fn GuiListView(bounds: Rectangle, text: [*c]const u8, scrollIndex: [*c]c_int, active: [*c]c_int) c_int;
pub extern fn GuiListViewEx(bounds: Rectangle, text: [*c][*c]const u8, count: c_int, scrollIndex: [*c]c_int, active: [*c]c_int, focus: [*c]c_int) c_int;
pub extern fn GuiMessageBox(bounds: Rectangle, title: [*c]const u8, message: [*c]const u8, buttons: [*c]const u8) c_int;
pub extern fn GuiTextInputBox(bounds: Rectangle, title: [*c]const u8, message: [*c]const u8, buttons: [*c]const u8, text: [*c]u8, textMaxSize: c_int, secretViewActive: [*c]bool) c_int;
pub extern fn GuiColorPicker(bounds: Rectangle, text: [*c]const u8, color: [*c]Color) c_int;
pub extern fn GuiColorPanel(bounds: Rectangle, text: [*c]const u8, color: [*c]Color) c_int;
pub extern fn GuiColorBarAlpha(bounds: Rectangle, text: [*c]const u8, alpha: [*c]f32) c_int;
pub extern fn GuiColorBarHue(bounds: Rectangle, text: [*c]const u8, value: [*c]f32) c_int;
