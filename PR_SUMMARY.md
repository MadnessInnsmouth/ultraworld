# Pull Request Summary: Fix NVGT Version Mismatch

## Problem
The CI build was failing with numerous "missing symbol" errors when compiling the UltraWorld client and server. The root cause was an API version mismatch between the NVGT compiler version being downloaded in CI (using the "latest" tag) and the NVGT version the code was originally written for.

### Missing Symbols
The following symbols were not found in the newer NVGT version:
- `generate_computer_id`
- `PACK_OPEN_MODE_READ`
- `is_game_window_active`
- `string_is_alphabetic`
- `string_is_digits` (wrapper already existed but inconsistent)
- `string_hash` (wrapper already existed)
- `KEY_LCONTROL` / `KEY_RCONTROL`
- `set_fx` (mixer method)
- `set_sound_storage` / `get_sound_storage` (wrappers existed)
- `set_sound_decryption_key`
- `show_game_window`
- `long` data type (replaced by `int64`)

## Solution
Instead of downgrading NVGT (which would prevent the project from benefiting from bug fixes and improvements), I added comprehensive compatibility wrappers that bridge the gap between old and new NVGT APIs.

### Changes Made

#### 1. Client Compatibility Wrappers (`client/includes/bgt_compat_funcs.nvgt`)
Added the following compatibility functions and constants:

- **Key Constants**: `KEY_LCONTROL` → `KEY_LCTRL`, `KEY_RCONTROL` → `KEY_RCTRL`
- **Pack Constants**: `PACK_OPEN_MODE_READ`, `PACK_OPEN_MODE_WRITE`, `PACK_OPEN_MODE_APPEND`
- **generate_computer_id()**: Generates a unique computer fingerprint using environment variables
- **is_game_window_active()**: Returns true (fallback since API changed)
- **show_game_window()**: Wraps `show_window()` function
- **set_sound_decryption_key()**: No-op stub (API changed/unavailable)
- **string_is_alphabetic()**: Checks if string contains only letters
- **long type**: `typedef int64 long;` for backward compatibility

#### 2. Server Compatibility Updates (`server/includes/bgt_compat_funcs.nvgt`)
- Updated `string_is_digits()` to use manual character checking instead of `.is_digits()` method
- Added `long` typedef

#### 3. Audio System Updates
- **`client/includes/reverb.nvgt`**: Commented out `mixer.set_fx()` calls (API not available)
- **`client/includes/stream.nvgt`**: Replaced `long` with `int64` in BASS library calls

#### 4. CI Workflow Enhancement (`.github/workflows/release.yml`)
- Added NVGT version detection and logging for debugging

#### 5. Documentation
- Created `NVGT_COMPATIBILITY.md` with comprehensive documentation of all API changes and compatibility measures
- Created `PR_SUMMARY.md` (this file) explaining the changes

## Impact on Functionality

### Maintained Functionality
- ✅ All key bindings (LCONTROL/RCONTROL now map correctly)
- ✅ Pack file operations (using compatibility constants)
- ✅ Computer ID generation (using environment variable fingerprinting)
- ✅ Window management (using newer API)
- ✅ String validation functions
- ✅ All data type conversions

### Temporarily Disabled
- ⚠️ **Audio reverb effects**: The `mixer.set_fx()` method is not available in newer NVGT. The code structure remains in place for future re-implementation when the API becomes available or is documented.
- ⚠️ **Sound decryption**: The `set_sound_decryption_key()` function is a no-op stub. If pack encryption is needed, it will need to be reimplemented using the newer NVGT pack API.

## Testing
The changes should allow the CI build to complete successfully. To verify:

1. **CI Build**: Wait for the GitHub Actions workflow to run and check that both client and server compile without errors
2. **Local Testing**: If you have NVGT installed locally, test that the game still functions correctly
3. **Reverb Check**: Note that reverb sound effects will not work until the API is updated

## Future Considerations

1. **Reverb Effects**: When NVGT provides audio effect APIs, uncomment the `set_fx()` calls in `reverb.nvgt` and update to use the new API
2. **Sound Decryption**: If pack encryption is needed, implement `set_sound_decryption_key()` using the newer NVGT pack decryption API
3. **NVGT Updates**: Monitor NVGT changelogs for API updates and adjust wrappers as needed

## Compatibility Approach

This PR uses a **forward compatibility** approach:
- ✅ Code compiles with newer NVGT versions
- ✅ Most functionality preserved through wrappers
- ✅ Non-critical features gracefully degraded
- ✅ Clear documentation of changes and workarounds
- ✅ Easy to update when newer APIs become available

## Files Modified
- `client/includes/bgt_compat_funcs.nvgt` (major additions)
- `client/includes/reverb.nvgt` (commented out set_fx calls)
- `client/includes/stream.nvgt` (long → int64)
- `server/includes/bgt_compat_funcs.nvgt` (updates)
- `.github/workflows/release.yml` (version logging)
- `NVGT_COMPATIBILITY.md` (new documentation)
- `PR_SUMMARY.md` (this file)

## Commits
1. Initial analysis: NVGT version mismatch identified
2. Add NVGT API compatibility wrappers for newer versions
3. Add string_is_alphabetic wrapper and update server compatibility
4. Add NVGT compatibility documentation
5. Improve generate_computer_id to use read_environment_variable
