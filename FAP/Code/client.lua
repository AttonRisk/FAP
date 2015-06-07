hold =[[
------------------------------------------------------------------------------------------------
--Name: FuckAroundPanel ------------------------------------------------------------------------
--Dev: Atton Risk   ----------------------------------------------------------------------------
--Status: Development Finished and Public ------------------------------------------------------
--Year: 2013/2014 ------------------------------------------------------------------------------
--Usage: For non-commercial uses and entertainment  --------------------------------------------
--Version: v1.2 --------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
]]

--[[===============================================================================================================================]]--	
	--Gui Stuff
    local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 552, 476
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	Agui = guiCreateWindow(left, top, windowWidth, windowHeight, "Fuck Around Panel v1.2 By Atton", false)
	guiWindowSetSizable(Agui, false)
	guiSetVisible(Agui, false)
--[[===============================================================================================================================]]--	
	-- More gui stuff
	fkb = guiCreateButton(20, 35, 121, 61, "Full Kit", false, Agui)
	CloseB = guiCreateButton(160, 315, 241, 111, "Close", false, Agui)
	killB = guiCreateButton(150, 35, 121, 61, "Kill Player", false, Agui)
	bub = guiCreateButton(280, 35, 121, 61, "Respawn", false, Agui)
	dmgb = guiCreateButton(150, 105, 121, 61, "Damage Proof", false, Agui)
	blowb = guiCreateButton(20, 105, 121, 61, "Blow Car", false, Agui)
	cloakb = guiCreateButton(280, 105, 121, 61, "Cloak", false, Agui)
	healB = guiCreateButton(20, 175, 121, 61, "Heal", false, Agui)
	engineB = guiCreateButton(410, 35, 121, 61, "Engine On/Off", false, Agui)
    fixb = guiCreateButton(410, 105, 121, 61, "Fix Car", false, Agui)
	gifb = guiCreateButton(150, 175, 121, 61, "Get Info", false, Agui)
	CCB = guiCreateButton(280, 175, 121, 61, "Cloak Car", false, Agui)
	stickyb = guiCreateButton(410, 175, 121, 61, "Sticky Wheel’s", false, Agui)
	fcb = guiCreateButton(80, 245, 121, 61, "Flying Cars", false, Agui)
	hcb = guiCreateButton(210, 245, 121, 61, "Hovercars", false, Agui)
	sjb = guiCreateButton(340, 245, 121, 61, "Super Jump", false, Agui)

	playb = guiCreateButton(420, 315, 101, 51, "Play/Stop", false, Agui)
--	stopb = guiCreateButton(420, 375, 101, 51, "Stop", false, Agui)
	TBDEV = guiCreateEdit(10, 335, 113, 21, " Music URL", false, Agui)
	guiEditSetMaxLength(TBDEV, 32767)
--[[===============================================================================================================================]]--	
-- This was removed from here!
--[[===============================================================================================================================]]--	


local flyingcars,hovercars,extrajump = false,false,false;

function flyingCars()
	if (not flyingcars) then
		setWorldSpecialPropertyEnabled("aircars", true);
		flyingcars = true;
		outputChatBox("Flying cars Enabled!", 0, 255, 0);
	else
		setWorldSpecialPropertyEnabled("aircars", false);
		flyingcars = false;
		outputChatBox("Flying cars disabled!", 0, 255, 0);
	end
end;
addEventHandler("onClientGUIClick",fcb,flyingCars, false);


function hoverCars()
	if (not hovercars) then
		setWorldSpecialPropertyEnabled("hovercars", true);
		hovercars = true;
		outputChatBox("Hovercars Enabled!", 0, 255, 0);
	else
		setWorldSpecialPropertyEnabled("hovercars", false);
		hovercars = false;
		outputChatBox("Hovercars disabled!", 0, 255, 0);
	end
end;
addEventHandler("onClientGUIClick",hcb,hoverCars, false);


function extraJump()
	if (not extrajump) then
		setWorldSpecialPropertyEnabled("extrajump", true);
		setGravity(0.002);
		extrajump = true;
		outputChatBox("'Roo' Enabled!", 0, 255, 0);
	else
		setWorldSpecialPropertyEnabled("extrajump", false);
		setGravity(0.008);
		extrajump = false;
		outputChatBox("'Roo' disabled!", 0, 255, 0);
	end
end;
addEventHandler("onClientGUIClick",sjb,extraJump, false);

function Aguif()
	if (guiGetVisible(Agui)) then
		guiSetVisible(Agui, false);
		showCursor(false);
	else
		guiSetVisible(Agui, true);
		showCursor(true);
	end
end;
bindKey ("F2","down", Aguif);
--[[===============================================================================================================================]]--	

function CCF ()
	triggerServerEvent("aCore.cloakCar", localPlayer, localPlayer);
	Aguif()
end
addEventHandler("onClientGUIClick",CCB,CCF, false)

function gif ()
	triggerServerEvent("aCore.getPlayerInfo", localPlayer, localPlayer);
end
addEventHandler("onClientGUIClick",gifb,gif, false)

function FIXf ()
	triggerServerEvent("aCore.fixPlayerCar", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick",fixb,FIXf, false)

function Enginef ()
	triggerServerEvent("aCore.ssEngine", localPlayer, localPlayer);
end	
addEventHandler("onClientGUIClick",engineB,Enginef, false)
	
function FHF ()
	triggerServerEvent("aCore.healPlayer", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick", healB, FHF, false)	

function CloseF()
		guiSetVisible(Agui, false);
		showCursor(false);
end
addEventHandler("onClientGUIClick", CloseB, CloseF, false)

function bubF()
	triggerServerEvent("aCore.RespawnPlayer", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick", bub, bubF, false)

function killf ()
	triggerServerEvent("aCore.killPlayer", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick", killB, killf, false)

function CloakF ()
	triggerServerEvent("aCore.cloak", localPlayer, localPlayer);
	Aguif ();
end
addEventHandler("onClientGUIClick", cloakb, CloakF, false)

function DMGF ()
    triggerServerEvent("aCore.damageProof", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick", dmgb, DMGF, false)

function fullKit ()
	triggerServerEvent("aCore.fullKit", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick", fkb, fullKit, false)

function XT ()
    triggerServerEvent("aCore.blowUpCar", localPlayer, localPlayer);
	Aguif();
end
addEventHandler("onClientGUIClick", blowb, XT, false)

local rads = false;

function radio ()
	local link = guiGetText(TBDEV);
		if (not rads) then
			music = playSound(link);
			if music then
				rads = true;
				outputChatBox("Music ON",localPlayer);
		else
				stopSound(music);
				rads = false;
				outputChatBox("Music OFF",localPlayer);
		end
	end		
end;
addEventHandler("onClientGUIClick", playb, radio, false)

switch = {}
function stickyf (player)
local veh = getPedOccupiedVehicle(getLocalPlayer());
 if veh then
	if not switch[player] then
		addEventHandler("onClientRender",getRootElement(),stickyWheels);
				outputChatBox("Sticky Wheels Engaged",source,0,255,0);
			switch[player] = true;
		else
	if switch[player] then	
		removeEventHandler("onClientRender",getRootElement(),stickyWheels);
				outputChatBox("Sticky Wheels Disengaged",source,255,0,0);
				setVehicleGravity(veh,0,0,-1);
			switch[player] = nil;
			end
		end
	end
end
addEventHandler("onClientGUIClick", stickyb, stickyf, false)

function killExit ()
	cancelEvent();
end

--[[
addEventHandler("onClientVehicleExit", getRootElement() , stickyf)
addEventHandler("onClientVehicleExit", getLocalPlayer() , killSticky)
addCommandHandler("killsticky",killSticky)
]]--


--[[===============================================================================================================================]]--	
--Sticky Systems
function getPositionUnderTheElement(element)
    local matrix = getElementMatrix (element);
    local offX = 0 * matrix[1][1] + 0 * matrix[2][1] - 1 * matrix[3][1] + matrix[4][1];
    local offY = 0 * matrix[1][2] + 0 * matrix[2][2] - 1 * matrix[3][2] + matrix[4][2];
    local offZ = 0 * matrix[1][3] + 0 * matrix[2][3] - 1 * matrix[3][3] + matrix[4][3];
    return offX,offY,offZ;
end

function stickyWheels()
    local veh = getPedOccupiedVehicle(getLocalPlayer());
		if veh then
	local x,y,z = getElementPosition(veh);
    local ux,uy,uz = getPositionUnderTheElement(veh);
		if (veh) then
			if (x and y and z) then
				if (ux and uy and uz) then
				setVehicleGravity(veh,ux - x,uy - y,uz - z);
				return true;
			else
				return false;
				end
			end
		end
	end
end;


--[[===============================================================================================================================]]--	
-- This is the rocket system made by Rozza 2012 / 2013 used on NBG and ported to JFAfuckaroundpanel.

isRocketEnabled = false;
boost = 1.01;
function doIHavePermission()
	if (not getPedOccupiedVehicle(localPlayer)) then return false end
	if (getElementDimension(localPlayer) ~= 0 and getElementDimension(localPlayer) ~= 10) then
		return false;
	end
end;
	
function gogoRocket()
	if (getPedOccupiedVehicle(localPlayer)) then
		if (getVehicleController(getPedOccupiedVehicle(localPlayer)) == localPlayer) then
			if (isVehicleOnGround(getPedOccupiedVehicle(localPlayer)) or isElementInWater(getPedOccupiedVehicle(localPlayer))) then
				if (getAnalogControlState("accelerate") == 1) then
					local velX, velY, velZ = getElementVelocity(getPedOccupiedVehicle(localPlayer));
					local a = setElementVelocity(getPedOccupiedVehicle(localPlayer), velX * boost, velY * boost, velZ);
				end
			end
		end
	end
end;

function changeBoost(_, val)
	local val = tonumber(val);
	if (val == 1) then
		boost = 1.01;
	elseif (val == 2) then
		boost = 1.02;
	elseif (val == 3) then
		boost = 1.03;
	elseif (val == 4) then
		boost = 1.04;
	elseif (val == 5) then
		boost = 1.05;
	elseif (val == 6) then
		boost = 1.06;
	end;
	outputChatBox("Boost: " .. boost);
end;
addCommandHandler("boost", changeBoost);

function startRocket()
	addEventHandler("onClientRender", root, gogoRocket);
	isRocketEnabled = true;
end;

function killRocket()
	if (isRocketEnabled) then
		removeEventHandler("onClientRender", root, gogoRocket);
		isRocketEnabled = false;
	end
end;

function bindStuff()
	bindKey("lshift", "down", startRocket);
	bindKey("lshift", "up", killRocket);
end;
bindStuff();

--[[===============================================================================================================================]]--	