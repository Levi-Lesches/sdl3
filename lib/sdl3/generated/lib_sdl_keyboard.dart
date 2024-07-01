// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Return whether a keyboard is currently connected.
///
/// \returns SDL_TRUE if a keyboard is connected, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboards
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasKeyboard(void)
/// ```
bool sdlHasKeyboard() {
  final sdlHasKeyboardLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasKeyboard');
  return sdlHasKeyboardLookupFunction() == 1;
}

///
/// Get a list of currently connected keyboards.
///
/// Note that this will include any device or virtual driver that includes
/// keyboard functionality, including some mice, KVM switches, motherboard
/// power buttons, etc. You should wait for input from a device before you
/// consider it actively in use.
///
/// \param count a pointer filled in with the number of keyboards returned.
/// \returns a 0 terminated array of keyboards instance IDs which should be
/// freed with SDL_free(), or NULL on error; call SDL_GetError() for
/// more details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboardInstanceName
/// \sa SDL_HasKeyboard
///
/// ```c
/// extern SDL_DECLSPEC SDL_KeyboardID *SDLCALL SDL_GetKeyboards(int *count)
/// ```
Pointer<Uint32> sdlGetKeyboards(Pointer<Int32> count) {
  final sdlGetKeyboardsLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetKeyboards');
  return sdlGetKeyboardsLookupFunction(count);
}

///
/// Get the name of a keyboard.
///
/// This function returns "" if the keyboard doesn't have a name.
///
/// The returned string follows the SDL_GetStringRule.
///
/// \param instance_id the keyboard instance ID.
/// \returns the name of the selected keyboard, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboards
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetKeyboardInstanceName(SDL_KeyboardID instance_id)
/// ```
String? sdlGetKeyboardInstanceName(int instanceId) {
  final sdlGetKeyboardInstanceNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetKeyboardInstanceName');
  final result = sdlGetKeyboardInstanceNameLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Query the window which currently has keyboard focus.
///
/// \returns the window with keyboard focus.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetKeyboardFocus(void)
/// ```
Pointer<SdlWindow> sdlGetKeyboardFocus() {
  final sdlGetKeyboardFocusLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(),
      Pointer<SdlWindow> Function()>('SDL_GetKeyboardFocus');
  return sdlGetKeyboardFocusLookupFunction();
}

///
/// Get a snapshot of the current state of the keyboard.
///
/// The pointer returned is a pointer to an internal SDL array. It will be
/// valid for the whole lifetime of the application and should not be freed by
/// the caller.
///
/// A array element with a value of 1 means that the key is pressed and a value
/// of 0 means that it is not. Indexes into this array are obtained by using
/// SDL_Scancode values.
///
/// Use SDL_PumpEvents() to update the state array.
///
/// This function gives you the current state after all events have been
/// processed, so if a key or button has been pressed and released before you
/// process events, then the pressed state will never show up in the
/// SDL_GetKeyboardState() calls.
///
/// Note: This function doesn't take into account whether shift has been
/// pressed or not.
///
/// \param numkeys if non-NULL, receives the length of the returned array.
/// \returns a pointer to an array of key states.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PumpEvents
/// \sa SDL_ResetKeyboard
///
/// ```c
/// extern SDL_DECLSPEC const Uint8 *SDLCALL SDL_GetKeyboardState(int *numkeys)
/// ```
Pointer<Uint8> sdlGetKeyboardState(Pointer<Int32> numkeys) {
  final sdlGetKeyboardStateLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint8> Function(Pointer<Int32> numkeys),
      Pointer<Uint8> Function(Pointer<Int32> numkeys)>('SDL_GetKeyboardState');
  return sdlGetKeyboardStateLookupFunction(numkeys);
}

///
/// Clear the state of the keyboard.
///
/// This function will generate key up events for all pressed keys.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboardState
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ResetKeyboard(void)
/// ```
void sdlResetKeyboard() {
  final sdlResetKeyboardLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_ResetKeyboard');
  return sdlResetKeyboardLookupFunction();
}

///
/// Get the current key modifier state for the keyboard.
///
/// \returns an OR'd combination of the modifier keys for the keyboard. See
/// SDL_Keymod for details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboardState
/// \sa SDL_SetModState
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keymod SDLCALL SDL_GetModState(void)
/// ```
int sdlGetModState() {
  final sdlGetModStateLookupFunction = libSdl3
      .lookupFunction<Uint16 Function(), int Function()>('SDL_GetModState');
  return sdlGetModStateLookupFunction();
}

///
/// Set the current key modifier state for the keyboard.
///
/// The inverse of SDL_GetModState(), SDL_SetModState() allows you to impose
/// modifier key states on your application. Simply pass your desired modifier
/// states into `modstate`. This value may be a bitwise, OR'd combination of
/// SDL_Keymod values.
///
/// This does not change the keyboard state, only the key modifier flags that
/// SDL reports.
///
/// \param modstate the desired SDL_Keymod for the keyboard.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetModState
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetModState(SDL_Keymod modstate)
/// ```
void sdlSetModState(int modstate) {
  final sdlSetModStateLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint16 modstate),
      void Function(int modstate)>('SDL_SetModState');
  return sdlSetModStateLookupFunction(modstate);
}

///
/// Get the key code corresponding to the given scancode according to a default
/// en_US keyboard layout.
///
/// See SDL_Keycode for details.
///
/// \param scancode the desired SDL_Scancode to query.
/// \param modstate the modifier state to use when translating the scancode to
/// a keycode.
/// \returns the SDL_Keycode that corresponds to the given SDL_Scancode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetDefaultKeyFromScancode(SDL_Scancode scancode, SDL_Keymod modstate)
/// ```
int sdlGetDefaultKeyFromScancode(int scancode, int modstate) {
  final sdlGetDefaultKeyFromScancodeLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Int32 scancode, Uint16 modstate),
      int Function(
          int scancode, int modstate)>('SDL_GetDefaultKeyFromScancode');
  return sdlGetDefaultKeyFromScancodeLookupFunction(scancode, modstate);
}

///
/// Get the key code corresponding to the given scancode according to the
/// current keyboard layout.
///
/// See SDL_Keycode for details.
///
/// \param scancode the desired SDL_Scancode to query.
/// \param modstate the modifier state to use when translating the scancode to
/// a keycode.
/// \returns the SDL_Keycode that corresponds to the given SDL_Scancode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDefaultKeyFromScancode
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetKeyFromScancode(SDL_Scancode scancode, SDL_Keymod modstate)
/// ```
int sdlGetKeyFromScancode(int scancode, int modstate) {
  final sdlGetKeyFromScancodeLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Int32 scancode, Uint16 modstate),
      int Function(int scancode, int modstate)>('SDL_GetKeyFromScancode');
  return sdlGetKeyFromScancodeLookupFunction(scancode, modstate);
}

///
/// Get the scancode corresponding to the given key code according to a default
/// en_US keyboard layout.
///
/// Note that there may be multiple scancode+modifier states that can generate
/// this keycode, this will just return the first one found.
///
/// \param key the desired SDL_Keycode to query.
/// \param modstate a pointer to the modifier state that would be used when the
/// scancode generates this key, may be NULL.
/// \returns the SDL_Scancode that corresponds to the given SDL_Keycode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetDefaultScancodeFromKey(SDL_Keycode key, SDL_Keymod *modstate)
/// ```
int sdlGetDefaultScancodeFromKey(int key, Pointer<Uint16> modstate) {
  final sdlGetDefaultScancodeFromKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 key, Pointer<Uint16> modstate),
      int Function(
          int key, Pointer<Uint16> modstate)>('SDL_GetDefaultScancodeFromKey');
  return sdlGetDefaultScancodeFromKeyLookupFunction(key, modstate);
}

///
/// Get the scancode corresponding to the given key code according to the
/// current keyboard layout.
///
/// Note that there may be multiple scancode+modifier states that can generate
/// this keycode, this will just return the first one found.
///
/// \param key the desired SDL_Keycode to query.
/// \param modstate a pointer to the modifier state that would be used when the
/// scancode generates this key, may be NULL.
/// \returns the SDL_Scancode that corresponds to the given SDL_Keycode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDefaultScancodeFromKey
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetScancodeFromKey(SDL_Keycode key, SDL_Keymod *modstate)
/// ```
int sdlGetScancodeFromKey(int key, Pointer<Uint16> modstate) {
  final sdlGetScancodeFromKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 key, Pointer<Uint16> modstate),
      int Function(
          int key, Pointer<Uint16> modstate)>('SDL_GetScancodeFromKey');
  return sdlGetScancodeFromKeyLookupFunction(key, modstate);
}

///
/// Set a human-readable name for a scancode.
///
/// \param scancode the desired SDL_Scancode.
/// \param name the name to use for the scancode, encoded as UTF-8. The string
/// is not copied, so the pointer given to this function must stay
/// valid while SDL is being used.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetScancodeName(SDL_Scancode scancode, const char *name)
/// ```
int sdlSetScancodeName(int scancode, String? name) {
  final sdlSetScancodeNameLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 scancode, Pointer<Utf8> name),
      int Function(int scancode, Pointer<Utf8> name)>('SDL_SetScancodeName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetScancodeNameLookupFunction(scancode, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a human-readable name for a scancode.
///
/// The returned string follows the SDL_GetStringRule.
///
/// **Warning**: The returned name is by design not stable across platforms,
/// e.g. the name for `SDL_SCANCODE_LGUI` is "Left GUI" under Linux but "Left
/// Windows" under Microsoft Windows, and some scancodes like
/// `SDL_SCANCODE_NONUSBACKSLASH` don't have any name at all. There are even
/// scancodes that share names, e.g. `SDL_SCANCODE_RETURN` and
/// `SDL_SCANCODE_RETURN2` (both called "Return"). This function is therefore
/// unsuitable for creating a stable cross-platform two-way mapping between
/// strings and scancodes.
///
/// \param scancode the desired SDL_Scancode to query.
/// \returns a pointer to the name for the scancode. If the scancode doesn't
/// have a name this function returns an empty string ("").
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeFromName
/// \sa SDL_SetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetScancodeName(SDL_Scancode scancode)
/// ```
String? sdlGetScancodeName(int scancode) {
  final sdlGetScancodeNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 scancode),
      Pointer<Utf8> Function(int scancode)>('SDL_GetScancodeName');
  final result = sdlGetScancodeNameLookupFunction(scancode);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a scancode from a human-readable name.
///
/// \param name the human-readable scancode name.
/// \returns the SDL_Scancode, or `SDL_SCANCODE_UNKNOWN` if the name wasn't
/// recognized; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyFromName
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetScancodeFromName(const char *name)
/// ```
int sdlGetScancodeFromName(String? name) {
  final sdlGetScancodeFromNameLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> name),
      int Function(Pointer<Utf8> name)>('SDL_GetScancodeFromName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetScancodeFromNameLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a human-readable name for a key.
///
/// The returned string follows the SDL_GetStringRule.
///
/// \param key the desired SDL_Keycode to query.
/// \returns a pointer to a UTF-8 string that stays valid at least until the
/// next call to this function. If you need it around any longer, you
/// must copy it. If the key doesn't have a name, this function
/// returns an empty string ("").
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyFromName
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetKeyName(SDL_Keycode key)
/// ```
String? sdlGetKeyName(int key) {
  final sdlGetKeyNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 key),
      Pointer<Utf8> Function(int key)>('SDL_GetKeyName');
  final result = sdlGetKeyNameLookupFunction(key);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a key code from a human-readable name.
///
/// \param name the human-readable key name.
/// \returns key code, or `SDLK_UNKNOWN` if the name wasn't recognized; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetKeyFromName(const char *name)
/// ```
int sdlGetKeyFromName(String? name) {
  final sdlGetKeyFromNameLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Utf8> name),
      int Function(Pointer<Utf8> name)>('SDL_GetKeyFromName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetKeyFromNameLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Start accepting Unicode text input events.
///
/// This function will start accepting Unicode text input events in the focused
/// SDL window, and start emitting SDL_TextInputEvent (SDL_EVENT_TEXT_INPUT)
/// and SDL_TextEditingEvent (SDL_EVENT_TEXT_EDITING) events. Please use this
/// function in pair with SDL_StopTextInput().
///
/// Text input events are not received by default.
///
/// On some platforms using this function activates the screen keyboard.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetTextInputRect
/// \sa SDL_StopTextInput
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_StartTextInput(void)
/// ```
void sdlStartTextInput() {
  final sdlStartTextInputLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_StartTextInput');
  return sdlStartTextInputLookupFunction();
}

///
/// Check whether or not Unicode text input events are enabled.
///
/// \returns SDL_TRUE if text input events are enabled else SDL_FALSE.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_TextInputActive(void)
/// ```
bool sdlTextInputActive() {
  final sdlTextInputActiveLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_TextInputActive');
  return sdlTextInputActiveLookupFunction() == 1;
}

///
/// Stop receiving any text input events.
///
/// Text input events are not received by default.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_StopTextInput(void)
/// ```
void sdlStopTextInput() {
  final sdlStopTextInputLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_StopTextInput');
  return sdlStopTextInputLookupFunction();
}

///
/// Dismiss the composition window/IME without disabling the subsystem.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
/// \sa SDL_StopTextInput
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ClearComposition(void)
/// ```
void sdlClearComposition() {
  final sdlClearCompositionLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_ClearComposition');
  return sdlClearCompositionLookupFunction();
}

///
/// Set the rectangle used to type Unicode text inputs.
///
/// Native input methods will place a window with word suggestions near it,
/// without covering the text being inputted.
///
/// To start text input in a given location, this function is intended to be
/// called before SDL_StartTextInput, although some platforms support moving
/// the rectangle even while text input (and a composition) is active.
///
/// Note: If you want to use the system native IME window, try setting hint
/// **SDL_HINT_IME_SHOW_UI** to **1**, otherwise this function won't give you
/// any feedback.
///
/// \param rect the SDL_Rect structure representing the rectangle to receive
/// text (ignored if NULL).
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetTextInputRect(const SDL_Rect *rect)
/// ```
int sdlSetTextInputRect(Pointer<SdlRect> rect) {
  final sdlSetTextInputRectLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRect> rect),
      int Function(Pointer<SdlRect> rect)>('SDL_SetTextInputRect');
  return sdlSetTextInputRectLookupFunction(rect);
}

///
/// Check whether the platform has screen keyboard support.
///
/// \returns SDL_TRUE if the platform has some screen keyboard support or
/// SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
/// \sa SDL_ScreenKeyboardShown
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasScreenKeyboardSupport(void)
/// ```
bool sdlHasScreenKeyboardSupport() {
  final sdlHasScreenKeyboardSupportLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_HasScreenKeyboardSupport');
  return sdlHasScreenKeyboardSupportLookupFunction() == 1;
}

///
/// Check whether the screen keyboard is shown for given window.
///
/// \param window the window for which screen keyboard should be queried.
/// \returns SDL_TRUE if screen keyboard is shown or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasScreenKeyboardSupport
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_ScreenKeyboardShown(SDL_Window *window)
/// ```
bool sdlScreenKeyboardShown(Pointer<SdlWindow> window) {
  final sdlScreenKeyboardShownLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_ScreenKeyboardShown');
  return sdlScreenKeyboardShownLookupFunction(window) == 1;
}
