-- Rail sensor 

MovingRailSensor = class(RailSensor, function (class,parent,data)
	debugLog("Creating new moving rail sensor")
	class = Sensor.init(class,parent,data)
	class.sensortype = "MovingRailSensor"
	
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

function MovingRailSensor:updateSensor()
	--debugLog("Updating Rail sensor")

	local searchArea = 1
	local topLeft = { self.position.x - searchArea, self.position.y - searchArea }
	local bottomRight = { self.position.x + searchArea, self.position.y + searchArea}
	local entities = game.findentities{topLeft, bottomRight}
	
	local noValidTypes = true
	for i, entity in pairs(entities) do
		if(self:knownTypes(entity.type)) then
			if(entity.train.speed > 0) then
				noValidTypes = false
				--debugLog("Found item " .. i .. ": "..serpent.dump(item.type))
				--debugLog(serpent.dump(self))
				self:copyInventoryToProxy(entity)
			end
		end
	end
	
	if noValidTypes then
		Sensor:emptyProxy(self)
	end
end