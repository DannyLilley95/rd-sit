local QBCore = exports['qb-core']:GetCoreObject()
local seatsTaken = {}

RegisterNetEvent('rd-sit:takePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('rd-sit:leavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

QBCore.Functions.CreateCallback('rd-sit:getPlace', function(source, cb, objectCoords)
	cb(seatsTaken[objectCoords])
end)
