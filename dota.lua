--metatables
ABILITY = {type, level}
PLAYER = {handle, level, money}

--data tables
--hardpoint type = {level 1 weapon, ..., level 4 weapon}
CANNON = {"minigun.odf", "at-stabber.odf", "sp-stabber.odf", "blast cannon.odf"}
MORTAR = {"mortar.odf", "mdm.odf", "pop gun.odf", "splinter.odf"}
ROCKET = {"shadower.odf", "hornet.odf", "rocket.odf", "comet.odf"}
SPECIAL = {"prox mine.odf", "solar flare.odf", "mcurtain.odf", "thumper.odf"}
--sandbag would be a good weapon, may need to rethink stuff
--flash would be good too
--maybe each vehicle has a main attack that is a cannon
	--this cannot be upgraded/bought
--"spells" are rockets or mortars
	--these can be bought
--vehicles have "uniques", which are specials
	--these cannot be bought

local teamOneBase = nil
local teamTwoBase = nil

local players = {}

function newPlayer(handle)
	local player = {}
	setmetatable(player, PLAYER)
	player.handle = handle
	player.level = 1
	player.money = 0
	
	--initialize to 100 experience to level up
	SetMaxPilot(GetTeam(player.handle), 100)
	SetMaxScrap(GetTeam(player.handle), 10000)	--10,000 should be enough...
	SetScrap(GetTeam(player.handle), 200)		--starting amount of 200
end

function levelUp(player)
	local playerTeam = GetTeam(player.handle)	--less function calls
	
	--if is not time to level up, cancel level up
	if GetScrap(playerTeam) ~= GetMaxScrap(playerTeam) then
		return
	end
	
	--increase level
	player.level = player.level + 1
	
	--increase experience to level up
	SetMaxPilot(playerTeam, 2 * GetMaxPilot(playerTeam))
	SetPilot(playerTeam, 0)	--player now has 0 experience
	
	--increase health and give full (new) health
	SetMaxHealth(player.handle, 1.2 * GetMaxHealth(player.handle))
	SetCurHealth(player.handle, GetMaxHealth(player.handle))
	
	--increase ammo and give full (new) ammo
	SetMaxAmmo(player.handle, 1.2 * GetMaxAmmo(player.handle))
	SetCurAmo(player.handle, GetMaxAmmo(player.handle))
end

function respawnPlayer(player)

end

function giveExp(player)

end

function spawnWave()

end

function Start()
	--Team 1 alliances
	--Teams 1, 2, 3, 4 are players
	--Team 9 is AI
	Ally(1, 2)
	Ally(1, 3)
	Ally(1, 4)
	Ally(1, 9)
	
	Ally(2, 1)
	Ally(2, 3)
	Ally(2, 4)
	Ally(2, 9)
	
	Ally(3, 1)
	Ally(3, 2)
	Ally(3, 4)
	Ally(3, 9)
	
	Ally(4, 1)
	Ally(4, 2)
	Ally(4, 3)
	Ally(4, 9)
	
	Ally(9, 1)
	Ally(9, 2)
	Ally(9, 3)
	Ally(9, 4)
	
	--Team 2 alliances
	--Teams 5, 6, 7, 8 are players
	--Team 10 is AI
	Ally(5, 6)
	Ally(5, 7)
	Ally(5, 8)
	Ally(5, 10)
	
	Ally(6, 5)
	Ally(6, 7)
	Ally(6, 8)
	Ally(6, 10)
	
	Ally(7, 5)
	Ally(7, 6)
	Ally(7, 8)
	Ally(7, 10)
	
	Ally(8, 5)
	Ally(8, 6)
	Ally(8, 7)
	Ally(8, 10)
	
	Ally(10, 5)
	Ally(10, 6)
	Ally(10, 7)
	Ally(10, 8)
	
	LockAllies(true)
end

function Update()
	
end
