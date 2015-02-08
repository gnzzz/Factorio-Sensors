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
	return class
end)

function Sensor:updateSensor()
	--debugLog("This shouldn't be called!")
end

function Sensor:createProxy(parent, proxyType, makeOperable)
	--debugLog("Creating new sensor proxy")
	
	if makeOperable == nil then
		makeOperable = false
	end
	
	local proxy = {}
	if parent ~= nil and parent.valid then
		local proxyPosition = parent.position
--		--debugLog("**PROXY x: " .. proxyPosition.x .. " y: " .. proxyPosition.y)
--		--debugLog("**PARENT x: " .. parent.position.x .. " y: " .. parent.position.y)
		--debugLog("Creating " .. proxyType .. " at " .. proxyPosition.x .. " " .. proxyPosition.y)
		
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

function getItemDifference(item, syncFromItemCount, syncToItemCount)
	if syncFromItemCount == nil then
		if syncToItemCount ~= nil then
			return 0 - syncToItemCount
		end
	elseif syncToItemCount == nil then 
		return syncFromItemCount
	else
		return syncFromItemCount - syncToItemCount
	end
	
	return 0
end

function Sensor:remove()
	Sensor:emptyProxy(self)
	self.proxy.destroy()
end