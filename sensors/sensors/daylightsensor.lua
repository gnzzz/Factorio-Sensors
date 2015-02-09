-- Daylight sensor 

DaylightSensor = class(Sensor, function (class,parent,data)
	debugLog("Creating new daylight sensor")
	class = Sensor.init(class,parent,data)
	class.sensortype = "DaylightSensor"

	if(data == nil) then
		if parent ~= nil then	
			class.valid = true
			class.parent = parent
			class.position = parent.position
			class.proxy = class:createProxy(parent)
		
			--debugLog("Sensor proxy: " .. serpent.dump(class.proxy.type))
		end	
	else
		--debugLog("Recreating class")
		
		class.valid = data.valid
		class.parent = data.parent
		class.position = data.position
		class.proxy = data.proxy
	end
	
	return class
end)

function DaylightSensor:updateSensor()
	debugLog("Updating daylight sensor")

	Sensor:emptyProxy(self)
	self:addToProxy("light-amount",math.floor(game.darkness*100))
end

function DaylightSensor:createProxy(parent)
	local proxyType = "smart-chest-daylight-sensor"
	return Sensor:createProxy(parent, proxyType)
end