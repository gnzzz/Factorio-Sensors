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
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]",
    stack_size = 100
  }
})