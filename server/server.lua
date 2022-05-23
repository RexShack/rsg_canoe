
-- canoe
exports['qbr-core']:CreateUseableItem("canoe", function(source, item)
    local Player = exports['qbr-core']:GetPlayer(source)
	TriggerClientEvent("rsg_canoe:client:lauchcanoe", source, item.name)
end)