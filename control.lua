module(..., package.seeall)
require "defines"
require "util"

require "class"
require "sensors.sensor"
require "sensors.railsensor"

game.oninit(function() oninit() end)
game.onload(function() onload() end)

game.onevent(defines.events.onbuiltentity, function(event) onbuiltentity(event) end)
game.onevent(defines.events.onentitydied, function(event) onentityremoved(event) end)
game.onevent(defines.events.onpreplayermineditem, function(event) onentityremoved(event) end)

game.onevent(defines.events.ontick, function(event) ontick(event) end)


function oninit()
	debugLog("init")
	glob.sensors = glob.sensors or {}
end

function onload()
	debugLog("load")
	glob.sensors = glob.sensors or {}
	
	for i,asensor in pairs(glob.sensors) do	
--		debugLog("Loaded sensor: " .. i .. " - " .. serpent.dump(asensor))
--		debugLog("Check: " .. asensor.is_a(Sensor))
--		--asensor:updateSensor()
		if asensor.sensortype == "Sensor" then
			--glob.sensors[i] = RailSensor(asensor.parent,asensor)
		elseif asensor.sensortype == "RailSensor" then
			glob.sensors[i] = RailSensor(asensor.parent,asensor)
		end
	end
end

function ontick(event)
--	debugLog("tick")
	for i,asensor in pairs(glob.sensors) do	
--		debugLog("Checking sensor: " .. i .. " - " .. serpent.dump(asensor))
		asensor:updateSensor()
	end
end

function onbuiltentity(event)
  local entity = event.createdentity
  if entity.name == "rail-sensor" then
	debugLog(serpent.dump(glob.sensors))
--	debugLog("new sensor!")
    table.insert(glob.sensors, RailSensor(entity))
  end
end

function onentityremoved(event)
	debugLog("Event: " .. serpent.dump(event))
  local entity = event.entity
  if entity.name == "rail-sensor" then
--	debugLog(serpent.dump(glob.sensors))
	debugLog("Rail sensor removed!")
	local sensorPos = findSensorPosition(entity)
	debugLog("Senser pos: "..sensorPos)
	local sensor = table.remove(glob.sensors, sensorPos)
	debugLog("Sensor: " .. serpent.dump(sensor))
	sensor:remove()
--    table.insert(glob.sensors, RailSensor(entity))
  end
end

function findSensorPosition(entity)
	for i,asensor in pairs(glob.sensors) do	
		if(asensor.parent.equals(entity)) then
			return i
		end
	end
end

function debugLog(message)
	if false then -- set for debug
		game.player.print(message)
	end
end
