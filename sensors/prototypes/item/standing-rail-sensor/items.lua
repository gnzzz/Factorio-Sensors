data:extend(
{
  {
    type = "item",
    name = "smart-chest-standing-rail-sensor",
    icon = "__base__/graphics/icons/smart-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-d[smart-chest]",
    place_result = "smart-chest-standing-rail-sensor",
    stack_size = 50
  },
  {
    type = "item",
    name = "standing-rail-sensor",
    icon = "__base__/graphics/icons/straight-rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-a[straight-rail]",
    place_result = "standing-rail-sensor",
    stack_size = 50
  }
})