-- Rail sensor 

RailSensor = class(Sensor, function (class,parent,data)
	debugLog("Creating new rail sensor")
	class = Sensor.init(class,parent,data)
	class.sensortype = "RailSensor"

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

function RailSensor:updateSensor()
	--debugLog("Updating Rail sensor")

	local searchArea = 1
	local topLeft = { self.position.x - searchArea, self.position.y - searchArea }
	local bottomRight = { self.position.x + searchArea, self.position.y + searchArea}
	local entities = game.findentities{topLeft, bottomRight}
	
	local noValidTypes = true
	for i, entity in pairs(entities) do
		if(self:knownTypes(entity.type)) then
			noValidTypes = false
			--debugLog("Found item " .. i .. ": "..serpent.dump(item.type))
			--debugLog(serpent.dump(self))
			self:copyInventoryToProxy(entity)
		end
	end
	
	if noValidTypes then
		Sensor:emptyProxy(self)
	end
end

function RailSensor:knownTypes(type)
	if type == "locomotive" or type == "cargo-wagon" then
		return true
	else
		return false
	end
end

function RailSensor:createProxy(parent)
	local proxyType = "smart-chest-rail-sensor"
	return Sensor:createProxy(parent, proxyType)
end

function RailSensor:copyInventoryToProxy(entity)
	--debugLog("Placing inventory in sensor")
	
	self:copyInventory(entity.getinventory(1),self.proxy.getinventory(1))
	
	self:addToProxy(entity.name,1)
	
	local loadedStacks = self:getLoadedStacks(entity.getinventory(1))
	local maxSlots = self:getMaxInventory(entity)
	
	self:addToProxy("cargo-capacity",math.floor((loadedStacks/maxSlots)*100))
end

function RailSensor:getStackSize(itemName)
	glob.stackSizes = glob.stackSizes or {}
	
	if(glob.stackSizes[itemName]) then
		return glob.stackSizes[itemName]
	end
	
	for name,prototype in pairs(game.itemprototypes) do
		if(name == itemName) then
			glob.stackSizes[itemName] = prototype.stacksize
			return glob.stackSizes[itemName]
		end
	end
end

function RailSensor:getLoadedStacks(inventory)
	local stacks = 0.0
	
	if inventory ~= nil then
		local contents = inventory.getcontents()
		for name,count in pairs(contents) do
			local stackSize = self:getStackSize(name)
			stacks = stacks + count/stackSize
		end
	end
	
	return stacks
end

function RailSensor:copyInventory(copyFrom, copyTo, entityName)
	if copyFrom ~= nil and copyTo ~= nil then
		local action = {}
		local fromContents = copyFrom.getcontents()
		local toContents = copyTo.getcontents()
		for name,count in pairs(fromContents) do
				local diff = self:getItemDifference(name,fromContents[name], toContents[name])
				if diff ~= 0 then
					action[name] = diff
				end	
		end
				
		for name,count in pairs(toContents) do
				if fromContents[name] == nul then
					action[name] = self:getItemDifference(name,fromContents[name],toContents[name])
				end
		end

		for name,diff in pairs(action) do
			--debugLog("#################itemName: " .. name .. " diff: " .. diff)
			if diff > 0 then
				copyTo.insert({name=name,count=diff})
			elseif diff < 0 then
				copyTo.remove({name=name,count=0-diff})
			end
		end
	end
end

function RailSensor:getItemDifference(item, syncFromItemCount, syncToItemCount)
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

-- This returns the number of inventory stacks the entity can have. 
-- Since this is hardcoded then it will only work for the cargo containers that are placed here
function RailSensor:getMaxInventory(entity)
	if entity.type == "locomotive" then
		return 3
	elseif entity.type == "cargo-wagon" then
		return 20
	end
end