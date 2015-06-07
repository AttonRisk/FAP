hold =[[
------------------------------------------------------------------------------------------------
--Name: aCore ----------------------------------------------------------------------------------
--Dev: Atton Risk   ----------------------------------------------------------------------------
--Status: Development Finished and Public ------------------------------------------------------
--Year: 2013/2014 ------------------------------------------------------------------------------
--Usage: For non-commercial uses and entertainment  --------------------------------------------
--Version: v1.2 --------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
]]

f,d,a = 112,219,244;

function getInfoData (plr)
	if plr then
		local ip = getPlayerIP(plr);
		local na = getPlayerName(plr);
		local se = getPlayerSerial(plr);
		if ip and na and se then
			return ip, na, se;
		else
			return false;
		end
	end
end;

function respawn (plr)
	if plr then
		local x,y,z = getElementPosition(plr);
			if x and y and z then
				if spawnPlayer(plr, x, y, z) then
					outputChatBox("You have been respawned!", plr, 0, 255,0);
				else
			end
		end
	end
end;
addEvent("aCore.RespawnPlayer", true);
addEventHandler("aCore.RespawnPlayer", getRootElement(), respawn);

function GETINFO (plr)
	local ip = getPlayerIP(plr);
	local na = getPlayerName(plr);
	local se = getPlayerSerial(plr);
	outputChatBox(tostring(na),plr,f,d,a);
	outputChatBox(tostring(se),plr,f,d,a);
	outputChatBox(tostring(ip),plr,f,d,a);
end;
addEvent("aCore.getPlayerInfo", true);
addEventHandler("aCore.getPlayerInfo", getRootElement(), GETINFO);

function FIXCARf (plr)
local plrveh = getPedOccupiedVehicle (plr);
	if (plrveh) then
		fixVehicle(plrveh);
	else
		outputChatBox("Might be a good idea to get into a car!",plr,255,0,0);
	end
end;
addEvent("aCore.fixPlayerCar", true);
addEventHandler("aCore.fixPlayerCar", getRootElement(), FIXCARf);

function toggleEngine(plr)
	local veh = getPedOccupiedVehicle(plr);
	if (not veh) then
		return false;
	end
	if (getVehicleEngineState(veh)) then
		setVehicleEngineState(veh, false);
		outputChatBox("Engine OFF!", plr, 255, 0, 0);
		local engineStatus = false;
	else
		setVehicleEngineState(veh, true);
		outputChatBox("Engine ON!",plr, 0, 255, 0);
		local engineStatus = true;
	end
end;
addEvent("aCore.ssEngine", true);
addEventHandler("aCore.ssEngine", getRootElement(), toggleEngine);

function FullHealf ()
	setElementHealth ( source, 100 );
	setPedArmor ( source, 100 );
end
addEvent("aCore.healPlayer", true);
addEventHandler("aCore.healPlayer", getRootElement(), FullHealf);

function blowup ()
	local x,y,z = getElementPosition(source);
	createExplosion(x,y,z,10);
end
addEvent("aCore.blowUpPlayer", true);
addEventHandler("aCore.blowUpPlayer", getRootElement(), blowup);

function Cloakf(plr)
    if getElementAlpha(plr) == 255 then
	       setPlayerNametagShowing(plr,false);
		   setElementAlpha(plr,0);
		   outputChatBox("You are cloaked!",plr,0,255,0);
		   setPlayerNametagShowing(plr,false);
    else
	     setPlayerNametagShowing(plr,true);
	     setElementAlpha ( plr, 255 );
		 outputChatBox("You are uncloaked!",plr,255,0,0);
		 setPlayerNametagShowing(plr,true);
	end
end;
addEvent("aCore.cloak", true);
addEventHandler("aCore.cloak", getRootElement(), Cloakf);

function Cloakcf(plr)
local DM = getPedOccupiedVehicle(plr)
	if (isPedInVehicle(plr)) then 
		if (not DM) then
	    return;
    end;
		if getElementAlpha(DM) == 255 then
		   setElementAlpha(DM,0);
			outputChatBox("Your car is cloaked!",plr,0,255,0);
    else
			setElementAlpha ( DM, 255 );
			outputChatBox("Your car is uncloaked!",plr,255,0,0);
		end
	end
end;
addEvent("aCore.cloakCar", true);
addEventHandler("aCore.cloakCar", getRootElement(), Cloakcf);


function DMGf (plr)
local DM = getPedOccupiedVehicle(plr);
	if (isPedInVehicle(plr)) then 
		if (not DM) then
		return;
		end;
		if isVehicleDamageProof(DM) == false then
			setVehicleDamageProof(DM,true);
			outputChatBox("Damage Proof On!",plr,0,255,0);
		else
			setVehicleDamageProof(DM,false);
			outputChatBox("Damage Proof Off!",plr,255,0,0);
		end
	end
end;
addEvent("aCore.damageProof", true);
addEventHandler("aCore.damageProof", getRootElement(), DMGf);

function BLOWf (plr)
local BM = getPedOccupiedVehicle (plr);
	if (BM) then
		blowVehicle(BM);
		outputChatBox("Boom Bitch!",plr,255,0,0);
	else
        outputChatBox("You are not in a car or buged!",plr,255,0,0);
	end
end
addEvent("aCore.blowUpCar", true);
addEventHandler("aCore.blowUpCar", getRootElement(), BLOWf);


function Gmf (thePlayer)
    if getElementData(thePlayer,"invincible") then
        setElementData(thePlayer,"invincible",false);
        outputChatBox("Godmode inactive!",thePlayer,255,0,0);
    else
        setElementData(thePlayer,"invincible",true);
        outputChatBox("Godmode active!",thePlayer,0,255,0);
    end;
end
addEvent("aCore.godmode", true);
addEventHandler("aCore.godmode", getRootElement(), killPlayer);

function killPlayer (plr)
	if plr then
		if killPed(plr) then
			outputChatBox("You are dead not big surprise!", plr ,0 ,255,0);
		else
			-- Place Holder
		end
	end
end;
addEvent("aCore.killPlayer", true);
addEventHandler("aCore.killPlayer", getRootElement(), killPlayer);

local ids = {
	{id=32},
	{id=31},
	{id=34},
	{id=38},
	{id=41},
}

function fullKit (plr)
	for a,b in pairs(ids) do
		setPedArmor ( plr, 100 );
		giveWeapon(plr, b["id"]);
	end
end;
addEvent("aCore.fullKit", true);
addEventHandler("aCore.fullKit", getRootElement(), fullKit);

-- Old code disused or shit
--[[
--Goes into Gmf to make it ask for admin

local account = getPlayerAccount(thePlayer)
if (not account or isGuestAccount(account)) then return end
local accountName = getAccountName(account)
if ( isObjectInACLGroup ( "user.".. accountName, aclGetGroup ( "Admin" ) ) ) then

function RespawnF (plr)
   setCameraTarget(plr,plr)
   setElementPosition(plr,-687.86841,939.05432,13.63281,true)
   fadeCamera(plr, true)
   setElementFrozen(plr, false)
   outputChatBox("You are home.",plr)   
end
addEvent("GUITESTING.Respawn", true)
addEventHandler("GUITESTING.Respawn", root, RespawnF)

if getElementData(source,"dead") then
	killPed(source)
	outputChatBox("You are dead.",source)
	setElementData(source,"dead",false)
	end
function KillF(plr)
	 killPed(plr)
	outputChatBox("You are dead.",source)
end
addEvent("GUITESTING.killSource", true)
addEventHandler("GUITESTING.killSource", root, KillF)

]]--
