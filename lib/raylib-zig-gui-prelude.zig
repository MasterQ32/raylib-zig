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

pub const GuiState = enum(c_int) {
    STATE_NORMAL = 0,
    STATE_FOCUSED = 1,
    STATE_PRESSED = 2,
    STATE_DISABLED = 3,
};

pub const GuiTextAlignment = enum(c_int) {
    TEXT_ALIGN_LEFT = 0,
    TEXT_ALIGN_CENTER = 1,
    TEXT_ALIGN_RIGHT = 2,
};

pub const GuiControl = enum(c_int) {
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
pub const GuiControlProperty = enum(c_int) {
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
    _,
};

/// DEFAULT extended properties
/// NOTE: Those properties are common to all controls or global
pub const GuiDefaultProperty = enum(c_int) {
    TEXT_SIZE = 16,
    TEXT_SPACING = 17,
    LINE_COLOR = 18,
    BACKGROUND_COLOR = 19,
};

pub const GuiToggleProperty = enum(c_int) {
    GROUP_PADDING = 16,
};

pub const GuiSliderProperty = enum(c_int) {
    SLIDER_WIDTH = 16,
    SLIDER_PADDING = 17,
};

pub const GuiProgressBarProperty = enum(c_int) {
    PROGRESS_PADDING = 16,
};

pub const GuiScrollBarProperty = enum(c_int) {
    ARROWS_SIZE = 16,
    ARROWS_VISIBLE = 17,
    SCROLL_SLIDER_PADDING = 18,
    SCROLL_SLIDER_SIZE = 19,
    SCROLL_PADDING = 20,
    SCROLL_SPEED = 21,
};

pub const GuiCheckBoxProperty = enum(c_int) {
    CHECK_PADDING = 16,
};

pub const GuiComboBoxProperty = enum(c_int) {
    COMBO_BUTTON_WIDTH = 16,
    COMBO_BUTTON_SPACING = 17,
};

pub const GuiDropdownBoxProperty = enum(c_int) {
    ARROW_PADDING = 16,
    DROPDOWN_ITEMS_SPACING = 17,
};

pub const GuiTextBoxProperty = enum(c_int) {
    TEXT_INNER_PADDING = 16,
    TEXT_LINES_SPACING = 17,
    TEXT_ALIGNMENT_VERTICAL = 18,
    TEXT_MULTILINE = 19,
    TEXT_WRAP_MODE = 20,
};

pub const GuiListViewProperty = enum(c_int) {
    SPIN_BUTTON_WIDTH = 16,
    SPIN_BUTTON_SPACING = 17,
};
pub const GuiSpinnerProperty = enum(c_int) {
    LIST_ITEMS_HEIGHT = 16,
    LIST_ITEMS_SPACING = 17,
    SCROLLBAR_WIDTH = 18,
    SCROLLBAR_SIDE = 19,
};

pub const GuiColorPickerProperty = enum(c_int) {
    COLOR_SELECTOR_SIZE = 16,
    HUEBAR_WIDTH = 17,
    HUEBAR_PADDING = 18,
    HUEBAR_SELECTOR_HEIGHT = 19,
    HUEBAR_SELECTOR_OVERFLOW = 20,
};

pub const SCROLLBAR_LEFT_SIDE: c_int = 0;
pub const SCROLLBAR_RIGHT_SIDE: c_int = 1;
