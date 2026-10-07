# Repo

## SMB3 2P Co-op ROM Hack (Ready .nes)

This branch now contains ready patched ROM hack files:

- `/home/runner/work/Repo/Repo/Super Mario Bros. 3 (USA) [2P Co-op v1].nes`
- `/home/runner/work/Repo/Repo/Super Mario Bros. 3 (USA) [2P Co-op].nes` (v2)

Based on IPS patch source:

- `/home/runner/work/Repo/Repo/patches/smb3_2p.ips` (v1)
- `/home/runner/work/Repo/Repo/patches/smb3_2p_v2.ips` (v2)
- Original project: https://github.com/ErikHK/smb32p

### Files and SHA-256

- `Super Mario Bros. 3 (USA).nes`  
  `6ea0777ca520ba7ad7b0ea0f6452140d59aa0b1dffe5045cb1e8020dde10c267`
- `Super Mario Bros. 3 (USA) [2P Co-op v1].nes`  
  `5594d93e002fc2a3a25cd8356aee061b11a6296624449fd312339681d463ecdf`
- `Super Mario Bros. 3 (USA) [2P Co-op].nes`  
  `bbd2d771fbf2771c784c777b18f1169b8e32671bd361df67cac52c42abd69707`
- `patches/smb3_2p.ips`  
  `e13de90edb1747d890521c85fa65d609a744b302a5a667feaaee853e481dab60`
- `patches/smb3_2p_v2.ips`  
  `a17640a5452643b2f3824eb3ec7166990d0caf135af5d797878403e2d980cd9a`

### How to test

1. Open `Super Mario Bros. 3 (USA) [2P Co-op v1].nes` first in FCEUX (or any NES emulator).
2. Test player 2 movement, jump, and interactions.
3. If v1 is not stable on your emulator, test `Super Mario Bros. 3 (USA) [2P Co-op].nes` (v2).

### Optional fallback

If you still want extra camera/player constraints, the Lua helper is available:

- `/home/runner/work/Repo/Repo/tools/smb3_coop_assist_fceux.lua`

Default Lua behavior is now non-aggressive (`enable_tether=false`) so player 2 controls remain useful.