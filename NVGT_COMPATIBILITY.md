# NVGT Compatibility Notes

## Overview

This project is compatible with newer versions of NVGT (Non-Visual Game Toolkit), but requires compatibility wrappers for API changes between older and newer NVGT versions.

## API Changes Handled

### 1. Key Constants
- **Old**: `KEY_LCONTROL`, `KEY_RCONTROL`
- **New**: `KEY_LCTRL`, `KEY_RCTRL`
- **Solution**: Compatibility aliases defined in `bgt_compat_funcs.nvgt`

### 2. Pack File Constants
- **Old**: `PACK_OPEN_MODE_READ`, `PACK_OPEN_MODE_WRITE`, `PACK_OPEN_MODE_APPEND`
- **New**: May use different naming or values
- **Solution**: Constants defined in `bgt_compat_funcs.nvgt`

### 3. Computer ID Generation
- **Old**: `generate_computer_id(salt, use_hardware)`
- **New**: May use different API or not available
- **Solution**: Compatibility wrapper using system fingerprinting

### 4. Window Management
- **Old**: `is_game_window_active()`, `show_game_window(title)`
- **New**: Different window management API
- **Solution**: Wrappers that map to newer API functions

### 5. String Functions
- **Old**: `string_is_digits(str)`, `string_is_alphabetic(str)`, `string_hash(str, type, hex)`
- **New**: Some functions removed or changed to string methods
- **Solution**: Compatibility functions in `bgt_compat_funcs.nvgt`

### 6. Sound Decryption
- **Old**: `set_sound_decryption_key(key, real)`
- **New**: May not be available or uses different API
- **Solution**: Stub function (no-op) for compatibility

### 7. Audio Effects
- **Old**: `mixer.set_fx(effect_string)`
- **New**: API changed or removed
- **Solution**: Calls commented out in `reverb.nvgt` (audio effects disabled)

### 8. Data Types
- **Old**: `long` type
- **New**: Use `int64` instead
- **Solution**: `typedef int64 long;` in `bgt_compat_funcs.nvgt`

## Impact on Functionality

Most compatibility wrappers maintain full functionality. However, some features have been disabled:

1. **Audio Reverb Effects**: The `mixer.set_fx()` method is not available in newer NVGT versions, so reverb effects are currently disabled. The code structure remains in place for future re-implementation when the API becomes available.

2. **Sound Decryption**: The `set_sound_decryption_key()` function is a no-op stub. If sound pack decryption is needed, this will need to be implemented using the newer NVGT pack API.

## NVGT Version

The CI workflow downloads NVGT using the "latest" tag from the official NVGT repository. The compatibility wrappers in this project ensure the code compiles and runs with newer NVGT versions while maintaining backward compatibility where possible.

## Maintaining Compatibility

When updating NVGT or encountering new API changes:

1. Check the compilation errors for missing symbols
2. Add compatibility wrappers in the appropriate `bgt_compat_funcs.nvgt` file (client or server)
3. Comment out code that uses unavailable APIs with clear documentation
4. Test thoroughly to ensure functionality is maintained or gracefully degraded

## Files Modified for Compatibility

- `client/includes/bgt_compat_funcs.nvgt` - Main compatibility wrapper file
- `server/includes/bgt_compat_funcs.nvgt` - Server compatibility wrappers
- `client/includes/reverb.nvgt` - Audio effects disabled (set_fx unavailable)
- `client/includes/stream.nvgt` - Updated to use int64 instead of long
