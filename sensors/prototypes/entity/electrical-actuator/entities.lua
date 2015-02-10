data:extend(
{
    {
    type = "inserter",
    name = "electrical-actuator-connection",
    icon = "__base__/graphics/icons/smart-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electrical-actuator-connection"},
    max_health = 40,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, 1},
    insert_position = {0, 1},
    energy_per_movement = 1,
    energy_per_rotation = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.1kW"
    },
    extension_speed = 0.07,
    fast_replaceable_group = "inserter",
    filter_count = 5,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    platform_picture =
    {
      sheet=
      {
        filename = "__base__/graphics/entity/smart-inserter/smart-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46
      }
    },
    programmable = true,
    rotation_speed = 0.035,
    uses_arm_movement = "basic-inserter"
  },
    {
    type = "electric-pole",
    name = "electrical-actuator",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electrical-actuator"},
    max_health = 35,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    drawing_box = {{-0.5, -2.3}, {0.5, 0.5}},
    maximum_wire_distance = 7.5,
    supply_area_distance = 2.5,
    pictures =
    {
      filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole.png",
      priority = "extra-high",
      width = 123,
      height = 124,
      axially_symetric = false,
      direction_count = 4,
      shift = {1.4, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          red = {2.3, 0},
          green = {3.1, 0}
        },
        wire =
        {
          copper = {0, -2.7},
          red = {-0.4,-2.7},
          green = {0.4,-2.7}
        }
      },
      {
        shadow =
        {
          copper = {2.7, -0.05},
          red = {2.2, -0.35},
          green = {3, 0.12}
        },
        wire =
        {
          copper = {-0.04, -2.8},
          red = {-0.3, -2.9},
          green = {0.2, -2.6}
        }
      },
      {
        shadow =
        {
          copper = {2.5, -0.1},
          red = {2.55, -0.45},
          green = {2.5, 0.25}
        },
        wire =
        {
          copper = {-0.2, -2.7},
          red = {-0.05, -2.95},
          green = {0, -2.4}
        }
      },
      {
        shadow =
        {
          copper = {2.30, -0.1},
          red = {2.65, -0.40},
          green = {1.75, 0.20}
        },
        wire =
        {
          copper = {0, -2.7},
          red = {0.3, -2.85},
          green = {-0.3, -2.5}
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