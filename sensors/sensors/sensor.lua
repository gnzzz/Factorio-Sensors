-- Sensor class definitions and functions

Sensor = class(function(class,parent,data)
	--debugLog("Parent sensor here")
	
	if(data == nil) then
		class.issensor = true
		class.valid = false
	else
		class.issensor = data.issensor
		class.valid = data.valid
	end
	
	if( parent ~= nil) then
		Sensor:registerSensorParent(parent.name)
	end
	
	return class
end)

function Sensor:updateSensor()
	--debugLog("This shouldn't be called!")
end

function Sensor:createProxy(parent, proxyType, makeOperable)
	debugLog("Creating new sensor proxy of type " .. proxyType)
	
	if makeOperable == nil then
		makeOperable = false
	end
	
	local proxy = {}
	if parent ~= nil and parent.valid then
		local proxyPosition = parent.position
--		debugLog("**PROXY x: " .. proxyPosition.x .. " y: " .. proxyPosition.y)
--		debugLog("**PARENT x: " .. parent.position.x .. " y: " .. parent.position.y)
		debugLog("Creating " .. proxyType .. " at " .. proxyPosition.x .. " " .. proxyPosition.y)
		
		game.createentity{name=proxyType, position=proxyPosition, force=game.player.force}
		proxysearch = game.findentitiesfiltered{area = {{proxyPosition.x - 1, proxyPosition.y - 1}, {proxyPosition.x + 1, proxyPosition.y + 1}}, name=proxyType} 
		for i,e in ipairs(proxysearch) do
			proxy = e
		end
		proxy.operable = makeOperable;
		return proxy
	else
		--debugLog("not valid?")
		--debugLog(parent.valid)
	end
	return proxy
end

function Sensor:emptyProxy(sensor)
	if (sensor.proxy.valid) then
		local container = sensor.proxy.getinventory(1)
		local contents = container.getcontents()
		for name,count in pairs(contents) do
			container.remove({name=name,count=count})
		end
	end
end

function Sensor:addToProxy(entityName,amount)
	if self.proxy ~= nil and amount > 0 then
		self.proxy.getinventory(1).insert({name=entityName,count=amount})
	end
end

function Sensor:registerSensorParent(name)
	glob.sensorNames = glob.sensorNames or {}
	
	if(glob.sensorNames[name] == nil) then
		debugLog("Got a new sensor type: " .. name)
		glob.sensorNames[name] = true
	end
end

function Sensor:remove()
	debugLog("Trying to remove sensor")
	Sensor:emptyProxy(self)
	self.proxy.destroy()
end