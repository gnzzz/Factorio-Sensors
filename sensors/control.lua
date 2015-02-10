-- Debug functions needs to be in global scope to be able to be called from the classes

function debugLog(message)
	if false then -- set for debug
		game.player.print(math.floor(game.tick / 60) .. " : " .. message)
	end
end

--

module(..., package.seeall)
require "defines"
require "util"

require "class"
require "sensors.sensor"
require "actuators.actuator"

-- Rail sensors
require "sensors.railsensor"
require "sensors.movingrailsensor"
require "sensors.standingrailsensor"

-- Daylight sensor
require "sensors.daylightsensor"

-- Electrical Actuator
require "actuators.electricalactuator"

-- Initialisation
game.oninit(function() oninit() end)
game.onload(function() onload() end)

-- Entity was placed on map
game.onevent(defines.events.onbuiltentity, function(event) onbuiltentity(event) end)
game.onevent(defines.events.onrobotbuiltentity, function(event) onbuiltentity(event) end)

-- Entity item was removed from the map
game.onevent(defines.events.onentitydied, function(event) onentityremoved(event) end)
game.onevent(defines.events.onpreplayermineditem, function(event) onentityremoved(event) end)
game.onevent(defines.events.onrobotpremined, function(event) onentityremoved(event) end)

-- Main loop
game.onevent(defines.events.ontick, function(event) ontick(event) end)


function oninit()
	debugLog("init")
	glob.sensors = glob.sensors or {}
	glob.actuators = glob.actuators or {}
end

function onload()
	debugLog("load")
	glob.sensors = glob.sensors or {}
	glob.actuators = glob.actuators or {}
	
	for i,asensor in pairs(glob.sensors) do	
--		debugLog("Loaded sensor: " .. i .. " - " .. serpent.dump(asensor))
--		debugLog("Check: " .. asensor.is_a(Sensor))
--		--asensor:updateSensor()
		if asensor.sensortype == "Sensor" then
			--glob.sensors[i] = RailSensor(asensor.parent,asensor)
		elseif asensor.sensortype == "RailSensor" then
			glob.sensors[i] = RailSensor(asensor.parent,asensor)
		elseif asensor.sensortype == "MovingRailSensor" then
			glob.sensors[i] = MovingRailSensor(asensor.parent,asensor)
		elseif asensor.sensortype == "StandingRailSensor" then
			glob.sensors[i] = StandingRailSensor(asensor.parent,asensor)
		elseif asensor.sensortype == "DaylightSensor" then
			glob.sensors[i] = DaylightSensor(asensor.parent,asensor)
		end
	end
	
	for i,anactuator in pairs(glob.actuators) do
--		debugLog("Loaded actuator: " .. i .. " - " .. serpent.dump(anactuator))

		if anactuator.sensortype == "Actuator" then
			--glob.actuators[i] = Actuator(anactuator.parent,anactuator)
		elseif anactuator.sensortype == "ElectricalActuator" then
			glob.actuators[i] = ElectricalActuator(anactuator.parent,anactuator)
		end
	end
end

function ontick(event)
--	debugLog("tick")
	for i,asensor in pairs(glob.sensors) do	
--		debugLog("Checking sensor: " .. i .. " - " .. serpent.dump(asensor))
		asensor:updateSensor()
	end
	for i,anactuator in pairs(glob.actuators) do	
		anactuator:updateSensor()
	end
end

function onbuiltentity(event)
--	debugLog("Build event: " .. serpent.dump(event))
	local entity = event.createdentity
	if entity.name == "rail-sensor" then
		table.insert(glob.sensors, RailSensor(entity))
	elseif entity.name == "moving-rail-sensor" then
		table.insert(glob.sensors, MovingRailSensor(entity))
	elseif entity.name == "standing-rail-sensor" then
		table.insert(glob.sensors, StandingRailSensor(entity))
	elseif entity.name == "daylight-sensor" then
		table.insert(glob.sensors, DaylightSensor(entity))
	elseif entity.name == "electrical-actuator" then
		table.insert(glob.actuators, ElectricalActuator(entity))
	end
end

function onentityremoved(event)
--	debugLog("Removal event: " .. serpent.dump(event))
	local entity = event.entity
	if isKnownSensor(entity.name) then
		debugLog("A sensor was removed!")
		local sensorPos = findSensorPosition(entity)
		debugLog("Senser pos: "..sensorPos)
		local sensor = table.remove(glob.sensors, sensorPos)
		debugLog("Sensor: " .. serpent.dump(sensor))
		sensor:remove()
	end
end

function isKnownSensor(entity_name)
--	debugLog("Registered sensor names: " .. serpent.dump(glob.sensorNames))
	if( glob.sensorNames ~= nil and glob.sensorNames[entity_name] ~= nil ) then
		return true
	end
end

function findSensorPosition(entity)
	for i,asensor in pairs(glob.sensors) do	
		if(asensor.parent.equals(entity)) then
			return i
		end
	end
end


