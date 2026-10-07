# Repo

## SMB3 Co-op Assist (FCEUX Lua)

Added script:

- `/home/runner/work/Repo/Repo/tools/smb3_coop_assist_fceux.lua`

Purpose:

- Keeps player 2 close to player 1
- Prevents player 2 from leaving the visible camera area
- Forces camera behavior to follow player 1 only

How to run in FCEUX:

1. Open your SMB3 ROM in FCEUX.
2. Open `File -> Lua -> New Lua Script Window`.
3. Load `/home/runner/work/Repo/Repo/tools/smb3_coop_assist_fceux.lua`.
4. Start the level in your 2-player co-op hack.

If behavior is not perfect with your ROM version/hack, edit RAM addresses in `CONFIG` at the top of the script.