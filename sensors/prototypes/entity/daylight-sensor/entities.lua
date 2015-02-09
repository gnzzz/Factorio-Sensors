data:extend(
{
  {
    type = "smart-container",
    name = "smart-chest-daylight-sensor",
    icon = "__base__/graphics/icons/smart-chest.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
	collision_mask = { "ghost-layer"},
    max_health = 150,
    resistances = 
    {
      {
        type = "fire",
        percent = 70
      }
    },
    selection_box = {{-0.25, -0.25}, {0.25, 0.25}},
    inventory_size = 48,
    picture =
    {
      filename = "__Sensors__/graphics/trans.png",
      priority = "very-low",
      width = 1,
      height = 1,
      shift = {0, 0}
    },
    connection_point =
    {
      shadow =
      {
        red = {0.7, -0.3},
        green = {0.7, -0.3}
      },
      wire =
      {
        red = {-0.8, -0.8},
        green = {-0.8, -0.8}
      }
    }
  },
  {
    type = "lamp",
    name = "daylight-sensor",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "daylight-sensor"},
    max_health = 55,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "1KW",
    light = {intensity = 0.1, size = 40},
    picture_off =
    {
      filename = "__base__/graphics/entity/small-lamp/small-lamp.png",
      priority = "high",
      width = 83,
      height = 75,
      shift = {0, -0.1}
    },
    picture_on =
    {
      filename = "__base__/graphics/entity/small-lamp/small-lamp.png",
      priority = "high",
      width = 83,
      height = 75,
      x = 83,
      shift = {0, -0.1}
    }
  }
})