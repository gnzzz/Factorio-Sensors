data:extend(
{
    {
    type = "inserter",
    name = "electrical-actuator-connection",
    icon = "__base__/graphics/icons/smart-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "placeable-off-grid"},
	collision_mask = { "ghost-layer"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electrical-actuator-connection"},
    max_health = 40,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, 0},
    insert_position = {0, 0},
    energy_per_movement = 1,
    energy_per_rotation = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "-0.0063kW"
    },
    extension_speed = 0.07,
    fast_replaceable_group = "inserter",
    filter_count = 5,
    hand_base_picture =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    hand_closed_picture =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    hand_open_picture =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    hand_base_shadow =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    hand_closed_shadow =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    hand_open_shadow =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    platform_picture =
    {
      sheet=
      {
        filename = "__Sensors__/graphics/trans.png",
        priority = "extra-high",
        width = 0,
        height = 0,
        axially_symmetrical = false,
        direction_count = 4,
        shift = {1.4, -1.0}
      }
    },
    programmable = true,
    rotation_speed = 0.035
      },
      {
    type = "electric-pole",
    name = "electrical-actuator",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electrical-actuator"},
    max_health = 100,
    corpse = "small-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = 9,
    supply_area_distance = 3.5,
    pictures =
    {
      filename = "__Sensors__/graphics/electrical-actuator/electrical-actuator-base.png",
      priority = "high",
      width = 136,
      height = 122,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {1.4, -1.0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.55, 0.4},
          green = {2.0, 0.4},
          red = {3.05, 0.4}
        },
        wire =
        {
          copper = {-0.03, -2.5},
          green = {-0.35,-2.5},
          red = {0.25,-2.5}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.1},
          green = {2.6, -0.15},
          red = {3.25, 0.35}
        },
        wire =
        {
          copper = {0.05, -2.75},
          green = {-0.15, -2.9},
          red = {0.25, -2.55}
        }
      },
      {
        shadow =
        {
          copper = {1.5, -0.2},
          green = {1.5, -0.55},
          red = {1.5, 0.1}
        },
        wire =
        {
          copper = {-0.43, -2.4},
          green = {-0.43, -2.63},
          red = {-0.43, -2.2}
        }
      },
      {
        shadow =
        {
          copper = {2.88, 0.2},
          green = {3.2, -0.1},
          red = {2.45, 0.4}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {0.22, -2.85},
          red = {-0.24, -2.55}
        }
      }
    },
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    }
  }
})