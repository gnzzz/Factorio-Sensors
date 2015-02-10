data:extend(
{
  {
    type = "item",
    name = "electrical-actuator-connection",
    icon = "__base__/graphics/icons/smart-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-d[smart-chest]",
    place_result = "electrical-actuator-connection",
    stack_size = 50
  },
  {
    type = "item",
    name = "electrical-actuator",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-b[medium-electric-pole]",
    place_result = "electrical-actuator",
    stack_size = 50
  }
})