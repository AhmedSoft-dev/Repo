# Repo

## SMB3 2P Co-op ROM Hack (Ready .nes)

This branch now contains a ready patched ROM hack file:

- `/home/runner/work/Repo/Repo/Super Mario Bros. 3 (USA) [2P Co-op].nes`

Based on IPS patch source:

- `/home/runner/work/Repo/Repo/patches/smb3_2p_v2.ips`
- Original project: https://github.com/ErikHK/smb32p

### Files and SHA-256

- `Super Mario Bros. 3 (USA).nes`  
  `6ea0777ca520ba7ad7b0ea0f6452140d59aa0b1dffe5045cb1e8020dde10c267`
- `Super Mario Bros. 3 (USA) [2P Co-op].nes`  
  `bbd2d771fbf2771c784c777b18f1169b8e32671bd361df67cac52c42abd69707`
- `patches/smb3_2p_v2.ips`  
  `a17640a5452643b2f3824eb3ec7166990d0caf135af5d797878403e2d980cd9a`

### How to test

1. Open `Super Mario Bros. 3 (USA) [2P Co-op].nes` in FCEUX (or any NES emulator).
2. Start game and test simultaneous 2-player behavior.

### Optional fallback

If you still want extra camera/player constraints, the Lua helper is still available:

- `/home/runner/work/Repo/Repo/tools/smb3_coop_assist_fceux.lua`