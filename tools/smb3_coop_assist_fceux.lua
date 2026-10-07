-- SMB3 co-op assist script for FCEUX.
-- Goal: keep player 2 near player 1, keep both on one screen,
-- and keep camera controlled by player 1.
--
-- NOTE:
-- Address defaults are based on common SMB3 RAM maps and may vary by ROM hack.
-- If your hack uses different addresses, edit CONFIG below.

local CONFIG = {
  -- RAM addresses (NES CPU RAM)
  p1_x_addr = 0x0090,
  p1_y_addr = 0x00A2,
  p2_x_addr = 0x0091,
  p2_y_addr = 0x00A3,
  cam_x_addr = 0x0075,

  -- Behavior tuning
  screen_width = 32,      -- in SMB3 coarse X units
  left_margin = 3,        -- allowed gap from left screen edge
  right_margin = 28,      -- allowed gap from right screen edge
  max_follow_gap = 10,    -- max p2 distance from p1 before snapping
  p1_camera_offset = 10,  -- camera offset from p1
}

local function clamp(v, lo, hi)
  if v < lo then return lo end
  if v > hi then return hi end
  return v
end

local function read_u8(addr)
  return memory.readbyte(addr)
end

local function write_u8(addr, val)
  memory.writebyte(addr, val % 0x100)
end

while true do
  local p1x = read_u8(CONFIG.p1_x_addr)
  local p1y = read_u8(CONFIG.p1_y_addr)
  local p2x = read_u8(CONFIG.p2_x_addr)
  local p2y = read_u8(CONFIG.p2_y_addr)
  local camx = read_u8(CONFIG.cam_x_addr)

  -- Force camera to follow player 1 only.
  local target_camx = clamp(p1x - CONFIG.p1_camera_offset, 0, 255)
  if camx ~= target_camx then
    write_u8(CONFIG.cam_x_addr, target_camx)
    camx = target_camx
  end

  -- Keep player 2 inside visible camera bounds.
  local left_bound = clamp(camx + CONFIG.left_margin, 0, 255)
  local right_bound = clamp(camx + CONFIG.right_margin, 0, 255)
  local bounded_p2x = clamp(p2x, left_bound, right_bound)

  -- Keep player 2 near player 1 (co-op tether).
  if math.abs(bounded_p2x - p1x) > CONFIG.max_follow_gap then
    if bounded_p2x < p1x then
      bounded_p2x = p1x - CONFIG.max_follow_gap
    else
      bounded_p2x = p1x + CONFIG.max_follow_gap
    end
    bounded_p2x = clamp(bounded_p2x, left_bound, right_bound)
  end

  if bounded_p2x ~= p2x then
    write_u8(CONFIG.p2_x_addr, bounded_p2x)
  end

  -- Keep player 2 roughly aligned vertically with player 1 if too far.
  if math.abs(p2y - p1y) > 20 then
    write_u8(CONFIG.p2_y_addr, p1y)
  end

  emu.frameadvance()
end
