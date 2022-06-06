
local WaterTypes = {
    [1] =  {["name"] = "Sea of Coronado",       ["waterhash"] = -247856387, ["watertype"] = "lake"},
    [2] =  {["name"] = "San Luis River",        ["waterhash"] = -1504425495, ["watertype"] = "river"},
    [3] =  {["name"] = "Lake Don Julio",        ["waterhash"] = -1369817450, ["watertype"] = "lake"},
    [4] =  {["name"] = "Flat Iron Lake",        ["waterhash"] = -1356490953, ["watertype"] = "lake"},
    [5] =  {["name"] = "Upper Montana River",   ["waterhash"] = -1781130443, ["watertype"] = "river"},
    [6] =  {["name"] = "Owanjila",              ["waterhash"] = -1300497193, ["watertype"] = "river"},
    [7] =  {["name"] = "HawkEye Creek",         ["waterhash"] = -1276586360, ["watertype"] = "river"},
    [8] =  {["name"] = "Little Creek River",    ["waterhash"] = -1410384421, ["watertype"] = "river"},
    [9] =  {["name"] = "Dakota River",          ["waterhash"] = 370072007, ["watertype"] = "river"},
    [10] =  {["name"] = "Beartooth Beck",       ["waterhash"] = 650214731, ["watertype"] = "river"},
    [11] =  {["name"] = "Lake Isabella",        ["waterhash"] = 592454541, ["watertype"] = "lake"},
    [12] =  {["name"] = "Cattail Pond",         ["waterhash"] = -804804953, ["watertype"] = "lake"},
    [13] =  {["name"] = "Deadboot Creek",       ["waterhash"] = 1245451421, ["watertype"] = "river"},
    [14] =  {["name"] = "Spider Gorge",         ["waterhash"] = -218679770, ["watertype"] = "river"},
    [15] =  {["name"] = "O'Creagh's Run",       ["waterhash"] = -1817904483, ["watertype"] = "lake"},
    [16] =  {["name"] = "Moonstone Pond",       ["waterhash"] = -811730579, ["watertype"] = "lake"},
    [17] =  {["name"] = "Roanoke Valley",       ["waterhash"] = -1229593481, ["watertype"] = "river"},
    [18] =  {["name"] = "Elysian Pool",         ["waterhash"] = -105598602, ["watertype"] = "lake"},
    [19] =  {["name"] = "Heartland Overflow",   ["waterhash"] = 1755369577, ["watertype"] = "swamp"},
    [20] =  {["name"] = "Lagras",               ["waterhash"] = -557290573, ["watertype"] = "swamp"},
    [21] =  {["name"] = "Lannahechee River",    ["waterhash"] = -2040708515, ["watertype"] = "river"},
    [22] =  {["name"] = "Dakota River",         ["waterhash"] = 370072007, ["watertype"] = "river"},
	[23] =  {["name"] = "Sea of Guarma",		["waterhash"] = -1168459546, ["watertype"] = "lake"},
}

RegisterNetEvent('rsg_canoe:client:lauchcanoe')
AddEventHandler('rsg_canoe:client:lauchcanoe', function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			local playerped = PlayerPedId()
			local coords = GetEntityCoords(playerped)
			local water = Citizen.InvokeNative(0x5BA7A68A346A5A91,coords.x+3, coords.y+3, coords.z)
			local canLauch = false
			for k,v in pairs(WaterTypes) do 
				if water == WaterTypes[k]["waterhash"]  then
					canLauch = true           
					break            
				end
			end
			if canLauch then
				local player = PlayerPedId()
				local model = GetHashKey("CANOE")
				local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(player, 0.0, 4.0, 0.5 ))
				local heading = GetEntityHeading(player)
				RequestModel(model)
				while not HasModelLoaded(model) do
					Citizen.Wait(500)
				end
				activeboat = CreateVehicle(model, x, y, z, heading, 1, 1)
				SetVehicleOnGroundProperly(activeboat)
				SetPedIntoVehicle(player, activeboat, -1)
				SetModelAsNoLongerNeeded(model)
			else
				exports['qbr-core']:Notify(9, 'you can\'t take out your boat here!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
			end
		else
			exports['qbr-core']:Notify(9, 'you don\'t have this item!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['canoe'] = 1 })
end)