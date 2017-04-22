--local item_D3 = Isaac.GetItemIdByName("D3")
local dthree =  {}

function dthree:onUse()
    --Reroll a random item ont he player
	local player = Game():GetPlayer(0)
	local rng = player:GetCollectibleRNG(CollectibleType.AGONY_C_D3)
	
	if player:GetCollectibleCount() >= 1 then --If the player has collectibles
	    local colletibles = Agony:getCurrentItems()
		local numCol = #(Isaac.GetItemConfig():GetCollectibles())
		if type(numCol) ~= number then
			numCol = CollectibleType.NUM_COLLECTIBLES --do the old way if this fails
		end
        player:RemoveCollectible(colletibles[rng:RandomInt(#colletibles)+1])
        player:AddCollectible(rng:RandomInt(numCol-1)+1, 0, true)
    end
	return true
end

Agony:AddCallback(ModCallbacks.MC_USE_ITEM, dthree.onUse, CollectibleType.AGONY_C_D3)