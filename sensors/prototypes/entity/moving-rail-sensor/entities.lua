railsensorpicturesinternal = function(elems)
  local keys = {{"straight_rail", "horizontal", 64, 64},
                {"straight_rail", "vertical", 64, 64},
                {"straight_rail", "diagonal", 64, 64},}
  local res = {}
  for _ , key in ipairs(keys) do
    part = {}
    dashkey = key[1]:gsub("_", "-")
    for _ , elem in ipairs(elems) do
      part[elem[1]] = {
        filename = string.format("__Sensors__/graphics/%s/%s-%s-%s.png", dashkey, dashkey, key[2], elem[2]),
        priority = "extra-high",
        width = key[3],
        height = key[4]
      }
    end
    res[key[1] .. "_" .. key[2]] = part
  end
  res["rail_endings"] = {
    sheet =
    {
      filename = "__base__/graphics/entity/rail-endings/rail-endings.png",
      priority = "high",
      width = 88,
      height = 82
    }
  }
  return res
end

railsensorpictures = function()
  return railpicturesinternal({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}})
end

data:extend(
{
  {
    type = "smart-container",
    name = "smart-chest-moving-rail-sensor",
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
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
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
    type = "rail",
    name = "moving-rail-sensor",
    icon = "__base__/graphics/icons/straight-rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 1, result = "moving-rail-sensor"},
    max_health = 100,
    corpse = "straight-rail-remnants",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    bending_type = "straight",
    rail_category = "regular",
    pictures = railsensorpictures()
  }
})