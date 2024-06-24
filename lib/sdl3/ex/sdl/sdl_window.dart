import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';

import '../../generated/lib_sdl.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_render.dart';
import '../../generated/lib_sdl_video.dart';
import '../dart/rectangle.dart';
import 'sdl_rect.dart';

extension SdlWindowEx on SdlWindow {
  // lib_sdl_video.dart
  static Pointer<SdlWindow> create(
      {required String title, required int w, required int h, int flags = 0}) {
    // 709
    return sdlCreateWindow(title, w, h, flags);
  }
}

extension SdlWindowPointerEx on Pointer<SdlWindow> {
  // lib_sdl_video.dart

  // sdlCreateWindowFrom

  int getId() {
    // 766
    return sdlGetWindowId(this);
  }

  // sdlGetWindowFromId

  int getFlags() {
    // 816
    return sdlGetWindowFlags(this);
  }

  void setTitle(String title) {
    // 838
    sdlSetWindowTitle(this, title);
  }

  String? getTitle() {
    // 863
    return sdlGetWindowTitle(this);
  }

  void setIcon(Pointer<SdlSurface> icon) {
    // 881
    sdlSetWindowIcon(this, icon);
  }

  void setPosition(int x, int y) {
    // 962
    sdlSetWindowPosition(this, x, y);
  }

  math.Point<double> getPosition() {
    var x = calloc<Int32>();
    var y = calloc<Int32>();
    // 989
    sdlGetWindowPosition(this, x, y);
    var result = math.Point<double>(x.value.toDouble(), y.value.toDouble());
    calloc.free(x);
    calloc.free(y);
    return result;
  }

  void setSize(int w, int h) {
    // 1024
    sdlSetWindowSize(this, w, h);
  }

  math.Point<double> getSize() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowSize(this, w, h);
    // 1059
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
  }

  math.Rectangle<double> getBordersSize() {
    var top = calloc<Int32>();
    var left = calloc<Int32>();
    var bottom = calloc<Int32>();
    var right = calloc<Int32>();
    // 1104
    sdlGetWindowBordersSize(this, top, left, bottom, right);
    var result = math.Rectangle<double>(top.value.toDouble(),
        left.value.toDouble(), bottom.value.toDouble(), right.value.toDouble());
    calloc.free(top);
    calloc.free(left);
    calloc.free(bottom);
    calloc.free(right);
    return result;
  }

  math.Point<double> getSizeInPixels() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowSizeInPixels(this, w, h);
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
  }

  void setMinimumSize(int w, int h) {
    // 1134
    sdlSetWindowMinimumSize(this, w, h);
  }

  math.Point<double> getMinimumSize() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowMinimumSize(this, w, h);
    // 1159
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
  }

  void setMaximumSize(int w, int h) {
    // 1184
    sdlSetWindowMaximumSize(this, w, h);
  }

  math.Point<double> getMaximumSize() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowMaximumSize(this, w, h);
    // 1209
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
  }

  void setBordered(bool bordered) {
    // 1238
    sdlSetWindowBordered(this, bordered);
  }

  void setResizable(bool resizable) {
    // 1265
    sdlSetWindowResizable(this, resizable);
  }

  void setAlwaysOnTop(bool onTop) {
    // 1290
    sdlSetWindowAlwaysOnTop(this, onTop);
  }

  void show() {
    // 1311
    sdlShowWindow(this);
  }

  void hide() {
    // 1330
    sdlHideWindow(this);
  }

  void raise() {
    // 1347
    sdlRaiseWindow(this);
  }

  void maximize() {
    // 1367
    sdlMaximizeWindow(this);
  }

  void minimize() {
    // 1387
    sdlMinimizeWindow(this);
  }

  void restore() {
    // 1407
    sdlRestoreWindow(this);
  }

  Pointer<SdlSurface> getSurface() {
    // 1468
    return sdlGetWindowSurface(this);
  }

  void updateSurface() {
    // 1496
    sdlUpdateWindowSurface(this);
  }

  int updateSurfaceRects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.callocInt();
    // 1526
    var result = sdlUpdateWindowSurfaceRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  void setKeyboardGrab(bool grabbed) {
    // 1596
    sdlSetWindowKeyboardGrab(this, grabbed);
  }

  void setMouseGrab(bool grabbed) {
    // 1621
    sdlSetWindowMouseGrab(this, grabbed);
  }

  bool getKeyboardGrab() {
    // 1663
    return sdlGetWindowKeyboardGrab(this);
  }

  bool getMouseGrab() {
    // 1684
    return sdlGetWindowMouseGrab(this);
  }

  // sdlGetGrabbedWindow

  int setMouseRect(math.Rectangle<double> rect) {
    var rectPointer = rect.callocInt();
    // 1731
    var result = sdlSetWindowMouseRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  math.Rectangle<double>? getMouseRect() {
    math.Rectangle<double>? result;
    // 1753
    var rectPointer = sdlGetWindowMouseRect(this);
    if (rectPointer != nullptr) {
      result = rectPointer.create();
    }
    return result;
  }

  void setOpacity(double opacity) {
    // 1845
    sdlSetWindowOpacity(this, opacity);
  }

  double? getOpacity() {
    double? result;
    var opacityPointer = calloc<Float>();
    // 1875
    if (sdlGetWindowOpacity(this, opacityPointer) == 0) {
      result = opacityPointer.value;
    }
    calloc.free(opacityPointer);
    return result;
  }

  int setModalFor(Pointer<SdlWindow> parentWindow) {
    // 1896
    return sdlSetWindowModalFor(this, parentWindow);
  }

  int setInputFocus() {
    // 1924
    return sdlSetWindowInputFocus(this);
  }

  // sdlSetWindowGammaRamp
  // sdlGetWindowGammaRamp

  int setHitTest(Pointer<NativeFunction<SdlHitTest>> callback,
      Pointer<NativeType> callbackData) {
    // 2059
    return sdlSetWindowHitTest(this, callback, callbackData);
  }

  int flash(int operation) {
    // 2082
    return sdlFlashWindow(this, operation);
  }

  bool destroy() {
    if (this != nullptr) {
      // 2106
      sdlDestroyWindow(this);
      return true;
    }
    return false;
  }

  ///
  /// Create an OpenGL context for an OpenGL window, and make it current.
  ///
  /// Windows users new to OpenGL should note that, for historical reasons, GL
  /// functions added after OpenGL version 1.1 are not available by default.
  /// Those functions must be loaded at run-time, either with an OpenGL
  /// extension-handling library or with SDL_GL_GetProcAddress() and its related
  /// functions.
  ///
  /// SDL_GLContext is opaque to the application.
  ///
  /// \param window the window to associate with the context.
  /// \returns the OpenGL context associated with `window` or NULL on error; call
  /// SDL_GetError() for more details.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GL_DeleteContext
  /// \sa SDL_GL_MakeCurrent
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_GLContext SDLCALL SDL_GL_CreateContext(SDL_Window *window)
  /// ```
  Pointer<SdlGlContext> glCreateContext() {
    return sdlGlCreateContext(this);
  }

  int getDisplayFor() {
    // 527
    return sdlGetDisplayForWindow(this);
  }

  // lib_sdl_renderer.dart
  Pointer<SdlRenderer> createRenderer({String? name}) {
    // 122
    return sdlCreateRenderer(this, name);
  }

  Pointer<SdlRenderer> getRenderer() {
    // 176
    return sdlGetRenderer(this);
  }
}
