// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get an ASCII string representation for a given SDL_GUID.
///
/// \param guid the SDL_GUID you wish to convert to string.
/// \param pszGUID buffer in which to write the ASCII string.
/// \param cbGUID the size of pszGUID, should be at least 33 bytes.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_StringToGUID
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GUIDToString(SDL_GUID guid, char *pszGUID, int cbGUID)
/// ```
void sdlGuidToString(SdlGuid guid, Pointer<Int8> pszGuid, int cbGuid) {
  final sdlGuidToStringLookupFunction = libSdl3.lookupFunction<
      Void Function(SdlGuid guid, Pointer<Int8> pszGuid, Int32 cbGuid),
      void Function(
          SdlGuid guid, Pointer<Int8> pszGuid, int cbGuid)>('SDL_GUIDToString');
  return sdlGuidToStringLookupFunction(guid, pszGuid, cbGuid);
}

///
/// Convert a GUID string into a SDL_GUID structure.
///
/// Performs no error checking. If this function is given a string containing
/// an invalid GUID, the function will silently succeed, but the GUID generated
/// will not be useful.
///
/// \param pchGUID string containing an ASCII representation of a GUID.
/// \returns a SDL_GUID structure.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GUIDToString
///
/// ```c
/// extern SDL_DECLSPEC SDL_GUID SDLCALL SDL_StringToGUID(const char *pchGUID)
/// ```
SdlGuid sdlStringToGuid(String? pchGuid) {
  final sdlStringToGuidLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Pointer<Utf8> pchGuid),
      SdlGuid Function(Pointer<Utf8> pchGuid)>('SDL_StringToGUID');
  final pchGuidPointer = pchGuid != null ? pchGuid.toNativeUtf8() : nullptr;
  final result = sdlStringToGuidLookupFunction(pchGuidPointer);
  calloc.free(pchGuidPointer);
  return result;
}
