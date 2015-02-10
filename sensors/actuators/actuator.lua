-- Sensor class definitions and functions

Actuator = class(function(class,parent,data)
	debugLog("Parent actuator here")
	
	if(data == nil) then
		class.isactuator = true
		class.valid = false
	else
		class.isactuator = data.isactuator
		class.valid = data.valid
	end
	
	return class
end)

function Actuator:updateSensor()
	--debugLog("This shouldn't be called!")
end

function Actuator:createConnection(parent, proxyType, proxyPositionShift)
	debugLog("Creating new sensor proxy of type " .. proxyType)
	
	if proxyPositionShift == nil then
		proxyPositionShift = {["x"] = 0, ["y"] = 0}
	end
	
	local proxy = {}
	if parent ~= nil and parent.valid then
--		debugLog("**PROXY x: " .. proxyPosition.x .. " y: " .. proxyPosition.y)
--		debugLog("**PARENT x: " .. parent.position.x .. " y: " .. parent.position.y)
		local proxyPosition = {["x"] = parent.position.x + proxyPositionShift.x, ["y"] = parent.position.y + proxyPositionShift.y}
		debugLog("Creating " .. proxyType .. " at " .. proxyPosition.x .. " " .. proxyPosition.y)
		
		game.createentity{name=proxyType, position=proxyPosition, force=game.player.force}
		proxysearch = game.findentitiesfiltered{area = {{proxyPosition.x - 1, proxyPosition.y - 1}, {proxyPosition.x + 1, proxyPosition.y + 1}}, name=proxyType} 
		for i,e in ipairs(proxysearch) do
			proxy = e
		end
		
		return proxy
	else
		--debugLog("not valid?")
		--debugLog(parent.valid)
	end
	return proxy
end

function Actuator:logicNetworkTrue()
	local state = true
	
	for i = 0,2,1 do
		local condition = self.connection.getcircuitcondition(i)
		if (condition ~= nil) then
			state = state and condition.fulfilled
		end
	end
	
	return state
end

function Actuator:remove()
	debugLog("Trying to remove sensor")
	self.proxy.destroy()
end