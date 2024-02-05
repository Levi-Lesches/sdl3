// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Get the directory where the application was run from.
///
/// This is not necessarily a fast call, so you should call this once near
/// startup and save the string if you need it.
///
/// **macOS and iOS Specific Functionality**: If the application is in a ".app"
/// bundle, this function returns the Resource directory (e.g.
/// MyApp.app/Contents/Resources/). This behaviour can be overridden by adding
/// a property to the Info.plist file. Adding a string key with the name
/// SDL_FILESYSTEM_BASE_DIR_TYPE with a supported value will change the
/// behaviour.
///
/// Supported values for the SDL_FILESYSTEM_BASE_DIR_TYPE property (Given an
/// application in /Applications/SDLApp/MyApp.app):
///
/// - `resource`: bundle resource directory (the default). For example:
/// `/Applications/SDLApp/MyApp.app/Contents/Resources`
/// - `bundle`: the Bundle directory. For example:
/// `/Applications/SDLApp/MyApp.app/`
/// - `parent`: the containing directory of the bundle. For example:
/// `/Applications/SDLApp/`
///
/// **Nintendo 3DS Specific Functionality**: This function returns "romfs"
/// directory of the application as it is uncommon to store resources outside
/// the executable. As such it is not a writable directory.
///
/// The returned path is guaranteed to end with a path separator ('\\' on
/// Windows, '/' on most other platforms).
///
/// The pointer returned is owned by the caller. Please call SDL_free() on the
/// pointer when done with it.
///
/// \returns an absolute path in UTF-8 encoding to the application data
/// directory. NULL will be returned on error or when the platform
/// doesn't implement this functionality, call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPrefPath
///
/// ```c
/// extern DECLSPEC char *SDLCALL SDL_GetBasePath(void)
/// ```
Pointer<Int8> sdlGetBasePath() {
  final sdlGetBasePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(), Pointer<Int8> Function()>('SDL_GetBasePath');
  return sdlGetBasePathLookupFunction();
}

///
/// Get the user-and-app-specific path where files can be written.
///
/// Get the "pref dir". This is meant to be where users can write personal
/// files (preferences and save games, etc) that are specific to your
/// application. This directory is unique per user, per application.
///
/// This function will decide the appropriate location in the native
/// filesystem, create the directory if necessary, and return a string of the
/// absolute path to the directory in UTF-8 encoding.
///
/// On Windows, the string might look like:
///
/// `C:\\Users\\bob\\AppData\\Roaming\\My Company\\My Program Name\\`
///
/// On Linux, the string might look like:
///
/// `/home/bob/.local/share/My Program Name/`
///
/// On macOS, the string might look like:
///
/// `/Users/bob/Library/Application Support/My Program Name/`
///
/// You should assume the path returned by this function is the only safe place
/// to write files (and that SDL_GetBasePath(), while it might be writable, or
/// even the parent of the returned path, isn't where you should be writing
/// things).
///
/// Both the org and app strings may become part of a directory name, so please
/// follow these rules:
///
/// - Try to use the same org string (_including case-sensitivity_) for all
/// your applications that use this function.
/// - Always use a unique app string for each one, and make sure it never
/// changes for an app once you've decided on it.
/// - Unicode characters are legal, as long as it's UTF-8 encoded, but...
/// - ...only use letters, numbers, and spaces. Avoid punctuation like "Game
/// Name 2: Bad Guy's Revenge!" ... "Game Name 2" is sufficient.
///
/// The returned path is guaranteed to end with a path separator ('\\' on
/// Windows, '/' on most other platforms).
///
/// The pointer returned is owned by the caller. Please call SDL_free() on the
/// pointer when done with it.
///
/// \param org the name of your organization
/// \param app the name of your application
/// \returns a UTF-8 string of the user directory in platform-dependent
/// notation. NULL if there's a problem (creating directory failed,
/// etc.).
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetBasePath
///
/// ```c
/// extern DECLSPEC char *SDLCALL SDL_GetPrefPath(const char *org, const char *app)
/// ```
Pointer<Int8> sdlGetPrefPath(String? org, String? app) {
  final sdlGetPrefPathLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> org, Pointer<Utf8> app),
      Pointer<Int8> Function(
          Pointer<Utf8> org, Pointer<Utf8> app)>('SDL_GetPrefPath');
  final orgPointer = org != null ? org.toNativeUtf8() : nullptr;
  final appPointer = app != null ? app.toNativeUtf8() : nullptr;
  final result = sdlGetPrefPathLookupFunction(orgPointer, appPointer);
  calloc.free(orgPointer);
  calloc.free(appPointer);
  return result;
}

///
/// Finds the most suitable user folder for @p purpose, and returns its path in
/// OS-specific notation.
///
/// Many OSes provide certain standard folders for certain purposes, such as
/// storing pictures, music or videos for a certain user. This function gives
/// the path for many of those special locations.
///
/// This function is specifically for _user_ folders, which are meant for the
/// user to access and manage. For application-specific folders, meant to hold
/// data for the application to manage, see SDL_GetBasePath() and
/// SDL_GetPrefPath().
///
/// Note that the function is expensive, and should be called once at the
/// beginning of the execution and kept for as long as needed.
///
/// The returned value is owned by the caller and should be freed with
/// SDL_free().
///
/// If NULL is returned, the error may be obtained with SDL_GetError().
///
/// \param folder The type of folder to find
/// \returns Either a null-terminated C string containing the full path to the
/// folder, or NULL if an error happened.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Folder
///
/// ```c
/// extern DECLSPEC char *SDLCALL SDL_GetUserFolder(SDL_Folder folder)
/// ```
Pointer<Int8> sdlGetUserFolder(int folder) {
  final sdlGetUserFolderLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Int32 folder),
      Pointer<Int8> Function(int folder)>('SDL_GetUserFolder');
  return sdlGetUserFolderLookupFunction(folder);
}
