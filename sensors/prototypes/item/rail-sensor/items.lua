data:extend(
{
  {
    type = "item",
    name = "smart-chest-rail-sensor",
    icon = "__base__/graphics/icons/smart-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-d[smart-chest]",
    place_result = "smart-chest-rail-sensor",
    stack_size = 50
  },
  {
    type = "item",
    name = "rail-sensor",
    icon = "__base__/graphics/icons/straight-rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-a[straight-rail]",
    place_result = "rail-sensor",
    stack_size = 50
  },
  {
    type = "item",
    name = "cargo-capacity",
    icon = "__Sensors__/graphics/icons/cargo-capacity.png",
    flags = {"goes-to-quickbar"},
    subgroup = "sensors-metaitems-rail",
    order = "a[sensors-metaitems]-a[rail-sensor]",
    stack_size = 100
  },
  {
    type = "item",
    name = "train-speed",
    icon = "__Sensors__/graphics/icons/train-speed.png",
    flags = {"goes-to-quickbar"},
    subgroup = "sensors-metaitems-rail",
    order = "a[sensors-metaitems]",
    stack_size = 10000
  }
})