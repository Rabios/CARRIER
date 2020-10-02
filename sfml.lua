local ffi = require("ffi")

if ffi.os == "Windows" then
  ffi.cdef([[
      // Window handle is HWND (HWND__*) on Windows
      struct HWND__;
      typedef struct HWND__* sfWindowHandle;  
  ]])
elseif ffi.os == "OSX" then
  ffi.cdef([[
      // Window handle is NSWindow (void*) on Mac OS X - Cocoa
	  typedef void* sfWindowHandle;
  ]])
elseif ffi.os == "Linux" or ffi.os == "FreeBSD" then
  ffi.cdef([[
      // Window handle is Window (unsigned long) on Unix - X11
      typedef unsigned long sfWindowHandle;
  ]])
end

ffi.cdef([[
////////////////////////////////////////////////////////////
//
// SFML - Simple and Fast Multimedia Library
// Copyright (C) 2007-2018 Laurent Gomila (laurent@sfml-dev.org)
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it freely,
// subject to the following restrictions:
//
// 1. The origin of this software must not be misrepresented;
//    you must not claim that you wrote the original software.
//    If you use this software in a product, an acknowledgment
//    in the product documentation would be appreciated but is not required.
//
// 2. Altered source versions must be plainly marked as such,
//    and must not be misrepresented as being the original software.
//
// 3. This notice may not be removed or altered from any source distribution.
//
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// Define the CSFML version
////////////////////////////////////////////////////////////
enum {
    CSFML_VERSION_MAJOR = 2,
    CSFML_VERSION_MINOR = 5,
    CSFML_VERSION_PATCH = 0,
};
////////////////////////////////////////////////////////////
// Define a portable boolean type
////////////////////////////////////////////////////////////
typedef int sfBool;
enum {
    sfFalse = 0,
    sfTrue  = 1,
};
////////////////////////////////////////////////////////////
// Define portable fixed-size types
////////////////////////////////////////////////////////////

// All "common" platforms use the same size for char, short and int
// (basically there are 3 types for 3 sizes, so no other match is possible),
// we can use them without doing any kind of check

// 8 bits integer types
typedef signed   char sfInt8;
typedef unsigned char sfUint8;

// 16 bits integer types
typedef signed   short sfInt16;
typedef unsigned short sfUint16;

// 32 bits integer types
typedef signed   int sfInt32;
typedef unsigned int sfUint32;

typedef signed   long long sfInt64;
typedef unsigned long long sfUint64;
    
typedef struct
{
    sfInt64 microseconds;
} sfTime;
sfTime sfTime_Zero;
float sfTime_asSeconds(sfTime time);
sfInt32 sfTime_asMilliseconds(sfTime time);
sfInt64 sfTime_asMicroseconds(sfTime time);
sfTime sfSeconds(float amount);
sfTime sfMilliseconds(sfInt32 amount);
sfTime sfMicroseconds(sfInt64 amount);

typedef struct sfClock sfClock;
typedef struct sfMutex sfMutex;
typedef struct sfThread sfThread;

sfClock* sfClock_create(void);
sfClock* sfClock_copy(const sfClock* clock);
void sfClock_destroy(sfClock* clock);
sfTime sfClock_getElapsedTime(const sfClock* clock);
sfTime sfClock_restart(sfClock* clock);

typedef sfInt64 (*sfInputStreamReadFunc)(void* data, sfInt64 size, void* userData);
typedef sfInt64 (*sfInputStreamSeekFunc)(sfInt64 position, void* userData);
typedef sfInt64 (*sfInputStreamTellFunc)(void* userData);
typedef sfInt64 (*sfInputStreamGetSizeFunc)(void* userData);

typedef struct sfInputStream
{
    sfInputStreamReadFunc    read;     // Function to read data from the stream
    sfInputStreamSeekFunc    seek;     // Function to set the current read position
    sfInputStreamTellFunc    tell;     // Function to get the current read position
    sfInputStreamGetSizeFunc getSize;  // Function to get the total number of bytes in the stream
    void*                    userData; // User data that will be passed to the callbacks
} sfInputStream;
sfMutex* sfMutex_create(void);
void sfMutex_destroy(sfMutex* mutex);
void sfMutex_lock(sfMutex* mutex);
void sfMutex_unlock(sfMutex* mutex);
void sfSleep(sfTime duration);
sfThread* sfThread_create(void (*function)(void*), void* userData);
void sfThread_destroy(sfThread* thread);
void sfThread_launch(sfThread* thread);
void sfThread_wait(sfThread* thread);
void sfThread_terminate(sfThread* thread);

typedef struct
{
    int x;
    int y;
} sfVector2i;

typedef struct
{
    unsigned int x;
    unsigned int y;
} sfVector2u;

typedef struct
{
    float x;
    float y;
} sfVector2f;

typedef struct
{
    float x;
    float y;
    float z;
} sfVector3f;

typedef struct sfContext sfContext;
typedef struct sfCursor sfCursor;
typedef struct sfWindow sfWindow;

const char* sfClipboard_getString();
const sfUint32* sfClipboard_getUnicodeString();
void sfClipboard_setString(const char* text);
void sfClipboard_setUnicodeString(const sfUint32* text);

typedef enum
{
    sfEvtClosed,                 // The window requested to be closed (no data)
    sfEvtResized,                // The window was resized (data in event.size)
    sfEvtLostFocus,              // The window lost the focus (no data)
    sfEvtGainedFocus,            // The window gained the focus (no data)
    sfEvtTextEntered,            // A character was entered (data in event.text)
    sfEvtKeyPressed,             // A key was pressed (data in event.key)
    sfEvtKeyReleased,            // A key was released (data in event.key)
    sfEvtMouseWheelMoved,        // The mouse wheel was scrolled (data in event.mouseWheel) (deprecated)
    sfEvtMouseWheelScrolled,     // The mouse wheel was scrolled (data in event.mouseWheelScroll)
    sfEvtMouseButtonPressed,     // A mouse button was pressed (data in event.mouseButton)
    sfEvtMouseButtonReleased,    // A mouse button was released (data in event.mouseButton)
    sfEvtMouseMoved,             // The mouse cursor moved (data in event.mouseMove)
    sfEvtMouseEntered,           // The mouse cursor entered the area of the window (no data)
    sfEvtMouseLeft,              // The mouse cursor left the area of the window (no data)
    sfEvtJoystickButtonPressed,  // A joystick button was pressed (data in event.joystickButton)
    sfEvtJoystickButtonReleased, // A joystick button was released (data in event.joystickButton)
    sfEvtJoystickMoved,          // The joystick moved along an axis (data in event.joystickMove)
    sfEvtJoystickConnected,      // A joystick was connected (data in event.joystickConnect)
    sfEvtJoystickDisconnected,   // A joystick was disconnected (data in event.joystickConnect)
    sfEvtTouchBegan,             // A touch event began (data in event.touch)
    sfEvtTouchMoved,             // A touch moved (data in event.touch)
    sfEvtTouchEnded,             // A touch event ended (data in event.touch)
    sfEvtSensorChanged,          // A sensor value changed (data in event.sensor)

    sfEvtCount,                  // Keep last -- the total number of event types
} sfEventType;

/*
typedef enum
{
    sfKeyUnknown = -1, // Unhandled key
    sfKeyA,            // The A key
    sfKeyB,            // The B key
    sfKeyC,            // The C key
    sfKeyD,            // The D key
    sfKeyE,            // The E key
    sfKeyF,            // The F key
    sfKeyG,            // The G key
    sfKeyH,            // The H key
    sfKeyI,            // The I key
    sfKeyJ,            // The J key
    sfKeyK,            // The K key
    sfKeyL,            // The L key
    sfKeyM,            // The M key
    sfKeyN,            // The N key
    sfKeyO,            // The O key
    sfKeyP,            // The P key
    sfKeyQ,            // The Q key
    sfKeyR,            // The R key
    sfKeyS,            // The S key
    sfKeyT,            // The T key
    sfKeyU,            // The U key
    sfKeyV,            // The V key
    sfKeyW,            // The W key
    sfKeyX,            // The X key
    sfKeyY,            // The Y key
    sfKeyZ,            // The Z key
    sfKeyNum0,         // The 0 key
    sfKeyNum1,         // The 1 key
    sfKeyNum2,         // The 2 key
    sfKeyNum3,         // The 3 key
    sfKeyNum4,         // The 4 key
    sfKeyNum5,         // The 5 key
    sfKeyNum6,         // The 6 key
    sfKeyNum7,         // The 7 key
    sfKeyNum8,         // The 8 key
    sfKeyNum9,         // The 9 key
    sfKeyEscape,       // The Escape key
    sfKeyLControl,     // The left Control key
    sfKeyLShift,       // The left Shift key
    sfKeyLAlt,         // The left Alt key
    sfKeyLSystem,      // The left OS specific key: window (Windows and Linux), apple (MacOS X), ...
    sfKeyRControl,     // The right Control key
    sfKeyRShift,       // The right Shift key
    sfKeyRAlt,         // The right Alt key
    sfKeyRSystem,      // The right OS specific key: window (Windows and Linux), apple (MacOS X), ...
    sfKeyMenu,         // The Menu key
    sfKeyLBracket,     // The [ key
    sfKeyRBracket,     // The ] key
    sfKeySemicolon,    // The ; key
    sfKeyComma,        // The , key
    sfKeyPeriod,       // The . key
    sfKeyQuote,        // The ' key
    sfKeySlash,        // The / key
    sfKeyBackslash,    // The \ key
    sfKeyTilde,        // The ~ key
    sfKeyEqual,        // The = key
    sfKeyHyphen,       // The - key (hyphen)
    sfKeySpace,        // The Space key
    sfKeyEnter,        // The Enter/Return key
    sfKeyBackspace,    // The Backspace key
    sfKeyTab,          // The Tabulation key
    sfKeyPageUp,       // The Page up key
    sfKeyPageDown,     // The Page down key
    sfKeyEnd,          // The End key
    sfKeyHome,         // The Home key
    sfKeyInsert,       // The Insert key
    sfKeyDelete,       // The Delete key
    sfKeyAdd,          // The + key
    sfKeySubtract,     // The - key (minus, usually from numpad)
    sfKeyMultiply,     // The * key
    sfKeyDivide,       // The / key
    sfKeyLeft,         // Left arrow
    sfKeyRight,        // Right arrow
    sfKeyUp,           // Up arrow
    sfKeyDown,         // Down arrow
    sfKeyNumpad0,      // The numpad 0 key
    sfKeyNumpad1,      // The numpad 1 key
    sfKeyNumpad2,      // The numpad 2 key
    sfKeyNumpad3,      // The numpad 3 key
    sfKeyNumpad4,      // The numpad 4 key
    sfKeyNumpad5,      // The numpad 5 key
    sfKeyNumpad6,      // The numpad 6 key
    sfKeyNumpad7,      // The numpad 7 key
    sfKeyNumpad8,      // The numpad 8 key
    sfKeyNumpad9,      // The numpad 9 key
    sfKeyF1,           // The F1 key
    sfKeyF2,           // The F2 key
    sfKeyF3,           // The F3 key
    sfKeyF4,           // The F4 key
    sfKeyF5,           // The F5 key
    sfKeyF6,           // The F6 key
    sfKeyF7,           // The F7 key
    sfKeyF8,           // The F8 key
    sfKeyF9,           // The F8 key
    sfKeyF10,          // The F10 key
    sfKeyF11,          // The F11 key
    sfKeyF12,          // The F12 key
    sfKeyF13,          // The F13 key
    sfKeyF14,          // The F14 key
    sfKeyF15,          // The F15 key
    sfKeyPause,        // The Pause key
    sfKeyCount,        // Keep last -- the total number of keyboard keys

    // Deprecated values:
    sfKeyDash      = sfKeyHyphen,       // deprecated Use Hyphen instead
    sfKeyBack      = sfKeyBackspace,    // deprecated Use Backspace instead
    sfKeyBackSlash = sfKeyBackslash,    // deprecated Use Backslash instead
    sfKeySemiColon = sfKeySemicolon,    // deprecated Use Semicolon instead
    sfKeyReturn    = sfKeyEnter,        // deprecated Use Enter instead
} sfKeyCode;

typedef struct
{
    sfEventType type;
    sfKeyCode   code;
    sfBool      alt;
    sfBool      control;
    sfBool      shift;
    sfBool      system;
} sfKeyEvent;

typedef struct
{
    sfEventType type;
    sfUint32    unicode;
} sfTextEvent;

typedef struct
{
    sfEventType type;
    int         x;
    int         y;
} sfMouseMoveEvent;

typedef enum
{
    sfMouseLeft,       // The left mouse button
    sfMouseRight,      // The right mouse button
    sfMouseMiddle,     // The middle (wheel) mouse button
    sfMouseXButton1,   // The first extra mouse button
    sfMouseXButton2,   // The second extra mouse button

    sfMouseButtonCount // Keep last -- the total number of mouse buttons
} sfMouseButton;

typedef struct
{
    sfEventType   type;
    sfMouseButton button;
    int           x;
    int           y;
} sfMouseButtonEvent;

typedef enum
{
    sfMouseVerticalWheel,  // The vertical mouse wheel
    sfMouseHorizontalWheel // The horizontal mouse wheel
} sfMouseWheel;

typedef struct
{
    sfEventType type;
    int         delta;
    int         x;
    int         y;
} sfMouseWheelEvent;

typedef struct
{
    sfEventType  type;
    sfMouseWheel wheel;
    float        delta;
    int          x;
    int          y;
} sfMouseWheelScrollEvent;

typedef enum
{
    sfJoystickX,    // The X axis
    sfJoystickY,    // The Y axis
    sfJoystickZ,    // The Z axis
    sfJoystickR,    // The R axis
    sfJoystickU,    // The U axis
    sfJoystickV,    // The V axis
    sfJoystickPovX, // The X axis of the point-of-view hat
    sfJoystickPovY  // The Y axis of the point-of-view hat
} sfJoystickAxis;

typedef struct
{
    sfEventType    type;
    unsigned int   joystickId;
    sfJoystickAxis axis;
    float          position;
} sfJoystickMoveEvent;

typedef struct
{
    sfEventType  type;
    unsigned int joystickId;
    unsigned int button;
} sfJoystickButtonEvent;

typedef struct
{
    sfEventType  type;
    unsigned int joystickId;
} sfJoystickConnectEvent;

typedef struct
{
    sfEventType  type;
    unsigned int width;
    unsigned int height;
} sfSizeEvent;

typedef struct
{
    sfEventType  type;
    unsigned int finger;
    int          x;
    int          y;
} sfTouchEvent;

typedef enum
{
    sfSensorAccelerometer,    // Measures the raw acceleration (m/s^2)
    sfSensorGyroscope,        // Measures the raw rotation rates (degrees/s)
    sfSensorMagnetometer,     // Measures the ambient magnetic field (micro-teslas)
    sfSensorGravity,          // Measures the direction and intensity of gravity, independent of device acceleration (m/s^2)
    sfSensorUserAcceleration, // Measures the direction and intensity of device acceleration, independent of the gravity (m/s^2)
    sfSensorOrientation,      // Measures the absolute 3D orientation (degrees)

    sfSensorCount             // Keep last -- the total number of sensor types
} sfSensorType;

typedef struct
{
    sfEventType  type;
    sfSensorType sensorType;
    float        x;
    float        y;
    float        z;
} sfSensorEvent;

typedef union
{
    sfEventType             type;             // Type of the event
    sfSizeEvent             size;             // Size event parameters
    sfKeyEvent              key;              // Key event parameters
    sfTextEvent             text;             // Text event parameters
    sfMouseMoveEvent        mouseMove;        // Mouse move event parameters
    sfMouseButtonEvent      mouseButton;      // Mouse button event parameters
    sfMouseWheelEvent       mouseWheel;       // Mouse wheel event parameters (deprecated)
    sfMouseWheelScrollEvent mouseWheelScroll; // Mouse wheel event parameters
    sfJoystickMoveEvent     joystickMove;     // Joystick move event parameters
    sfJoystickButtonEvent   joystickButton;   // Joystick button event parameters
    sfJoystickConnectEvent  joystickConnect;  // Joystick (dis)connect event parameters
    sfTouchEvent            touch;            // Touch events parameters
    sfSensorEvent           sensor;           // Sensor event parameters
} sfEvent;

typedef struct
{
    const char*  name;
    unsigned int vendorId;
    unsigned int productId;
} sfJoystickIdentification;

enum
{
    sfJoystickCount       = 8,  // Maximum number of supported joysticks
    sfJoystickButtonCount = 32, // Maximum number of supported buttons
    sfJoystickAxisCount   = 8   // Maximum number of supported axes
};

typedef struct
{
    unsigned int width;        // Video mode width, in pixels
    unsigned int height;       // Video mode height, in pixels
    unsigned int bitsPerPixel; // Video mode pixel depth, in bits per pixels
} sfVideoMode;

sfBool sfJoystick_isConnected(unsigned int joystick);
unsigned int sfJoystick_getButtonCount(unsigned int joystick);
sfBool sfJoystick_hasAxis(unsigned int joystick, sfJoystickAxis axis);
sfBool sfJoystick_isButtonPressed(unsigned int joystick, unsigned int button);
float sfJoystick_getAxisPosition(unsigned int joystick, sfJoystickAxis axis);
sfJoystickIdentification sfJoystick_getIdentification(unsigned int joystick);
void sfJoystick_update(void);

sfBool sfKeyboard_isKeyPressed(sfKeyCode key);
void sfKeyboard_setVirtualKeyboardVisible(sfBool visible);

sfBool sfMouse_isButtonPressed(sfMouseButton button);
sfVector2i sfMouse_getPosition(const sfWindow* relativeTo);
void sfMouse_setPosition(sfVector2i position, const sfWindow* relativeTo);

sfBool sfSensor_isAvailable(sfSensorType sensor);
void sfSensor_setEnabled(sfSensorType sensor, sfBool enabled);
sfVector3f sfSensor_getValue(sfSensorType sensor);

sfBool sfTouch_isDown(unsigned int finger);
sfVector2i sfTouch_getPosition(unsigned int finger, const sfWindow* relativeTo);

sfVideoMode sfVideoMode_getDesktopMode(void);
const sfVideoMode* sfVideoMode_getFullscreenModes(size_t* count);
sfBool sfVideoMode_isValid(sfVideoMode mode);

typedef enum
{
    sfCursorArrow,                  // Arrow cursor (default)
    sfCursorArrowWait,              // Busy arrow cursor
    sfCursorWait,                   // Busy cursor
    sfCursorText,                   // I-beam, cursor when hovering over a field allowing text entry
    sfCursorHand,                   // Pointing hand cursor
    sfCursorSizeHorizontal,         // Horizontal double arrow cursor
    sfCursorSizeVertical,           // Vertical double arrow cursor
    sfCursorSizeTopLeftBottomRight, // Double arrow cursor going from top-left to bottom-right
    sfCursorSizeBottomLeftTopRight, // Double arrow cursor going from bottom-left to top-right
    sfCursorSizeAll,                // Combination of SizeHorizontal and SizeVertical
    sfCursorCross,                  // Crosshair cursor
    sfCursorHelp,                   // Help cursor
    sfCursorNotAllowed              // Action not allowed cursor
} sfCursorType;

sfCursor* sfCursor_createFromPixels(const sfUint8* pixels, sfVector2u size, sfVector2u hotspot);
sfCursor* sfCursor_createFromSystem(sfCursorType type);
void sfCursor_destroy(sfCursor* cursor);

typedef struct
{
    unsigned int depthBits;         ///< Bits of the depth buffer
    unsigned int stencilBits;       ///< Bits of the stencil buffer
    unsigned int antialiasingLevel; ///< Level of antialiasing
    unsigned int majorVersion;      ///< Major number of the context version to create
    unsigned int minorVersion;      ///< Minor number of the context version to create
    sfUint32     attributeFlags;    ///< The attribute flags to create the context with
    sfBool       sRgbCapable;       ///< Whether the context framebuffer is sRGB capable
} sfContextSettings;

sfContext* sfContext_create(void);
void sfContext_destroy(sfContext* context);
sfBool sfContext_setActive(sfContext* context, sfBool active);
sfContextSettings sfContext_getSettings(const sfContext* context);
sfUint64 sfContext_getActiveContextId();

typedef enum
{
    sfNone         = 0,      ///< No border / title bar (this flag and all others are mutually exclusive)
    sfTitlebar     = 1 << 0, ///< Title bar + fixed border
    sfResize       = 1 << 1, ///< Titlebar + resizable border + maximize button
    sfClose        = 1 << 2, ///< Titlebar + close button
    sfFullscreen   = 1 << 3, ///< Fullscreen mode (this flag and all others are mutually exclusive)
    sfDefaultStyle = sfTitlebar | sfResize | sfClose ///< Default window style
} sfWindowStyle;

typedef enum
{
    sfContextDefault = 0,      ///< Non-debug, compatibility context (this and the core attribute are mutually exclusive)
    sfContextCore    = 1 << 0, ///< Core attribute
    sfContextDebug   = 1 << 2  ///< Debug attribute
} sfContextAttribute;

sfWindow* sfWindow_create(sfVideoMode mode, const char* title, sfUint32 style, const sfContextSettings* settings);
sfWindow* sfWindow_createUnicode(sfVideoMode mode, const sfUint32* title, sfUint32 style, const sfContextSettings* settings);
sfWindow* sfWindow_createFromHandle(sfWindowHandle handle, const sfContextSettings* settings);
void sfWindow_destroy(sfWindow* window);
void sfWindow_close(sfWindow* window);
sfBool sfWindow_isOpen(const sfWindow* window);
sfContextSettings sfWindow_getSettings(const sfWindow* window);
sfBool sfWindow_pollEvent(sfWindow* window, sfEvent* event);
sfBool sfWindow_waitEvent(sfWindow* window, sfEvent* event);
sfVector2i sfWindow_getPosition(const sfWindow* window);
void sfWindow_setPosition(sfWindow* window, sfVector2i position);
sfVector2u sfWindow_getSize(const sfWindow* window);
void sfWindow_setSize(sfWindow* window, sfVector2u size);
void sfWindow_setTitle(sfWindow* window, const char* title);
void sfWindow_setUnicodeTitle(sfWindow* window, const sfUint32* title);
void sfWindow_setIcon(sfWindow* window, unsigned int width, unsigned int height, const sfUint8* pixels);
void sfWindow_setVisible(sfWindow* window, sfBool visible);
void sfWindow_setVerticalSyncEnabled(sfWindow* window, sfBool enabled);
void sfWindow_setMouseCursorVisible(sfWindow* window, sfBool visible);
void sfWindow_setMouseCursorGrabbed(sfWindow* window, sfBool grabbed);
void sfWindow_setKeyRepeatEnabled(sfWindow* window, sfBool enabled);
void sfWindow_setFramerateLimit(sfWindow* window, unsigned int limit);
void sfWindow_setJoystickThreshold(sfWindow* window, float threshold);
sfBool sfWindow_setActive(sfWindow* window, sfBool active);
void sfWindow_requestFocus(sfWindow* window);
sfBool sfWindow_hasFocus(const sfWindow* window);
void sfWindow_display(sfWindow* window);
sfWindowHandle sfWindow_getSystemHandle(const sfWindow* window);

typedef enum
{
    sfBlendFactorZero,             // (0, 0, 0, 0)
    sfBlendFactorOne,              // (1, 1, 1, 1)
    sfBlendFactorSrcColor,         // (src.r, src.g, src.b, src.a)
    sfBlendFactorOneMinusSrcColor, // (1, 1, 1, 1) - (src.r, src.g, src.b, src.a)
    sfBlendFactorDstColor,         // (dst.r, dst.g, dst.b, dst.a)
    sfBlendFactorOneMinusDstColor, // (1, 1, 1, 1) - (dst.r, dst.g, dst.b, dst.a)
    sfBlendFactorSrcAlpha,         // (src.a, src.a, src.a, src.a)
    sfBlendFactorOneMinusSrcAlpha, // (1, 1, 1, 1) - (src.a, src.a, src.a, src.a)
    sfBlendFactorDstAlpha,         // (dst.a, dst.a, dst.a, dst.a)
    sfBlendFactorOneMinusDstAlpha  // (1, 1, 1, 1) - (dst.a, dst.a, dst.a, dst.a)
} sfBlendFactor;

typedef enum
{
    sfBlendEquationAdd,            // Pixel = Src * SrcFactor + Dst * DstFactor
    sfBlendEquationSubtract,       // Pixel = Src * SrcFactor - Dst * DstFactor
    sfBlendEquationReverseSubtract // Pixel = Dst * DstFactor - Src * SrcFactor
} sfBlendEquation;

typedef struct
{
    sfBlendFactor colorSrcFactor;  // Source blending factor for the color channels
    sfBlendFactor colorDstFactor;  // Destination blending factor for the color channels
    sfBlendEquation colorEquation; // Blending equation for the color channels
    sfBlendFactor alphaSrcFactor;  // Source blending factor for the alpha channel
    sfBlendFactor alphaDstFactor;  // Destination blending factor for the alpha channel
    sfBlendEquation alphaEquation; // Blending equation for the alpha channel
} sfBlendMode;


const sfBlendMode sfBlendAlpha;    // Blend source and dest according to dest alpha
const sfBlendMode sfBlendAdd;      // Add source to dest
const sfBlendMode sfBlendMultiply; // Multiply source and dest
const sfBlendMode sfBlendNone;     // Overwrite dest with source

typedef struct
{
    sfUint8 r;
    sfUint8 g;
    sfUint8 b;
    sfUint8 a;
} sfColor;

sfColor sfBlack;       // Black predefined color
sfColor sfWhite;       // White predefined color
sfColor sfRed;         // Red predefined color
sfColor sfGreen;       // Green predefined color
sfColor sfBlue;        // Blue predefined color
sfColor sfYellow;      // Yellow predefined color
sfColor sfMagenta;     // Magenta predefined color
sfColor sfCyan;        // Cyan predefined color
sfColor sfTransparent; // Transparent (black) predefined color

sfColor sfColor_fromRGB(sfUint8 red, sfUint8 green, sfUint8 blue);
sfColor sfColor_fromRGBA(sfUint8 red, sfUint8 green, sfUint8 blue, sfUint8 alpha);
sfColor sfColor_fromInteger(sfUint32 color);
sfUint32 sfColor_toInteger(sfColor color);
sfColor sfColor_add(sfColor color1, sfColor color2);
sfColor sfColor_subtract(sfColor color1, sfColor color2);
sfColor sfColor_modulate(sfColor color1, sfColor color2);

typedef struct
{
    float left;
    float top;
    float width;
    float height;
} sfFloatRect;

typedef struct
{
    int left;
    int top;
    int width;
    int height;
} sfIntRect;
sfBool sfFloatRect_contains(const sfFloatRect* rect, float x, float y);
sfBool sfIntRect_contains(const sfIntRect* rect, int x, int y);
sfBool sfFloatRect_intersects(const sfFloatRect* rect1, const sfFloatRect* rect2, sfFloatRect* intersection);
sfBool sfIntRect_intersects(const sfIntRect* rect1, const sfIntRect* rect2, sfIntRect* intersection);

typedef struct
{
    float matrix[9];
} sfTransform;
const sfTransform sfTransform_Identity;
sfTransform sfTransform_fromMatrix(float a00, float a01, float a02,
                                                      float a10, float a11, float a12,
                                                      float a20, float a21, float a22);
void sfTransform_getMatrix(const sfTransform* transform, float* matrix);
sfTransform sfTransform_getInverse(const sfTransform* transform);
sfVector2f sfTransform_transformPoint(const sfTransform* transform, sfVector2f point);
sfFloatRect sfTransform_transformRect(const sfTransform* transform, sfFloatRect rectangle);
void sfTransform_combine(sfTransform* transform, const sfTransform* other);
void sfTransform_translate(sfTransform* transform, float x, float y);
void sfTransform_rotate(sfTransform* transform, float angle);
void sfTransform_rotateWithCenter(sfTransform* transform, float angle, float centerX, float centerY);
void sfTransform_scale(sfTransform* transform, float scaleX, float scaleY);
void sfTransform_scaleWithCenter(sfTransform* transform, float scaleX, float scaleY, float centerX, float centerY);
sfBool sfTransform_equal(sfTransform* left, sfTransform* right);

typedef struct sfCircleShape sfCircleShape;
typedef struct sfConvexShape sfConvexShape;
typedef struct sfFont sfFont;
typedef struct sfImage sfImage;
typedef struct sfShader sfShader;
typedef struct sfRectangleShape sfRectangleShape;
typedef struct sfRenderTexture sfRenderTexture;
typedef struct sfRenderWindow sfRenderWindow;
typedef struct sfShape sfShape;
typedef struct sfSprite sfSprite;
typedef struct sfText sfText;
typedef struct sfTexture sfTexture;
typedef struct sfTransformable sfTransformable;
typedef struct sfVertexArray sfVertexArray;
typedef struct sfVertexBuffer sfVertexBuffer;
typedef struct sfView sfView;

sfCircleShape* sfCircleShape_create(void);
sfCircleShape* sfCircleShape_copy(const sfCircleShape* shape);
void sfCircleShape_destroy(sfCircleShape* shape);
void sfCircleShape_setPosition(sfCircleShape* shape, sfVector2f position);
void sfCircleShape_setRotation(sfCircleShape* shape, float angle);
void sfCircleShape_setScale(sfCircleShape* shape, sfVector2f scale);
void sfCircleShape_setOrigin(sfCircleShape* shape, sfVector2f origin);
sfVector2f sfCircleShape_getPosition(const sfCircleShape* shape);
float sfCircleShape_getRotation(const sfCircleShape* shape);
sfVector2f sfCircleShape_getScale(const sfCircleShape* shape);
sfVector2f sfCircleShape_getOrigin(const sfCircleShape* shape);
void sfCircleShape_move(sfCircleShape* shape, sfVector2f offset);
void sfCircleShape_rotate(sfCircleShape* shape, float angle);
void sfCircleShape_scale(sfCircleShape* shape, sfVector2f factors);
sfTransform sfCircleShape_getTransform(const sfCircleShape* shape);
sfTransform sfCircleShape_getInverseTransform(const sfCircleShape* shape);
void sfCircleShape_setTexture(sfCircleShape* shape, const sfTexture* texture, sfBool resetRect);
void sfCircleShape_setTextureRect(sfCircleShape* shape, sfIntRect rect);
void sfCircleShape_setFillColor(sfCircleShape* shape, sfColor color);
void sfCircleShape_setOutlineColor(sfCircleShape* shape, sfColor color);
void sfCircleShape_setOutlineThickness(sfCircleShape* shape, float thickness);
const sfTexture* sfCircleShape_getTexture(const sfCircleShape* shape);
sfIntRect sfCircleShape_getTextureRect(const sfCircleShape* shape);
sfColor sfCircleShape_getFillColor(const sfCircleShape* shape);
sfColor sfCircleShape_getOutlineColor(const sfCircleShape* shape);
float sfCircleShape_getOutlineThickness(const sfCircleShape* shape);
size_t sfCircleShape_getPointCount(const sfCircleShape* shape);
sfVector2f sfCircleShape_getPoint(const sfCircleShape* shape, size_t index);
void sfCircleShape_setRadius(sfCircleShape* shape, float radius);
float sfCircleShape_getRadius(const sfCircleShape* shape);
void sfCircleShape_setPointCount(sfCircleShape* shape, size_t count);
sfFloatRect sfCircleShape_getLocalBounds(const sfCircleShape* shape);
sfFloatRect sfCircleShape_getGlobalBounds(const sfCircleShape* shape);

sfConvexShape* sfConvexShape_create(void);
sfConvexShape* sfConvexShape_copy(const sfConvexShape* shape);
void sfConvexShape_destroy(sfConvexShape* shape);
void sfConvexShape_setPosition(sfConvexShape* shape, sfVector2f position);
void sfConvexShape_setRotation(sfConvexShape* shape, float angle);
void sfConvexShape_setScale(sfConvexShape* shape, sfVector2f scale);
void sfConvexShape_setOrigin(sfConvexShape* shape, sfVector2f origin);
sfVector2f sfConvexShape_getPosition(const sfConvexShape* shape);
float sfConvexShape_getRotation(const sfConvexShape* shape);
sfVector2f sfConvexShape_getScale(const sfConvexShape* shape);
sfVector2f sfConvexShape_getOrigin(const sfConvexShape* shape);
void sfConvexShape_move(sfConvexShape* shape, sfVector2f offset);
void sfConvexShape_rotate(sfConvexShape* shape, float angle);
void sfConvexShape_scale(sfConvexShape* shape, sfVector2f factors);
sfTransform sfConvexShape_getTransform(const sfConvexShape* shape);
sfTransform sfConvexShape_getInverseTransform(const sfConvexShape* shape);
void sfConvexShape_setTexture(sfConvexShape* shape, const sfTexture* texture, sfBool resetRect);
void sfConvexShape_setTextureRect(sfConvexShape* shape, sfIntRect rect);
void sfConvexShape_setFillColor(sfConvexShape* shape, sfColor color);
void sfConvexShape_setOutlineColor(sfConvexShape* shape, sfColor color);
void sfConvexShape_setOutlineThickness(sfConvexShape* shape, float thickness);
const sfTexture* sfConvexShape_getTexture(const sfConvexShape* shape);
sfIntRect sfConvexShape_getTextureRect(const sfConvexShape* shape);
sfColor sfConvexShape_getFillColor(const sfConvexShape* shape);
sfColor sfConvexShape_getOutlineColor(const sfConvexShape* shape);
float sfConvexShape_getOutlineThickness(const sfConvexShape* shape);
size_t sfConvexShape_getPointCount(const sfConvexShape* shape);
sfVector2f sfConvexShape_getPoint(const sfConvexShape* shape, size_t index);
void sfConvexShape_setPointCount(sfConvexShape* shape, size_t count);
void sfConvexShape_setPoint(sfConvexShape* shape, size_t index, sfVector2f point);
sfFloatRect sfConvexShape_getLocalBounds(const sfConvexShape* shape);
sfFloatRect sfConvexShape_getGlobalBounds(const sfConvexShape* shape);

typedef struct
{
    const char* family;
} sfFontInfo;

typedef struct
{
    float       advance;     // Offset to move horizontically to the next character
    sfFloatRect bounds;      // Bounding rectangle of the glyph, in coordinates relative to the baseline
    sfIntRect   textureRect; // Texture coordinates of the glyph inside the font's image
} sfGlyph;

sfFont* sfFont_createFromFile(const char* filename);
sfFont* sfFont_createFromMemory(const void* data, size_t sizeInBytes);
sfFont* sfFont_createFromStream(sfInputStream* stream);
sfFont* sfFont_copy(const sfFont* font);
void sfFont_destroy(sfFont* font);
sfGlyph sfFont_getGlyph(const sfFont* font, sfUint32 codePoint, unsigned int characterSize, sfBool bold, float outlineThickness);
float sfFont_getKerning(const sfFont* font, sfUint32 first, sfUint32 second, unsigned int characterSize);
float sfFont_getLineSpacing(const sfFont* font, unsigned int characterSize);
float sfFont_getUnderlinePosition(const sfFont* font, unsigned int characterSize);
float sfFont_getUnderlineThickness(const sfFont* font, unsigned int characterSize);
const sfTexture* sfFont_getTexture(sfFont* font, unsigned int characterSize);
sfFontInfo sfFont_getInfo(const sfFont* font);

typedef sfVector2f sfGlslVec2;
typedef sfVector2i sfGlslIvec2;

typedef struct
{
    sfBool x;
    sfBool y;
} sfGlslBvec2;

typedef sfVector3f sfGlslVec3;

typedef struct
{
    int x;
    int y;
    int z;
} sfGlslIvec3;

typedef struct
{
    sfBool x;
    sfBool y;
    sfBool z;
} sfGlslBvec3;

typedef struct
{
    float x;
    float y;
    float z;
    float w;
} sfGlslVec4;

typedef struct
{
    int x;
    int y;
    int z;
    int w;
} sfGlslIvec4;

typedef struct
{
    sfBool x;
    sfBool y;
    sfBool z;
    sfBool w;
} sfGlslBvec4;

typedef struct
{
    float array[3 * 3];
} sfGlslMat3;

typedef struct
{
    float array[4 * 4];
} sfGlslMat4;

sfImage* sfImage_create(unsigned int width, unsigned int height);
sfImage* sfImage_createFromColor(unsigned int width, unsigned int height, sfColor color);
sfImage* sfImage_createFromPixels(unsigned int width, unsigned int height, const sfUint8* pixels);
sfImage* sfImage_createFromFile(const char* filename);
sfImage* sfImage_createFromMemory(const void* data, size_t size);
sfImage* sfImage_createFromStream(sfInputStream* stream);
sfImage* sfImage_copy(const sfImage* image);
void sfImage_destroy(sfImage* image);
sfBool sfImage_saveToFile(const sfImage* image, const char* filename);
sfVector2u sfImage_getSize(const sfImage* image);
void sfImage_createMaskFromColor(sfImage* image, sfColor color, sfUint8 alpha);
void sfImage_copyImage(sfImage* image, const sfImage* source, unsigned int destX, unsigned int destY, sfIntRect sourceRect, sfBool applyAlpha);
void sfImage_setPixel(sfImage* image, unsigned int x, unsigned int y, sfColor color);
sfColor sfImage_getPixel(const sfImage* image, unsigned int x, unsigned int y);
const sfUint8* sfImage_getPixelsPtr(const sfImage* image);
void sfImage_flipHorizontally(sfImage* image);
void sfImage_flipVertically(sfImage* image);

typedef enum
{
    sfPoints,        // List of individual points
    sfLines,         // List of individual lines
    sfLineStrip,     // List of connected lines, a point uses the previous point to form a line
    sfTriangles,     // List of individual triangles
    sfTriangleStrip, // List of connected triangles, a point uses the two previous points to form a triangle
    sfTriangleFan,   // List of connected triangles, a point uses the common center and the previous point to form a triangle
    sfQuads,         // List of individual quads

    sfLinesStrip     = sfLineStrip,     // deprecated Use sfLineStrip instead
    sfTrianglesStrip = sfTriangleStrip, // deprecated Use sfTriangleStrip instead
    sfTrianglesFan   = sfTriangleFan    // deprecated Use sfTriangleFan instead
} sfPrimitiveType;
sfRectangleShape* sfRectangleShape_create(void);
sfRectangleShape* sfRectangleShape_copy(const sfRectangleShape* shape);
void sfRectangleShape_destroy(sfRectangleShape* shape);
void sfRectangleShape_setPosition(sfRectangleShape* shape, sfVector2f position);
void sfRectangleShape_setRotation(sfRectangleShape* shape, float angle);
void sfRectangleShape_setScale(sfRectangleShape* shape, sfVector2f scale);
void sfRectangleShape_setOrigin(sfRectangleShape* shape, sfVector2f origin);
sfVector2f sfRectangleShape_getPosition(const sfRectangleShape* shape);
float sfRectangleShape_getRotation(const sfRectangleShape* shape);
sfVector2f sfRectangleShape_getScale(const sfRectangleShape* shape);
sfVector2f sfRectangleShape_getOrigin(const sfRectangleShape* shape);
void sfRectangleShape_move(sfRectangleShape* shape, sfVector2f offset);
void sfRectangleShape_rotate(sfRectangleShape* shape, float angle);
void sfRectangleShape_scale(sfRectangleShape* shape, sfVector2f factors);
sfTransform sfRectangleShape_getTransform(const sfRectangleShape* shape);
sfTransform sfRectangleShape_getInverseTransform(const sfRectangleShape* shape);
void sfRectangleShape_setTexture(sfRectangleShape* shape, const sfTexture* texture, sfBool resetRect);
void sfRectangleShape_setTextureRect(sfRectangleShape* shape, sfIntRect rect);
void sfRectangleShape_setFillColor(sfRectangleShape* shape, sfColor color);
void sfRectangleShape_setOutlineColor(sfRectangleShape* shape, sfColor color);
void sfRectangleShape_setOutlineThickness(sfRectangleShape* shape, float thickness);
const sfTexture* sfRectangleShape_getTexture(const sfRectangleShape* shape);
sfIntRect sfRectangleShape_getTextureRect(const sfRectangleShape* shape);
sfColor sfRectangleShape_getFillColor(const sfRectangleShape* shape);
sfColor sfRectangleShape_getOutlineColor(const sfRectangleShape* shape);
float sfRectangleShape_getOutlineThickness(const sfRectangleShape* shape);
size_t sfRectangleShape_getPointCount(const sfRectangleShape* shape);
sfVector2f sfRectangleShape_getPoint(const sfRectangleShape* shape, size_t index);
void sfRectangleShape_setSize(sfRectangleShape* shape, sfVector2f size);
sfVector2f sfRectangleShape_getSize(const sfRectangleShape* shape);
sfFloatRect sfRectangleShape_getLocalBounds(const sfRectangleShape* shape);
sfFloatRect sfRectangleShape_getGlobalBounds(const sfRectangleShape* shape);

typedef struct
{
    sfBlendMode      blendMode; // Blending mode
    sfTransform      transform; // Transform
    const sfTexture* texture;   // Texture
    const sfShader*  shader;    // Shader
} sfRenderStates;

typedef struct
{
    sfVector2f position;  // Position of the vertex
    sfColor    color;     // Color of the vertex
    sfVector2f texCoords; // Coordinates of the texture's pixel to map to the vertex
} sfVertex;

sfVertexArray* sfVertexArray_create(void);
sfVertexArray* sfVertexArray_copy(const sfVertexArray* vertexArray);
void sfVertexArray_destroy(sfVertexArray* vertexArray);
size_t sfVertexArray_getVertexCount(const sfVertexArray* vertexArray);
sfVertex* sfVertexArray_getVertex(sfVertexArray* vertexArray, size_t index);
void sfVertexArray_clear(sfVertexArray* vertexArray);
void sfVertexArray_resize(sfVertexArray* vertexArray, size_t vertexCount);
void sfVertexArray_append(sfVertexArray* vertexArray, sfVertex vertex);
void sfVertexArray_setPrimitiveType(sfVertexArray* vertexArray, sfPrimitiveType type);
sfPrimitiveType sfVertexArray_getPrimitiveType(sfVertexArray* vertexArray)
sfFloatRect sfVertexArray_getBounds(sfVertexArray* vertexArray);

typedef enum
{
    sfVertexBufferStream,  // Constantly changing data
    sfVertexBufferDynamic, // Occasionally changing data
    sfVertexBufferStatic   // Rarely changing data
} sfVertexBufferUsage;
sfVertexBuffer* sfVertexBuffer_create(unsigned int vertexCount, sfPrimitiveType type, sfVertexBufferUsage usage);
sfVertexBuffer* sfVertexBuffer_copy(const sfVertexBuffer* vertexBuffer);
void sfVertexBuffer_destroy(sfVertexBuffer* vertexBuffer);
unsigned int sfVertexBuffer_getVertexCount(const sfVertexBuffer* vertexBuffer);
sfBool sfVertexBuffer_update(sfVertexBuffer* vertexBuffer, const sfVertex* vertices, unsigned int vertexCount, unsigned int offset);
sfBool sfVertexBuffer_updateFromVertexBuffer(sfVertexBuffer* vertexBuffer, const sfVertexBuffer* other);
void sfVertexBuffer_swap(sfVertexBuffer* left, sfVertexBuffer* right);
unsigned int sfVertexBuffer_getNativeHandle(sfVertexBuffer* vertexBuffer);
void sfVertexBuffer_setPrimitiveType(sfVertexBuffer* vertexBuffer, sfPrimitiveType type);
sfPrimitiveType sfVertexBuffer_getPrimitiveType(const sfVertexBuffer* vertexBuffer);
void sfVertexBuffer_setUsage(sfVertexBuffer* vertexBuffer, sfVertexBufferUsage usage);
sfVertexBufferUsage sfVertexBuffer_getUsage(const sfVertexBuffer* vertexBuffer);
void sfVertexBuffer_bind(const sfVertexBuffer* vertexBuffer);
sfBool sfVertexBuffer_isAvailable();

sfRenderTexture* sfRenderTexture_create(unsigned int width, unsigned int height, sfBool depthBuffer);
sfRenderTexture* sfRenderTexture_createWithSettings(unsigned int width, unsigned int height, const sfContextSettings* settings);
void sfRenderTexture_destroy(sfRenderTexture* renderTexture);
sfVector2u sfRenderTexture_getSize(const sfRenderTexture* renderTexture);
sfBool sfRenderTexture_setActive(sfRenderTexture* renderTexture, sfBool active);
void sfRenderTexture_display(sfRenderTexture* renderTexture);
void sfRenderTexture_clear(sfRenderTexture* renderTexture, sfColor color);
void sfRenderTexture_setView(sfRenderTexture* renderTexture, const sfView* view);
const sfView* sfRenderTexture_getView(const sfRenderTexture* renderTexture);
const sfView* sfRenderTexture_getDefaultView(const sfRenderTexture* renderTexture);
sfIntRect sfRenderTexture_getViewport(const sfRenderTexture* renderTexture, const sfView* view);
sfVector2f sfRenderTexture_mapPixelToCoords(const sfRenderTexture* renderTexture, sfVector2i point, const sfView* view);
sfVector2i sfRenderTexture_mapCoordsToPixel(const sfRenderTexture* renderTexture, sfVector2f point, const sfView* view);
void sfRenderTexture_drawSprite(sfRenderTexture* renderTexture, const sfSprite* object, const sfRenderStates* states);
void sfRenderTexture_drawText(sfRenderTexture* renderTexture, const sfText* object, const sfRenderStates* states);
void sfRenderTexture_drawShape(sfRenderTexture* renderTexture, const sfShape* object, const sfRenderStates* states);
void sfRenderTexture_drawCircleShape(sfRenderTexture* renderTexture, const sfCircleShape* object, const sfRenderStates* states);
void sfRenderTexture_drawConvexShape(sfRenderTexture* renderTexture, const sfConvexShape* object, const sfRenderStates* states);
void sfRenderTexture_drawRectangleShape(sfRenderTexture* renderTexture, const sfRectangleShape* object, const sfRenderStates* states);
void sfRenderTexture_drawVertexArray(sfRenderTexture* renderTexture, const sfVertexArray* object, const sfRenderStates* states);
void sfRenderTexture_drawVertexBuffer(sfRenderTexture* renderTexture, const sfVertexBuffer* object, const sfRenderStates* states);

void sfRenderTexture_drawPrimitives(sfRenderTexture* renderTexture,
                                                       const sfVertex* vertices, size_t vertexCount,
                                                       sfPrimitiveType type, const sfRenderStates* states);
void sfRenderTexture_pushGLStates(sfRenderTexture* renderTexture);
void sfRenderTexture_popGLStates(sfRenderTexture* renderTexture);
void sfRenderTexture_resetGLStates(sfRenderTexture* renderTexture);
const sfTexture* sfRenderTexture_getTexture(const sfRenderTexture* renderTexture);
unsigned int sfRenderTexture_getMaximumAntialiasingLevel();
void sfRenderTexture_setSmooth(sfRenderTexture* renderTexture, sfBool smooth);
sfBool sfRenderTexture_isSmooth(const sfRenderTexture* renderTexture);
void sfRenderTexture_setRepeated(sfRenderTexture* renderTexture, sfBool repeated);
sfBool sfRenderTexture_isRepeated(const sfRenderTexture* renderTexture);
sfBool sfRenderTexture_generateMipmap(sfRenderTexture* renderTexture);

sfRenderWindow* sfRenderWindow_create(sfVideoMode mode, const char* title, sfUint32 style, const sfContextSettings* settings);
sfRenderWindow* sfRenderWindow_createUnicode(sfVideoMode mode, const sfUint32* title, sfUint32 style, const sfContextSettings* settings);
sfRenderWindow* sfRenderWindow_createFromHandle(sfWindowHandle handle, const sfContextSettings* settings);
void sfRenderWindow_destroy(sfRenderWindow* renderWindow);
void sfRenderWindow_close(sfRenderWindow* renderWindow);
sfBool sfRenderWindow_isOpen(const sfRenderWindow* renderWindow);
sfContextSettings sfRenderWindow_getSettings(const sfRenderWindow* renderWindow);
sfBool sfRenderWindow_pollEvent(sfRenderWindow* renderWindow, sfEvent* event);
sfBool sfRenderWindow_waitEvent(sfRenderWindow* renderWindow, sfEvent* event);
sfVector2i sfRenderWindow_getPosition(const sfRenderWindow* renderWindow);
void sfRenderWindow_setPosition(sfRenderWindow* renderWindow, sfVector2i position);
sfVector2u sfRenderWindow_getSize(const sfRenderWindow* renderWindow);
void sfRenderWindow_setSize(sfRenderWindow* renderWindow, sfVector2u size);
void sfRenderWindow_setTitle(sfRenderWindow* renderWindow, const char* title);
void sfRenderWindow_setUnicodeTitle(sfRenderWindow* renderWindow, const sfUint32* title);
void sfRenderWindow_setIcon(sfRenderWindow* renderWindow, unsigned int width, unsigned int height, const sfUint8* pixels);
void sfRenderWindow_setVisible(sfRenderWindow* renderWindow, sfBool visible);
void sfRenderWindow_setVerticalSyncEnabled(sfRenderWindow* renderWindow, sfBool enabled)
void sfRenderWindow_setMouseCursorVisible(sfRenderWindow* renderWindow, sfBool show);
void sfRenderWindow_setMouseCursorGrabbed(sfRenderWindow* renderWindow, sfBool grabbed);
void sfRenderWindow_setMouseCursor(sfRenderWindow* window, const sfCursor* cursor);
void sfRenderWindow_setKeyRepeatEnabled(sfRenderWindow* renderWindow, sfBool enabled);
void sfRenderWindow_setFramerateLimit(sfRenderWindow* renderWindow, unsigned int limit);
void sfRenderWindow_setJoystickThreshold(sfRenderWindow* renderWindow, float threshold);
sfBool sfRenderWindow_setActive(sfRenderWindow* renderWindow, sfBool active);
void sfRenderWindow_requestFocus(sfRenderWindow* renderWindow);
sfBool sfRenderWindow_hasFocus(const sfRenderWindow* renderWindow);
void sfRenderWindow_display(sfRenderWindow* renderWindow);
sfWindowHandle sfRenderWindow_getSystemHandle(const sfRenderWindow* renderWindow);
void sfRenderWindow_clear(sfRenderWindow* renderWindow, sfColor color);
void sfRenderWindow_setView(sfRenderWindow* renderWindow, const sfView* view);
const sfView* sfRenderWindow_getView(const sfRenderWindow* renderWindow);
const sfView* sfRenderWindow_getDefaultView(const sfRenderWindow* renderWindow);
sfIntRect sfRenderWindow_getViewport(const sfRenderWindow* renderWindow, const sfView* view);
sfVector2f sfRenderWindow_mapPixelToCoords(const sfRenderWindow* renderWindow, sfVector2i point, const sfView* view);
sfVector2i sfRenderWindow_mapCoordsToPixel(const sfRenderWindow* renderWindow, sfVector2f point, const sfView* view);
void sfRenderWindow_drawSprite(sfRenderWindow* renderWindow, const sfSprite* object, const sfRenderStates* states);
void sfRenderWindow_drawText(sfRenderWindow* renderWindow, const sfText* object, const sfRenderStates* states);
void sfRenderWindow_drawShape(sfRenderWindow* renderWindow, const sfShape* object, const sfRenderStates* states);
void sfRenderWindow_drawCircleShape(sfRenderWindow* renderWindow, const sfCircleShape* object, const sfRenderStates* states);
void sfRenderWindow_drawConvexShape(sfRenderWindow* renderWindow, const sfConvexShape* object, const sfRenderStates* states);
void sfRenderWindow_drawRectangleShape(sfRenderWindow* renderWindow, const sfRectangleShape* object, const sfRenderStates* states);
void sfRenderWindow_drawVertexArray(sfRenderWindow* renderWindow, const sfVertexArray* object, const sfRenderStates* states);
void sfRenderWindow_drawVertexBuffer(sfRenderWindow* renderWindow, const sfVertexBuffer* object, const sfRenderStates* states);
void sfRenderWindow_drawPrimitives(sfRenderWindow* renderWindow,
                                                      const sfVertex* vertices, size_t vertexCount,
                                                      sfPrimitiveType type, const sfRenderStates* states);
void sfRenderWindow_pushGLStates(sfRenderWindow* renderWindow);
void sfRenderWindow_popGLStates(sfRenderWindow* renderWindow);
void sfRenderWindow_resetGLStates(sfRenderWindow* renderWindow);
sfImage* sfRenderWindow_capture(const sfRenderWindow* renderWindow);
sfVector2i sfMouse_getPositionRenderWindow(const sfRenderWindow* relativeTo);
void sfMouse_setPositionRenderWindow(sfVector2i position, const sfRenderWindow* relativeTo);
sfVector2i sfTouch_getPositionRenderWindow(unsigned int finger, const sfRenderWindow* relativeTo);

sfShader* sfShader_createFromFile(const char* vertexShaderFilename, const char* geometryShaderFilename, const char* fragmentShaderFilename);
sfShader* sfShader_createFromMemory(const char* vertexShader, const char* geometryShader, const char* fragmentShader);
sfShader* sfShader_createFromStream(sfInputStream* vertexShaderStream, sfInputStream* geometryShaderStream, sfInputStream* fragmentShaderStream);
void sfShader_destroy(sfShader* shader);
void sfShader_setFloatUniform(sfShader* shader, const char* name, float x);
void sfShader_setVec2Uniform(sfShader* shader, const char* name, sfGlslVec2 vector);
void sfShader_setVec3Uniform(sfShader* shader, const char* name, sfGlslVec3 vector);
void sfShader_setVec4Uniform(sfShader* shader, const char* name, sfGlslVec4 vector);
void sfShader_setColorUniform(sfShader* shader, const char* name, sfColor color);
void sfShader_setIntUniform(sfShader* shader, const char* name, int x);
void sfShader_setIvec2Uniform(sfShader* shader, const char* name, sfGlslIvec2 vector);
void sfShader_setIvec3Uniform(sfShader* shader, const char* name, sfGlslIvec3 vector);
void sfShader_setIvec4Uniform(sfShader* shader, const char* name, sfGlslIvec4 vector);
void sfShader_setIntColorUniform(sfShader* shader, const char* name, sfColor color);
void sfShader_setBoolUniform(sfShader* shader, const char* name, sfBool x);
void sfShader_setBvec2Uniform(sfShader* shader, const char* name, sfGlslBvec2 vector);
void sfShader_setBvec3Uniform(sfShader* shader, const char* name, sfGlslBvec3 vector);
void sfShader_setBvec4Uniform(sfShader* shader, const char* name, sfGlslBvec4 vector);
void sfShader_setMat3Uniform(sfShader* shader, const char* name, const sfGlslMat3* matrix);
void sfShader_setMat4Uniform(sfShader* shader, const char* name, const sfGlslMat4* matrix);
void sfShader_setTextureUniform(sfShader* shader, const char* name, const sfTexture* texture);
void sfShader_setCurrentTextureUniform(sfShader* shader, const char* name);
void sfShader_setFloatUniformArray(sfShader* shader, const char* name, const float* scalarArray, size_t length);
void sfShader_setVec2UniformArray(sfShader* shader, const char* name, const sfGlslVec2* vectorArray, size_t length);
void sfShader_setVec3UniformArray(sfShader* shader, const char* name, const sfGlslVec3* vectorArray, size_t length);
void sfShader_setVec4UniformArray(sfShader* shader, const char* name, const sfGlslVec4* vectorArray, size_t length);
void sfShader_setMat3UniformArray(sfShader* shader, const char* name, const sfGlslMat3* matrixArray, size_t length);
void sfShader_setMat4UniformArray(sfShader* shader, const char* name, const sfGlslMat4* matrixArray, size_t length);
void sfShader_setFloatParameter(sfShader* shader, const char* name, float x);
void sfShader_setFloat2Parameter(sfShader* shader, const char* name, float x, float y);
void sfShader_setFloat3Parameter(sfShader* shader, const char* name, float x, float y, float z);
void sfShader_setFloat4Parameter(sfShader* shader, const char* name, float x, float y, float z, float w);
void sfShader_setVector2Parameter(sfShader* shader, const char* name, sfVector2f vector);
void sfShader_setVector3Parameter(sfShader* shader, const char* name, sfVector3f vector);
void sfShader_setColorParameter(sfShader* shader, const char* name, sfColor color);
void sfShader_setTransformParameter(sfShader* shader, const char* name, sfTransform transform);
void sfShader_setTextureParameter(sfShader* shader, const char* name, const sfTexture* texture);
void sfShader_setCurrentTextureParameter(sfShader* shader, const char* name);
unsigned int sfShader_getNativeHandle(const sfShader* shader);
void sfShader_bind(const sfShader* shader);
sfBool sfShader_isAvailable(void);
sfBool sfShader_isGeometryAvailable(void);

typedef size_t (*sfShapeGetPointCountCallback)(void*);        // Type of the callback used to get the number of points in a shape
typedef sfVector2f (*sfShapeGetPointCallback)(size_t, void*); // Type of the callback used to get a point of a shape
sfShape* sfShape_create(sfShapeGetPointCountCallback getPointCount,
                                           sfShapeGetPointCallback getPoint,
                                           void* userData);
void sfShape_destroy(sfShape* shape);
void sfShape_setPosition(sfShape* shape, sfVector2f position);
void sfShape_setRotation(sfShape* shape, float angle);
void sfShape_setScale(sfShape* shape, sfVector2f scale);
void sfShape_setOrigin(sfShape* shape, sfVector2f origin);
sfVector2f sfShape_getPosition(const sfShape* shape);
float sfShape_getRotation(const sfShape* shape);
sfVector2f sfShape_getScale(const sfShape* shape);
sfVector2f sfShape_getOrigin(const sfShape* shape);
void sfShape_move(sfShape* shape, sfVector2f offset);
void sfShape_rotate(sfShape* shape, float angle);
void sfShape_scale(sfShape* shape, sfVector2f factors);
sfTransform sfShape_getTransform(const sfShape* shape);
sfTransform sfShape_getInverseTransform(const sfShape* shape);
void sfShape_setTexture(sfShape* shape, const sfTexture* texture, sfBool resetRect);
void sfShape_setTextureRect(sfShape* shape, sfIntRect rect);
void sfShape_setFillColor(sfShape* shape, sfColor color);
void sfShape_setOutlineColor(sfShape* shape, sfColor color);
void sfShape_setOutlineThickness(sfShape* shape, float thickness);
const sfTexture* sfShape_getTexture(const sfShape* shape);
sfIntRect sfShape_getTextureRect(const sfShape* shape);
sfColor sfShape_getFillColor(const sfShape* shape);
sfColor sfShape_getOutlineColor(const sfShape* shape);
float sfShape_getOutlineThickness(const sfShape* shape);
size_t sfShape_getPointCount(const sfShape* shape);
sfVector2f sfShape_getPoint(const sfShape* shape, size_t index);
sfFloatRect sfShape_getLocalBounds(const sfShape* shape);
sfFloatRect sfShape_getGlobalBounds(const sfShape* shape);
void sfShape_update(sfShape* shape);

sfSprite* sfSprite_create(void);
sfSprite* sfSprite_copy(const sfSprite* sprite);
void sfSprite_destroy(sfSprite* sprite);
void sfSprite_setPosition(sfSprite* sprite, sfVector2f position);
void sfSprite_setRotation(sfSprite* sprite, float angle);
void sfSprite_setScale(sfSprite* sprite, sfVector2f scale);
void sfSprite_setOrigin(sfSprite* sprite, sfVector2f origin);
sfVector2f sfSprite_getPosition(const sfSprite* sprite);
float sfSprite_getRotation(const sfSprite* sprite);
sfVector2f sfSprite_getScale(const sfSprite* sprite);
sfVector2f sfSprite_getOrigin(const sfSprite* sprite);
void sfSprite_move(sfSprite* sprite, sfVector2f offset);
void sfSprite_rotate(sfSprite* sprite, float angle);
void sfSprite_scale(sfSprite* sprite, sfVector2f factors);
sfTransform sfSprite_getTransform(const sfSprite* sprite);
sfTransform sfSprite_getInverseTransform(const sfSprite* sprite);
void sfSprite_setTexture(sfSprite* sprite, const sfTexture* texture, sfBool resetRect);
void sfSprite_setTextureRect(sfSprite* sprite, sfIntRect rectangle);
void sfSprite_setColor(sfSprite* sprite, sfColor color);
const sfTexture* sfSprite_getTexture(const sfSprite* sprite);
sfIntRect sfSprite_getTextureRect(const sfSprite* sprite);
sfColor sfSprite_getColor(const sfSprite* sprite);
sfFloatRect sfSprite_getLocalBounds(const sfSprite* sprite);
sfFloatRect sfSprite_getGlobalBounds(const sfSprite* sprite);

typedef enum
{
    sfTextRegular       = 0,      // Regular characters, no style
    sfTextBold          = 1 << 0, // Bold characters
    sfTextItalic        = 1 << 1, // Italic characters
    sfTextUnderlined    = 1 << 2, // Underlined characters
    sfTextStrikeThrough = 1 << 3  // Strike through characters
} sfTextStyle;
sfText* sfText_create(void);
sfText* sfText_copy(const sfText* text);
void sfText_destroy(sfText* text);
void sfText_setPosition(sfText* text, sfVector2f position);
void sfText_setRotation(sfText* text, float angle);
void sfText_setScale(sfText* text, sfVector2f scale);
void sfText_setOrigin(sfText* text, sfVector2f origin);
sfVector2f sfText_getPosition(const sfText* text);
float sfText_getRotation(const sfText* text);
sfVector2f sfText_getScale(const sfText* text);
sfVector2f sfText_getOrigin(const sfText* text);
void sfText_move(sfText* text, sfVector2f offset);
void sfText_rotate(sfText* text, float angle);
void sfText_scale(sfText* text, sfVector2f factors);
sfTransform sfText_getTransform(const sfText* text);
sfTransform sfText_getInverseTransform(const sfText* text);
void sfText_setString(sfText* text, const char* string);
void sfText_setUnicodeString(sfText* text, const sfUint32* string);
void sfText_setFont(sfText* text, const sfFont* font);
void sfText_setCharacterSize(sfText* text, unsigned int size);
void sfText_setLineSpacing(sfText* text, float spacingFactor);
void sfText_setLetterSpacing(sfText* text, float spacingFactor);
void sfText_setStyle(sfText* text, sfUint32 style);
void sfText_setColor(sfText* text, sfColor color);
void sfText_setFillColor(sfText* text, sfColor color);
void sfText_setOutlineColor(sfText* text, sfColor color);
void sfText_setOutlineThickness(sfText* text, float thickness);
const char* sfText_getString(const sfText* text);
const sfUint32* sfText_getUnicodeString(const sfText* text);
const sfFont* sfText_getFont(const sfText* text);
unsigned int sfText_getCharacterSize(const sfText* text);
float sfText_getLetterSpacing(const sfText* text);
float sfText_getLineSpacing(const sfText* text);
sfUint32 sfText_getStyle(const sfText* text);
sfColor sfText_getColor(const sfText* text);
sfColor sfText_getFillColor(const sfText* text);
sfColor sfText_getOutlineColor(const sfText* text);
float sfText_getOutlineThickness(const sfText* text);
sfVector2f sfText_findCharacterPos(const sfText* text, size_t index);
sfFloatRect sfText_getLocalBounds(const sfText* text);
sfFloatRect sfText_getGlobalBounds(const sfText* text);

sfTexture* sfTexture_create(unsigned int width, unsigned int height);
sfTexture* sfTexture_createFromFile(const char* filename, const sfIntRect* area);
sfTexture* sfTexture_createFromMemory(const void* data, size_t sizeInBytes, const sfIntRect* area);
sfTexture* sfTexture_createFromStream(sfInputStream* stream, const sfIntRect* area);
sfTexture* sfTexture_createFromImage(const sfImage* image, const sfIntRect* area);
sfTexture* sfTexture_copy(const sfTexture* texture);
void sfTexture_destroy(sfTexture* texture);
sfVector2u sfTexture_getSize(const sfTexture* texture);
sfImage* sfTexture_copyToImage(const sfTexture* texture);
void sfTexture_updateFromPixels(sfTexture* texture, const sfUint8* pixels, unsigned int width, unsigned int height, unsigned int x, unsigned int y);
void sfTexture_updateFromTexture(sfTexture* destination, const sfTexture* source, unsigned int x, unsigned int y);
void sfTexture_updateFromImage(sfTexture* texture, const sfImage* image, unsigned int x, unsigned int y);
void sfTexture_updateFromWindow(sfTexture* texture, const sfWindow* window, unsigned int x, unsigned int y);
void sfTexture_updateFromRenderWindow(sfTexture* texture, const sfRenderWindow* renderWindow, unsigned int x, unsigned int y);
void sfTexture_setSmooth(sfTexture* texture, sfBool smooth);
sfBool sfTexture_isSmooth(const sfTexture* texture);
void sfTexture_setSrgb(sfTexture* texture, sfBool sRgb);
sfBool sfTexture_isSrgb(const sfTexture* texture);
void sfTexture_setRepeated(sfTexture* texture, sfBool repeated);
sfBool sfTexture_isRepeated(const sfTexture* texture);
sfBool sfTexture_generateMipmap(sfTexture* texture);
void sfTexture_swap(sfTexture* left, sfTexture* right);
unsigned int sfTexture_getNativeHandle(const sfTexture* texture);
void sfTexture_bind(const sfTexture* texture);
unsigned int sfTexture_getMaximumSize();

sfTransformable* sfTransformable_create(void);
sfTransformable* sfTransformable_copy(const sfTransformable* transformable);
void sfTransformable_destroy(sfTransformable* transformable);
void sfTransformable_setPosition(sfTransformable* transformable, sfVector2f position);
void sfTransformable_setRotation(sfTransformable* transformable, float angle);
void sfTransformable_setScale(sfTransformable* transformable, sfVector2f scale);
void sfTransformable_setOrigin(sfTransformable* transformable, sfVector2f origin);
sfVector2f sfTransformable_getPosition(const sfTransformable* transformable);
float sfTransformable_getRotation(const sfTransformable* transformable);
sfVector2f sfTransformable_getScale(const sfTransformable* transformable);
sfVector2f sfTransformable_getOrigin(const sfTransformable* transformable);
void sfTransformable_move(sfTransformable* transformable, sfVector2f offset);
void sfTransformable_rotate(sfTransformable* transformable, float angle);
void sfTransformable_scale(sfTransformable* transformable, sfVector2f factors);
sfTransform sfTransformable_getTransform(const sfTransformable* transformable);
sfTransform sfTransformable_getInverseTransform(const sfTransformable* transformable);

sfView* sfView_create(void);
sfView* sfView_createFromRect(sfFloatRect rectangle);
sfView* sfView_copy(const sfView* view);
void sfView_destroy(sfView* view);
void sfView_setCenter(sfView* view, sfVector2f center);
void sfView_setSize(sfView* view, sfVector2f size);
void sfView_setRotation(sfView* view, float angle);
void sfView_setViewport(sfView* view, sfFloatRect viewport);
void sfView_reset(sfView* view, sfFloatRect rectangle);
sfVector2f sfView_getCenter(const sfView* view);
sfVector2f sfView_getSize(const sfView* view);
float sfView_getRotation(const sfView* view);
sfFloatRect sfView_getViewport(const sfView* view);
void sfView_move(sfView* view, sfVector2f offset);
void sfView_rotate(sfView* view, float angle);
void sfView_zoom(sfView* view, float factor);

typedef enum
{
    sfStopped, // Sound / music is not playing
    sfPaused,  // Sound / music is paused
    sfPlaying  // Sound / music is playing
} sfSoundStatus;

typedef struct sfMusic sfMusic;
typedef struct sfSound sfSound;
typedef struct sfSoundBuffer sfSoundBuffer;
typedef struct sfSoundBufferRecorder sfSoundBufferRecorder;
typedef struct sfSoundRecorder sfSoundRecorder;
typedef struct sfSoundStream sfSoundStream;

void sfListener_setGlobalVolume(float volume);
float sfListener_getGlobalVolume(void);
void sfListener_setPosition(sfVector3f position);
sfVector3f sfListener_getPosition();
void sfListener_setDirection(sfVector3f direction);
sfVector3f sfListener_getDirection();
void sfListener_setUpVector(sfVector3f upVector);
sfVector3f sfListener_getUpVector();

typedef struct
{
    sfTime offset; // The beginning offset of the time range
    sfTime length; // The length of the time range
} sfTimeSpan;

sfMusic* sfMusic_createFromFile(const char* filename);
sfMusic* sfMusic_createFromMemory(const void* data, size_t sizeInBytes);
sfMusic* sfMusic_createFromStream(sfInputStream* stream);
void sfMusic_destroy(sfMusic* music);
void sfMusic_setLoop(sfMusic* music, sfBool loop);
sfBool sfMusic_getLoop(const sfMusic* music);
sfTime sfMusic_getDuration(const sfMusic* music);
sfTimeSpan sfMusic_getLoopPoints(const sfMusic* music);
void sfMusic_setLoopPoints(sfMusic* music, sfTimeSpan timePoints);
void sfMusic_play(sfMusic* music);
void sfMusic_pause(sfMusic* music);
void sfMusic_stop(sfMusic* music);
unsigned int sfMusic_getChannelCount(const sfMusic* music);
unsigned int sfMusic_getSampleRate(const sfMusic* music);
sfSoundStatus sfMusic_getStatus(const sfMusic* music);
sfTime sfMusic_getPlayingOffset(const sfMusic* music);
void sfMusic_setPitch(sfMusic* music, float pitch);
void sfMusic_setVolume(sfMusic* music, float volume);
void sfMusic_setPosition(sfMusic* music, sfVector3f position);
void sfMusic_setRelativeToListener(sfMusic* music, sfBool relative);
void sfMusic_setMinDistance(sfMusic* music, float distance);
void sfMusic_setAttenuation(sfMusic* music, float attenuation);
void sfMusic_setPlayingOffset(sfMusic* music, sfTime timeOffset);
float sfMusic_getPitch(const sfMusic* music);
float sfMusic_getVolume(const sfMusic* music);
sfVector3f sfMusic_getPosition(const sfMusic* music);
sfBool sfMusic_isRelativeToListener(const sfMusic* music);
float sfMusic_getMinDistance(const sfMusic* music);
float sfMusic_getAttenuation(const sfMusic* music);

sfSound* sfSound_create(void);
sfSound* sfSound_copy(const sfSound* sound);
void sfSound_destroy(sfSound* sound);
void sfSound_play(sfSound* sound);
void sfSound_pause(sfSound* sound);
void sfSound_stop(sfSound* sound);
void sfSound_setBuffer(sfSound* sound, const sfSoundBuffer* buffer);
const sfSoundBuffer* sfSound_getBuffer(const sfSound* sound);
void sfSound_setLoop(sfSound* sound, sfBool loop);
sfBool sfSound_getLoop(const sfSound* sound);
sfSoundStatus sfSound_getStatus(const sfSound* sound);
void sfSound_setPitch(sfSound* sound, float pitch);
void sfSound_setVolume(sfSound* sound, float volume);
void sfSound_setPosition(sfSound* sound, sfVector3f position);
void sfSound_setRelativeToListener(sfSound* sound, sfBool relative);
void sfSound_setMinDistance(sfSound* sound, float distance);
void sfSound_setAttenuation(sfSound* sound, float attenuation);
void sfSound_setPlayingOffset(sfSound* sound, sfTime timeOffset);
float sfSound_getPitch(const sfSound* sound);
float sfSound_getVolume(const sfSound* sound);
sfVector3f sfSound_getPosition(const sfSound* sound);
sfBool sfSound_isRelativeToListener(const sfSound* sound);
float sfSound_getMinDistance(const sfSound* sound);
float sfSound_getAttenuation(const sfSound* sound);
sfTime sfSound_getPlayingOffset(const sfSound* sound);

sfSoundBuffer* sfSoundBuffer_createFromFile(const char* filename);
sfSoundBuffer* sfSoundBuffer_createFromMemory(const void* data, size_t sizeInBytes);
sfSoundBuffer* sfSoundBuffer_createFromStream(sfInputStream* stream);
sfSoundBuffer* sfSoundBuffer_createFromSamples(const sfInt16* samples, sfUint64 sampleCount, unsigned int channelCount, unsigned int sampleRate);
sfSoundBuffer* sfSoundBuffer_copy(const sfSoundBuffer* soundBuffer);
void sfSoundBuffer_destroy(sfSoundBuffer* soundBuffer);
sfBool sfSoundBuffer_saveToFile(const sfSoundBuffer* soundBuffer, const char* filename);
const sfInt16* sfSoundBuffer_getSamples(const sfSoundBuffer* soundBuffer);
sfUint64 sfSoundBuffer_getSampleCount(const sfSoundBuffer* soundBuffer);
unsigned int sfSoundBuffer_getSampleRate(const sfSoundBuffer* soundBuffer);
unsigned int sfSoundBuffer_getChannelCount(const sfSoundBuffer* soundBuffer);
sfTime sfSoundBuffer_getDuration(const sfSoundBuffer* soundBuffer);

sfSoundBufferRecorder* sfSoundBufferRecorder_create(void);
void sfSoundBufferRecorder_destroy(sfSoundBufferRecorder* soundBufferRecorder);
sfBool sfSoundBufferRecorder_start(sfSoundBufferRecorder* soundBufferRecorder, unsigned int sampleRate);
void sfSoundBufferRecorder_stop(sfSoundBufferRecorder* soundBufferRecorder);
unsigned int sfSoundBufferRecorder_getSampleRate(const sfSoundBufferRecorder* soundBufferRecorder);
const sfSoundBuffer* sfSoundBufferRecorder_getBuffer(const sfSoundBufferRecorder* soundBufferRecorder);
sfBool sfSoundBufferRecorder_setDevice(sfSoundBufferRecorder* soundBufferRecorder, const char* name);
const char* sfSoundBufferRecorder_getDevice(sfSoundBufferRecorder* soundBufferRecorder);

typedef sfBool (*sfSoundRecorderStartCallback)(void*);                           // Type of the callback used when starting a capture
typedef sfBool (*sfSoundRecorderProcessCallback)(const sfInt16*, size_t, void*); // Type of the callback used to process audio data
typedef void   (*sfSoundRecorderStopCallback)(void*);                            // Type of the callback used when stopping a capture

sfSoundRecorder* sfSoundRecorder_create(sfSoundRecorderStartCallback   onStart,
                                                        sfSoundRecorderProcessCallback onProcess,
                                                        sfSoundRecorderStopCallback    onStop,
                                                        void*                          userData);
void sfSoundRecorder_destroy(sfSoundRecorder* soundRecorder);
sfBool sfSoundRecorder_start(sfSoundRecorder* soundRecorder, unsigned int sampleRate);
void sfSoundRecorder_stop(sfSoundRecorder* soundRecorder);
unsigned int sfSoundRecorder_getSampleRate(const sfSoundRecorder* soundRecorder);
sfBool sfSoundRecorder_isAvailable(void);
void sfSoundRecorder_setProcessingInterval(sfSoundRecorder* soundRecorder, sfTime interval);
const char** sfSoundRecorder_getAvailableDevices(size_t* count);
const char* sfSoundRecorder_getDefaultDevice();
sfBool sfSoundRecorder_setDevice(sfSoundRecorder* soundRecorder, const char* name);
const char* sfSoundRecorder_getDevice(sfSoundRecorder* soundRecorder);
void sfSoundRecorder_setChannelCount(sfSoundRecorder* soundRecorder, unsigned int channelCount);
unsigned int sfSoundRecorder_getChannelCount(const sfSoundRecorder* soundRecorder);

typedef struct
{
    sfInt16*     samples;     // Pointer to the audio samples
    unsigned int sampleCount; // Number of samples pointed by Samples
} sfSoundStreamChunk;

typedef sfBool (*sfSoundStreamGetDataCallback)(sfSoundStreamChunk*, void*); // Type of the callback used to get a sound stream data
typedef void   (*sfSoundStreamSeekCallback)(sfTime, void*);                 // Type of the callback used to seek in a sound stream

sfSoundStream* sfSoundStream_create(sfSoundStreamGetDataCallback onGetData,
                                              sfSoundStreamSeekCallback    onSeek,
                                              unsigned int                 channelCount,
                                              unsigned int                 sampleRate,
                                              void*                        userData);
void sfSoundStream_destroy(sfSoundStream* soundStream);
void sfSoundStream_play(sfSoundStream* soundStream);
void sfSoundStream_pause(sfSoundStream* soundStream);
void sfSoundStream_stop(sfSoundStream* soundStream);
sfSoundStatus sfSoundStream_getStatus(const sfSoundStream* soundStream);
unsigned int sfSoundStream_getChannelCount(const sfSoundStream* soundStream);
unsigned int sfSoundStream_getSampleRate(const sfSoundStream* soundStream);
void sfSoundStream_setPitch(sfSoundStream* soundStream, float pitch);
void sfSoundStream_setVolume(sfSoundStream* soundStream, float volume);
void sfSoundStream_setPosition(sfSoundStream* soundStream, sfVector3f position);
void sfSoundStream_setRelativeToListener(sfSoundStream* soundStream, sfBool relative);
void sfSoundStream_setMinDistance(sfSoundStream* soundStream, float distance);
void sfSoundStream_setAttenuation(sfSoundStream* soundStream, float attenuation);
void sfSoundStream_setPlayingOffset(sfSoundStream* soundStream, sfTime timeOffset);
void sfSoundStream_setLoop(sfSoundStream* soundStream, sfBool loop);
float sfSoundStream_getPitch(const sfSoundStream* soundStream);
float sfSoundStream_getVolume(const sfSoundStream* soundStream);
sfVector3f sfSoundStream_getPosition(const sfSoundStream* soundStream);
sfBool sfSoundStream_isRelativeToListener(const sfSoundStream* soundStream);
float sfSoundStream_getMinDistance(const sfSoundStream* soundStream);
float sfSoundStream_getAttenuation(const sfSoundStream* soundStream);
sfBool sfSoundStream_getLoop(const sfSoundStream* soundStream);
sfTime sfSoundStream_getPlayingOffset(const sfSoundStream* soundStream);

typedef struct sfFtpDirectoryResponse sfFtpDirectoryResponse;
typedef struct sfFtpListingResponse sfFtpListingResponse;
typedef struct sfFtpResponse sfFtpResponse;
typedef struct sfFtp sfFtp;
typedef struct sfHttpRequest sfHttpRequest;
typedef struct sfHttpResponse sfHttpResponse;
typedef struct sfHttp sfHttp;
typedef struct sfPacket sfPacket;
typedef struct sfSocketSelector sfSocketSelector;
typedef struct sfTcpListener sfTcpListener;
typedef struct sfTcpSocket sfTcpSocket;
typedef struct sfUdpSocket sfUdpSocket;

typedef struct
{
    char address[16];
} sfIpAddress;


const sfIpAddress sfIpAddress_None;
const sfIpAddress sfIpAddress_Any;
const sfIpAddress sfIpAddress_LocalHost;
const sfIpAddress sfIpAddress_Broadcast;
sfIpAddress sfIpAddress_fromString(const char* address);
sfIpAddress sfIpAddress_fromBytes(sfUint8 byte0, sfUint8 byte1, sfUint8 byte2, sfUint8 byte3);
sfIpAddress sfIpAddress_fromInteger(sfUint32 address);
void sfIpAddress_toString(sfIpAddress address, char* string);
sfUint32 sfIpAddress_toInteger(sfIpAddress address);
sfIpAddress sfIpAddress_getLocalAddress(void);
sfIpAddress sfIpAddress_getPublicAddress(sfTime timeout);

typedef enum
{
    sfFtpBinary, // Binary mode (file is transfered as a sequence of bytes)
    sfFtpAscii,  // Text mode using ASCII encoding
    sfFtpEbcdic  // Text mode using EBCDIC encoding
} sfFtpTransferMode;

typedef enum
{
    // 1xx: the requested action is being initiated,
    // expect another reply before proceeding with a new command
    sfFtpRestartMarkerReply          = 110, // Restart marker reply
    sfFtpServiceReadySoon            = 120, // Service ready in N minutes
    sfFtpDataConnectionAlreadyOpened = 125, // Data connection already opened, transfer starting
    sfFtpOpeningDataConnection       = 150, // File status ok, about to open data connection

    // 2xx: the requested action has been successfully completed
    sfFtpOk                    = 200, // Command ok
    sfFtpPointlessCommand      = 202, // Command not implemented
    sfFtpSystemStatus          = 211, // System status, or system help reply
    sfFtpDirectoryStatus       = 212, // Directory status
    sfFtpFileStatus            = 213, // File status
    sfFtpHelpMessage           = 214, // Help message
    sfFtpSystemType            = 215, // NAME system type, where NAME is an official system name from the list in the Assigned Numbers document
    sfFtpServiceReady          = 220, // Service ready for new user
    sfFtpClosingConnection     = 221, // Service closing control connection
    sfFtpDataConnectionOpened  = 225, // Data connection open, no transfer in progress
    sfFtpClosingDataConnection = 226, // Closing data connection, requested file action successful
    sfFtpEnteringPassiveMode   = 227, // Entering passive mode
    sfFtpLoggedIn              = 230, // User logged in, proceed. Logged out if appropriate
    sfFtpFileActionOk          = 250, // Requested file action ok
    sfFtpDirectoryOk           = 257, // PATHNAME created

    // 3xx: the command has been accepted, but the requested action
    // is dormant, pending receipt of further information
    sfFtpNeedPassword       = 331, // User name ok, need password
    sfFtpNeedAccountToLogIn = 332, // Need account for login
    sfFtpNeedInformation    = 350, // Requested file action pending further information

    // 4xx: the command was not accepted and the requested action did not take place,
    // but the error condition is temporary and the action may be requested again
    sfFtpServiceUnavailable        = 421, // Service not available, closing control connection
    sfFtpDataConnectionUnavailable = 425, // Can't open data connection
    sfFtpTransferAborted           = 426, // Connection closed, transfer aborted
    sfFtpFileActionAborted         = 450, // Requested file action not taken
    sfFtpLocalError                = 451, // Requested action aborted, local error in processing
    sfFtpInsufficientStorageSpace  = 452, // Requested action not taken; insufficient storage space in system, file unavailable

    // 5xx: the command was not accepted and
    // the requested action did not take place
    sfFtpCommandUnknown          = 500, // Syntax error, command unrecognized
    sfFtpParametersUnknown       = 501, // Syntax error in parameters or arguments
    sfFtpCommandNotImplemented   = 502, // Command not implemented
    sfFtpBadCommandSequence      = 503, // Bad sequence of commands
    sfFtpParameterNotImplemented = 504, // Command not implemented for that parameter
    sfFtpNotLoggedIn             = 530, // Not logged in
    sfFtpNeedAccountToStore      = 532, // Need account for storing files
    sfFtpFileUnavailable         = 550, // Requested action not taken, file unavailable
    sfFtpPageTypeUnknown         = 551, // Requested action aborted, page type unknown
    sfFtpNotEnoughMemory         = 552, // Requested file action aborted, exceeded storage allocation
    sfFtpFilenameNotAllowed      = 553, // Requested action not taken, file name not allowed

    // 10xx: SFML custom codes
    sfFtpInvalidResponse  = 1000, // Response is not a valid FTP one
    sfFtpConnectionFailed = 1001, // Connection with server failed
    sfFtpConnectionClosed = 1002, // Connection with server closed
    sfFtpInvalidFile      = 1003  // Invalid file to upload / download
} sfFtpStatus;

typedef enum
{
    sfSocketDone,         // The socket has sent / received the data
    sfSocketNotReady,     // The socket is not ready to send / receive data yet
    sfSocketPartial,      // The socket sent a part of the data
    sfSocketDisconnected, // The TCP socket has been disconnected
    sfSocketError         // An unexpected error happened

} sfSocketStatus;

void sfFtpListingResponse_destroy(sfFtpListingResponse* ftpListingResponse);
sfBool sfFtpListingResponse_isOk(const sfFtpListingResponse* ftpListingResponse);
sfFtpStatus sfFtpListingResponse_getStatus(const sfFtpListingResponse* ftpListingResponse);
const char* sfFtpListingResponse_getMessage(const sfFtpListingResponse* ftpListingResponse);
size_t sfFtpListingResponse_getCount(const sfFtpListingResponse* ftpListingResponse);
const char* sfFtpListingResponse_getName(const sfFtpListingResponse* ftpListingResponse, size_t index);
void sfFtpDirectoryResponse_destroy(sfFtpDirectoryResponse* ftpDirectoryResponse);
sfBool sfFtpDirectoryResponse_isOk(const sfFtpDirectoryResponse* ftpDirectoryResponse);
sfFtpStatus sfFtpDirectoryResponse_getStatus(const sfFtpDirectoryResponse* ftpDirectoryResponse);
const char* sfFtpDirectoryResponse_getMessage(const sfFtpDirectoryResponse* ftpDirectoryResponse);
const char* sfFtpDirectoryResponse_getDirectory(const sfFtpDirectoryResponse* ftpDirectoryResponse);
void sfFtpResponse_destroy(sfFtpResponse* ftpResponse);
sfBool sfFtpResponse_isOk(const sfFtpResponse* ftpResponse);
sfFtpStatus sfFtpResponse_getStatus(const sfFtpResponse* ftpResponse);
const char* sfFtpResponse_getMessage(const sfFtpResponse* ftpResponse);
sfFtp* sfFtp_create(void);
void sfFtp_destroy(sfFtp* ftp);
sfFtpResponse* sfFtp_connect(sfFtp* ftp, sfIpAddress server, unsigned short port, sfTime timeout);
sfFtpResponse* sfFtp_loginAnonymous(sfFtp* ftp);
sfFtpResponse* sfFtp_login(sfFtp* ftp, const char* name, const char* password);
sfFtpResponse* sfFtp_disconnect(sfFtp* ftp);
sfFtpResponse* sfFtp_keepAlive(sfFtp* ftp);
sfFtpDirectoryResponse* sfFtp_getWorkingDirectory(sfFtp* ftp);
sfFtpListingResponse* sfFtp_getDirectoryListing(sfFtp* ftp, const char* directory);
sfFtpResponse* sfFtp_changeDirectory(sfFtp* ftp, const char* directory);
sfFtpResponse* sfFtp_parentDirectory(sfFtp* ftp);
sfFtpResponse* sfFtp_createDirectory(sfFtp* ftp, const char* name);
sfFtpResponse* sfFtp_deleteDirectory(sfFtp* ftp, const char* name);
sfFtpResponse* sfFtp_renameFile(sfFtp* ftp, const char* file, const char* newName);
sfFtpResponse* sfFtp_deleteFile(sfFtp* ftp, const char* name);
sfFtpResponse* sfFtp_download(sfFtp* ftp, const char* remoteFile, const char* localPath, sfFtpTransferMode mode);
sfFtpResponse* sfFtp_upload(sfFtp* ftp, const char* localFile, const char* remotePath, sfFtpTransferMode mode, sfBool append);
sfFtpResponse* sfFtp_sendCommand(sfFtp* ftp, const char* command, const char* parameter);

sfPacket* sfPacket_create(void);
sfPacket* sfPacket_copy(const sfPacket* packet);
void sfPacket_destroy(sfPacket* packet);
void sfPacket_append(sfPacket* packet, const void* data, size_t sizeInBytes);
void sfPacket_clear(sfPacket* packet);
const void* sfPacket_getData(const sfPacket* packet);
size_t sfPacket_getDataSize(const sfPacket* packet);
sfBool sfPacket_endOfPacket(const sfPacket* packet);
sfBool sfPacket_canRead(const sfPacket* packet);

sfBool   sfPacket_readBool(sfPacket* packet);
sfInt8   sfPacket_readInt8(sfPacket* packet);
sfUint8  sfPacket_readUint8(sfPacket* packet);
sfInt16  sfPacket_readInt16(sfPacket* packet);
sfUint16 sfPacket_readUint16(sfPacket* packet);
sfInt32  sfPacket_readInt32(sfPacket* packet);
sfUint32 sfPacket_readUint32(sfPacket* packet);
float    sfPacket_readFloat(sfPacket* packet);
double   sfPacket_readDouble(sfPacket* packet);
void     sfPacket_readString(sfPacket* packet, char* string);
void     sfPacket_readWideString(sfPacket* packet, wchar_t* string);
void sfPacket_writeBool(sfPacket* packet, sfBool);
void sfPacket_writeInt8(sfPacket* packet, sfInt8);
void sfPacket_writeUint8(sfPacket* packet, sfUint8);
void sfPacket_writeInt16(sfPacket* packet, sfInt16);
void sfPacket_writeUint16(sfPacket* packet, sfUint16);
void sfPacket_writeInt32(sfPacket* packet, sfInt32);
void sfPacket_writeUint32(sfPacket* packet, sfUint32);
void sfPacket_writeFloat(sfPacket* packet, float);
void sfPacket_writeDouble(sfPacket* packet, double);
void sfPacket_writeString(sfPacket* packet, const char* string);
void sfPacket_writeWideString(sfPacket* packet, const wchar_t* string);

sfSocketSelector* sfSocketSelector_create(void);
sfSocketSelector* sfSocketSelector_copy(const sfSocketSelector* selector);
void sfSocketSelector_destroy(sfSocketSelector* selector);
void sfSocketSelector_addTcpListener(sfSocketSelector* selector, sfTcpListener* socket);
void sfSocketSelector_addTcpSocket(sfSocketSelector* selector, sfTcpSocket* socket);
void sfSocketSelector_addUdpSocket(sfSocketSelector* selector, sfUdpSocket* socket);
void sfSocketSelector_removeTcpListener(sfSocketSelector* selector, sfTcpListener* socket);
void sfSocketSelector_removeTcpSocket(sfSocketSelector* selector, sfTcpSocket* socket);
void sfSocketSelector_removeUdpSocket(sfSocketSelector* selector, sfUdpSocket* socket);
void sfSocketSelector_clear(sfSocketSelector* selector);
sfBool sfSocketSelector_wait(sfSocketSelector* selector, sfTime timeout);
sfBool sfSocketSelector_isTcpListenerReady(const sfSocketSelector* selector, sfTcpListener* socket);
sfBool sfSocketSelector_isTcpSocketReady(const sfSocketSelector* selector, sfTcpSocket* socket);
sfBool sfSocketSelector_isUdpSocketReady(const sfSocketSelector* selector, sfUdpSocket* socket);

sfTcpListener* sfTcpListener_create(void);
void sfTcpListener_destroy(sfTcpListener* listener);
void sfTcpListener_setBlocking(sfTcpListener* listener, sfBool blocking);
sfBool sfTcpListener_isBlocking(const sfTcpListener* listener);
unsigned short sfTcpListener_getLocalPort(const sfTcpListener* listener);
sfSocketStatus sfTcpListener_listen(sfTcpListener* listener, unsigned short port, sfIpAddress address);
sfSocketStatus sfTcpListener_accept(sfTcpListener* listener, sfTcpSocket** connected);

sfTcpSocket* sfTcpSocket_create(void);
void sfTcpSocket_destroy(sfTcpSocket* socket);
void sfTcpSocket_setBlocking(sfTcpSocket* socket, sfBool blocking);
sfBool sfTcpSocket_isBlocking(const sfTcpSocket* socket);
unsigned short sfTcpSocket_getLocalPort(const sfTcpSocket* socket);
sfIpAddress sfTcpSocket_getRemoteAddress(const sfTcpSocket* socket);
unsigned short sfTcpSocket_getRemotePort(const sfTcpSocket* socket);
sfSocketStatus sfTcpSocket_connect(sfTcpSocket* socket, sfIpAddress remoteAddress, unsigned short remotePort, sfTime timeout);
void sfTcpSocket_disconnect(sfTcpSocket* socket);
sfSocketStatus sfTcpSocket_send(sfTcpSocket* socket, const void* data, size_t size);
sfSocketStatus sfTcpSocket_sendPartial(sfTcpSocket* socket, const void* data, size_t size, size_t* sent);
sfSocketStatus sfTcpSocket_receive(sfTcpSocket* socket, void* data, size_t size, size_t* received);
sfSocketStatus sfTcpSocket_sendPacket(sfTcpSocket* socket, sfPacket* packet);
sfSocketStatus sfTcpSocket_receivePacket(sfTcpSocket* socket, sfPacket* packet);

sfUdpSocket* sfUdpSocket_create(void);
void sfUdpSocket_destroy(sfUdpSocket* socket);
void sfUdpSocket_setBlocking(sfUdpSocket* socket, sfBool blocking);
sfBool sfUdpSocket_isBlocking(const sfUdpSocket* socket);
unsigned short sfUdpSocket_getLocalPort(const sfUdpSocket* socket);
sfSocketStatus sfUdpSocket_bind(sfUdpSocket* socket, unsigned short port, sfIpAddress address);
void sfUdpSocket_unbind(sfUdpSocket* socket);
sfSocketStatus sfUdpSocket_send(sfUdpSocket* socket, const void* data, size_t size, sfIpAddress remoteAddress, unsigned short remotePort);
sfSocketStatus sfUdpSocket_receive(sfUdpSocket* socket, void* data, size_t size, size_t* received, sfIpAddress* remoteAddress, unsigned short* remotePort);
sfSocketStatus sfUdpSocket_sendPacket(sfUdpSocket* socket, sfPacket* packet, sfIpAddress remoteAddress, unsigned short remotePort);
sfSocketStatus sfUdpSocket_receivePacket(sfUdpSocket* socket, sfPacket* packet, sfIpAddress* remoteAddress, unsigned short* remotePort);
unsigned int sfUdpSocket_maxDatagramSize();
]])

local function get(t, k)
  return t[k]
end

return setmetatable({
  ffi.load("csfml-system-2"),
  ffi.load("csfml-window-2"),
  ffi.load("csfml-graphics-2"),
  ffi.load("csfml-audio-2"),
  ffi.load("csfml-network-2"),
}, {
  __index = function (self, k, v)
    for _,l in ipairs(self) do
      local status, val = pcall(get, l, k)
      if status then
        return val
      end
    end
  end
})