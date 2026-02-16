## Changes on Monday, February 16, 2026
- Version 2.49.5 has been released.

## Changes on Saturday, February 14, 2026
- Edited cmds. Added some existing codes and updated some old commands.
- Fixed broken pvp status in the build menu.

## Changes on Thursday, February 12, 2026
- Fixed several bugs related to map creation.
    1. Resolved an issue that caused players to fall when creating a map with negative coordinates.
    2. Maps now automatically include a zone named after the map itself. This is a much better solution than hearing "unknown area" repeatedly in areas where no zone is defined.

- Removed "Specified Air Temperature" from the build menu as it was not working.

## Changes on Tuesday, February 10, 2026
- Removed map descriptions from build menu untill it's got fixed.
- Fixed a bug preventing death when health reaches to 0 or below. Thanks to NightCreature for reporting.

## Changes on Saturday, February 7, 2026
- Assistants and above will now be able to see a player's jail time if they enter a player name along with /jailtime command.
- Some old messages were replaced with new ones, as well as some grammatical mistakes were corrected.
- Fixed a few bugs and made some improvements.
- Fixed a bug where the team name was not displayed in chat after accepting a team invite using the /ati command.

## Changes on Friday, February 6, 2026
- A new item rename command has been added for managers and above.
- Fixed huge cancellation issues related to the feedback, auction, XP, weather menus, and feedback inputs.
- Removed exit timer.

## Changes on Thursday, February 5, 2026
- Updated the player store building process with a new menu interface. Players can now select their desired store type (Clothing, Weapon, Fastfood, etc.) from a list, instead of entering numbers manually.
- You can now teleport to your tent with Telehouse.

## Changes on Wednesday, February 4, 2026
- When a player is away, the player menu displays the exact time instead of the large minute count.
- AFK players will no longer be automatically set to away after 5 minutes of inactivity.
- Fixed an issue where receiving a private message would automatically cancel your away status.

## Changes on Tuesday, February 3, 2026
- Fixed a bug where the door sound played from the left when opening the house door from inside with Alt+Enter.
- Now you can view your tent information from the property info menu from your smartphone.
- Fixed an issue where players could not enter their property due to code length mismatches. Property codes are now limited to a maximum of 6 digits on smartphones, and house, apartment, and tent code fields now support up to 6 digits as well.

## Changes on Sunday, February 1, 2026
- The code that caused screen reader interruptions due to packet loss in incompatible clients while attempting to send team points to the team events buffer has been disabled until the update. We apologize to everyone affected by this issue.
- Changed server notifications.
- Fixed multiple issues with the item carrier, including a sound loop after being destroyed by another player and being unable to send items when only one was in the inventory.

## Significant changes from the past.
- Added a command  for staff to control the weather.
- Added a new game, guess the number. Staff can enable it for players.
- Optimized map system.

## Changes on Sunday, November 30, 2025
- Version 2.49.1 has been released.
- Enhanced fire-starting mechanics: Players can now reliably start fires on various tile types, with checks for safe zones to prevent accidental fires in restricted areas.
- Fixed the full system. It now correctly shows distinct values for thirst and hunger (pee and poo levels).
- Added support for multiple simultaneous auctions. Players can now bid on specific auctions via a menu.
- Default auction timer increased to 2 minutes.
- Added "Peak uptime" tracking to server status.
- Implemented connection limits per IP address to enhance security.
- Implemented secure player authentication to prevent username spoofing.
- Added `/feedback` system for players to send reports and suggestions directly to staff.
- Replaced 'bottle_of_cleanwater' with 'shower_in_a_can' in the survival store.
- Fixed an issue where players could have decimal amounts of items.
- The `/changes` command now allows viewing Server or Client changes separately.
- Server shutdown and reboot notifications now include the reason for all players.
- Fixed a bug where players could send private messages to themselves. Thanks "LC Boy".
- Fixed various spelling errors and cleaned up legacy code.

## Changes on Thursday, November 20, 2025
- Version 2.49 (Pieces of the Broken Clock) has been released.

## Changes on Friday, November 07, 2025
- Packs and boxes resulting from box or empty pack no longer uses ID at the end.
- Bug fixes and improvements.
- Divorce status has been removed.

## Changes on Wednesday, November 05, 2025
- Fixed the bug where you can sell items in the team stores, causing teampoints to be increased.
- Friendship sphere can no longer pass through map's level and reinforcement.

## Changes on Tuesday, November 04, 2025
- Client changes will no longer be present on the server. You can see it in the docs/changes.md in your game folder, starting from the next version.
- Added a new command called `/omutelist` to view who has muted you!
- You can now type the command called `/cmds` to get a list of possible and up to date commands in a text field, now that the `Shift+H` menu might not always update.
- Fixed the bug where gutted / cooked food items cannot be stored in the fridge.
- The auction info now tells the remaining time of auctioning.
- Map owners can now kick players out of their map. Available in the build menu itself. Thanks "Robert".
