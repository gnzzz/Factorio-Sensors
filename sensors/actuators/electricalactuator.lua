-- Sensor class definitions and functions

ElectricalActuator = class(Actuator, function(class,parent,data)
	debugLog("ElectricalActuator")
	class.sensortype = "ElectricalActuator"
	
	if(data == nil) then
		class.parent = parent
		class.connection = class:createConnection(parent,"electrical-actuator-connection", {["x"] = 0, ["y"] = 0})
		class.connected = true
		class.neighbours = parent.neighbours
	else
		class.parent = data.parent
		class.connection = data.connection
		class.connected = data.connected
	end
	
	return class
end)

function ElectricalActuator:updateSensor()
--	debugLog("Ticking ElectricalActuator")
--	debugLog("Connected: "..tostring(self.connected))
	
	local logicTrue = self:logicNetworkTrue()
	
--	debugLog("Logic network validated: "..tostring(logicTrue))
	
	if (logicTrue and not self.connected) then
		debugLog("Need to connect poles")
		self:connectNetwork()
	elseif (not logicTrue and self.connected) then
		debugLog("Need to disconnect poles")
		self:disconnectNetwork()
	end
end

function ElectricalActuator:disconnectNetwork()
	debugLog("Disconnecting!")
	
	self.neighbours = self.parent.neighbours
	self.parent.disconnectneighbour()
	self.connected = false
end

function ElectricalActuator:connectNetwork()
	debugLog(serpent.dump(self.neighbours))
	
	if ( self.neighbours ~= nil ) then
		for i,pole in pairs(self.neighbours) do
			self.parent.connectneighbour(pole)
		end
	end

	self.connected = true
end
