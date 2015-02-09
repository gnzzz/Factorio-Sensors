data:extend(
{
  {
    type = "item",
    name = "smart-chest-daylight-sensor",
    icon = "__base__/graphics/icons/smart-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-d[smart-chest]",
    place_result = "smart-chest-daylight-sensor",
    stack_size = 50
  },
  {
    type = "item",
    name = "daylight-sensor",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "c[light]-a[small-lamp]",
    place_result = "daylight-sensor",
    stack_size = 50
  },
  {
    type = "item",
    name = "light-amount",
    icon = "__Sensors__/graphics/icons/light-amount.png",
    flags = {"goes-to-quickbar"},
    subgroup = "sensors-metaitems-light",
    order = "a",
    stack_size = 100
  }
})