hold =[[
-- This code was stolen from soild snake 
]]
--============================================================--
    addEventHandler ( "onClientPlayerDamage",root,
    function ()
        if getElementData(source,"invincible") then
            cancelEvent()
        end
    end)
     
    addEventHandler("onClientPlayerStealthKill",localPlayer,
    function (targetPlayer)
        if getElementData(targetPlayer,"invincible") then
            cancelEvent()
        end
    end)
--==========================================================--	
	
