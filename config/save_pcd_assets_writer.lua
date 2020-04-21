VOXEL_SIZE = 5e-2

include "transform.lua"

options = {
  tracking_frame = "base_link",
  pipeline = {
    {
      action = "min_max_range_filter",
      min_range = 1.,
      max_range = 60.,
    },
    {
      action = "dump_num_points",
    },

    -- Now we recolor our points by frame and write another batch of X-Rays. It
    -- is visible in them what was seen by the horizontal and the vertical
    -- laser.
    {
      action = "color_points",
      frame_id = "horizontal_vlp16_link",
      color = { 255., 0., 0. },
    },
    {
      action = "color_points",
      frame_id = "vertical_vlp16_link",
      color = { 0., 255., 0. },
    },

    {               -- add
      action = "write_pcd", -- add
      filename = "points.pcd",  -- add
    }, 
  }
}

return options