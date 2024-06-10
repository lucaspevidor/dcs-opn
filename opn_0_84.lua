opn = {}

-- Main settings -- Change these to adjust the behavior of the script
opn.debugMessages = false
opn.manpadsSpawnMessage = false

opn.controlGroupTag = "-OPN"
opn.emptyControlGroupTag = "-OPNE"
opn.fullControlGroupTag = "-OPNF"

opn.vehicleEmptyChance = 0.3
opn.manpadsSpawnChance = 0.07 -- 7% chance of spawning manpads from disabled vehicles
opn.vehicleDisabledLifePercent = 0.3 -- Life percent when vehicle is considered disabled
opn.vehicleWontReturnLifePercent = 0.7 -- Vehicles with life percent lower than this won't return to the attack area after panicking

opn.minPanicTime = 45
opn.maxPanicTime = 90
opn.minKillPanicDistance = 250 -- Distance for max panic increase
opn.maxKillPanicDistance = 600 -- Distance for min panic increase
opn.panicIncreaseOnKill = 25
opn.minWeaponCloseDistance = 50 -- Distance for max panic increase
opn.maxWeaponCloseDistance = 300 -- Distance for min panic increase
opn.panicIncreaseOnCloseWeapon = 40
opn.panicIncreaseOnWeaponHit = 30

-- ================================================================

-- Enums
opn.crewStatus = {
	MOUNTED = "MOUNTED",
	DISMOUNTED = "DISMOUNTED"
}

opn.unitStatus = {
	ACTIVE = "ACTIVE",
	DISPERSED = "DISPERSED",
	PANICKED = "PANICKED",
	HIDING = "HIDING",
	RETREATING = "RETREATING",
	RETURNING = "RETURNING",
	DISABLED = "DISABLED",
	ONFIRE = "ONFIRE",
	KILLED = "KILLED"
}

opn.vehicleTypes = {
  TANK = "TANK",
  APC = "APC",
  IFV = "IFV",
  LIGHT_ARMORED = "LIGHT_ARMORED",
  AIR_DEFENSE = "AIR_DEFENSE",
  TRUCK_PERSONAL = "TRUCK_PERSONAL",
  TRUCK_CARGO = "TRUCK_CARGO",
  CAR = "CAR",
}

opn.vehicleStats = {
	TANK = {
		maxCrewAmount = 4,
		panicNeighbourKilledRate = 0.5,
		panicWeaponHitRate = 0.8,
		panicWeaponCloseRate = 0.5,
		panicLifeLostRate = 4.0,
		panicDecreaseRate = 1.0,
		panicDecreaseWhilePanickedRate = 0.7,
	},
	APC = {
		maxCrewAmount = 8,
		panicNeighbourKilledRate = 1.0,
		panicWeaponHitRate = 1.0,
		panicWeaponCloseRate = 0.7,
		panicLifeLostRate = 3.0,
		panicDecreaseRate = 1.0,
		panicDecreaseWhilePanickedRate = 0.8,
	},
	IFV = {
		maxCrewAmount = 4,
		panicNeighbourKilledRate = 1.2,
		panicWeaponHitRate = 1.1,
		panicWeaponCloseRate = 0.7,
		panicLifeLostRate = 4.0,
		panicDecreaseRate = 1.0,
		panicDecreaseWhilePanickedRate = 0.8,
	},
	LIGHT_ARMORED = {
		maxCrewAmount = 3,
		panicNeighbourKilledRate = 1.2,
		panicWeaponHitRate = 4.0,
		panicWeaponCloseRate = 1.0,
		panicLifeLostRate = 4.0,
		panicDecreaseRate = 1.0,
		panicDecreaseWhilePanickedRate = 0.8,
	},
	AIR_DEFENSE = {
		maxCrewAmount = 3,
		panicNeighbourKilledRate = 0.8,
		panicWeaponHitRate = 3.0,
		panicWeaponCloseRate = 1.0,
		panicLifeLostRate = 4.0,
		panicDecreaseRate = 0.8,
		panicDecreaseWhilePanickedRate = 0.6,
	},
	TRUCK_PERSONAL = {
		maxCrewAmount = 8,
		panicNeighbourKilledRate = 2.0,
		panicWeaponHitRate = 5.0,
		panicWeaponCloseRate = 2.0,
		panicLifeLostRate = 5.0,
		panicDecreaseRate = 0.5,
		panicDecreaseWhilePanickedRate = 0.3,
	},
	TRUCK_CARGO = {
		maxCrewAmount = 2,
		panicNeighbourKilledRate = 4.0,
		panicWeaponHitRate = 5.0,
		panicWeaponCloseRate = 5.0,
		panicLifeLostRate = 5.0,
		panicDecreaseRate = 0.5,
		panicDecreaseWhilePanickedRate = 0.3,
	},
	CAR = {
		maxCrewAmount = 3,
		panicNeighbourKilledRate = 4.0,
		panicWeaponHitRate = 5.0,
		panicWeaponCloseRate = 5.0,
		panicLifeLostRate = 5.0,
		panicDecreaseRate = 0.5,
		panicDecreaseWhilePanickedRate = 0.3,
	},
}

opn.vehicleList = {
  ["ZTZ96B"] = opn.vehicleTypes.TANK,
  ["ZBD04A"] = opn.vehicleTypes.TANK,
  ["Pz_IV_H"] = opn.vehicleTypes.TANK,
  ["M4_Sherman"] = opn.vehicleTypes.TANK,
  ["TYPE-59"] = opn.vehicleTypes.TANK,
  ["T-90"] = opn.vehicleTypes.TANK,
  ["T-80UD"] = opn.vehicleTypes.TANK,
  ["T-72B3"] = opn.vehicleTypes.TANK,
  ["T-72B"] = opn.vehicleTypes.TANK,
  ["T-55"] = opn.vehicleTypes.TANK,
  ["Merkava_Mk4"] = opn.vehicleTypes.TANK,
  ["M-60"] = opn.vehicleTypes.TANK,
  ["M-1 Abrams"] = opn.vehicleTypes.TANK,
  ["Leopard-2"] = opn.vehicleTypes.TANK,
  ["Leopard-2A5"] = opn.vehicleTypes.TANK,
  ["leopard-2A4_trs"] = opn.vehicleTypes.TANK,
  ["leopard-2A4"] = opn.vehicleTypes.TANK,
  ["Leclerc"] = opn.vehicleTypes.TANK,
  ["Chieftain_mk3"] = opn.vehicleTypes.TANK,
  ["Challenger2"] = opn.vehicleTypes.TANK,
  ["TPZ"] = opn.vehicleTypes.APC,
  ["Sd_Kfz_251"] = opn.vehicleTypes.APC,
  ["MTLB"] = opn.vehicleTypes.APC,
  ["M2A1_halftrack"] = opn.vehicleTypes.APC,
  ["M-113"] = opn.vehicleTypes.APC,
  ["BTR_D"] = opn.vehicleTypes.APC,
  ["BTR-80"] = opn.vehicleTypes.APC,
  ["AAV7"] = opn.vehicleTypes.APC,
  ["MCV-80"] = opn.vehicleTypes.IFV,
  ["Marder"] = opn.vehicleTypes.IFV,
  ["M-2 Bradley"] = opn.vehicleTypes.IFV,
  ["M1126 Stryker ICV"] = opn.vehicleTypes.IFV,
  ["LAV-25"] = opn.vehicleTypes.IFV,
  ["BTR-82A"] = opn.vehicleTypes.IFV,
  ["BMP-3"] = opn.vehicleTypes.IFV,
  ["BMP-2"] = opn.vehicleTypes.IFV,
  ["BMP-1"] = opn.vehicleTypes.IFV,
  ["BMD-1"] = opn.vehicleTypes.IFV,
  ["LARC-V"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["tt_KORD"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["tt_DSHK"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["M1043 HMMWV Armament"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["HL_KORD"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["HL_DSHK"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["Cobra"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["BRDM-2"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["VAB_Mephisto"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["M1134 Stryker ATGM"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["M1045 HMMWV TOW"] = opn.vehicleTypes.LIGHT_ARMORED,
  ["Ural-375 ZU-23"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Ural-375 ZU-23 Insurgent"] = opn.vehicleTypes.AIR_DEFENSE,
  ["ZSU_57_2"] = opn.vehicleTypes.AIR_DEFENSE,
  ["ZSU-23-4 Shilka"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Vulcan"] = opn.vehicleTypes.AIR_DEFENSE,
  ["tt_ZU-23"] = opn.vehicleTypes.AIR_DEFENSE,
  ["HL_ZU-23"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Gepard"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Strela-1 9P31"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Osa 9A33 ln"] = opn.vehicleTypes.AIR_DEFENSE,
  ["2S6 Tunguska"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Tor 9A331"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Strela-10M3"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Roland Radar"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Roland ADS"] = opn.vehicleTypes.AIR_DEFENSE,
  ["M6 Linebacker"] = opn.vehicleTypes.AIR_DEFENSE,
  ["M48 Chaparral"] = opn.vehicleTypes.AIR_DEFENSE,
  ["M1097 Avenger"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Stinger comm dsr"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Stinger comm"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Soldier stinger"] = opn.vehicleTypes.AIR_DEFENSE,
  ["SA-18 Igla-S comm"] = opn.vehicleTypes.AIR_DEFENSE,
  ["SA-18 Igla-S manpad"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Igla manpad INS"] = opn.vehicleTypes.AIR_DEFENSE,
  ["SA-18 Igla comm"] = opn.vehicleTypes.AIR_DEFENSE,
  ["SA-18 Igla manpad"] = opn.vehicleTypes.AIR_DEFENSE,
  ["HEMTT_C-RAM_Phalanx"] = opn.vehicleTypes.AIR_DEFENSE,
  ["Ural-4320T"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["Ural-4320-31"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["Blitz_36-6700A"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["M 818"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["Land_Rover_101_FC"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["KrAZ6322"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["KAMAZ Truck"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["GAZ-66"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["GAZ-3308"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["Bedford_MWD"] = opn.vehicleTypes.TRUCK_PERSONAL,
  ["ZIL-135"] = opn.vehicleTypes.TRUCK_CARGO,
  ["ZIL-131 KUNG"] = opn.vehicleTypes.TRUCK_CARGO,
  ["Ural-375 PBU"] = opn.vehicleTypes.TRUCK_CARGO,
  ["Ural-375"] = opn.vehicleTypes.TRUCK_CARGO,
  ["SKP-11"] = opn.vehicleTypes.TRUCK_CARGO,
  ["KrAZ6322"] = opn.vehicleTypes.TRUCK_CARGO,
  ["S_75_ZIL"] = opn.vehicleTypes.TRUCK_CARGO,
  ["TZ-22_KrAZ"] = opn.vehicleTypes.TRUCK_CARGO,
  ["M978 HEMTT Tanker"] = opn.vehicleTypes.TRUCK_CARGO,
  ["ATZ-60_Maz"] = opn.vehicleTypes.TRUCK_CARGO,
  ["ATZ-5"] = opn.vehicleTypes.TRUCK_CARGO,
  ["ATZ-10"] = opn.vehicleTypes.TRUCK_CARGO,
  ["ATMZ-5"] = opn.vehicleTypes.TRUCK_CARGO,
  ["r11_volvo_drivable"] = opn.vehicleTypes.TRUCK_CARGO,
  ["ZiL-131 APA-80"] = opn.vehicleTypes.TRUCK_CARGO,
  ["Ural-4320 APA-5D"] = opn.vehicleTypes.TRUCK_CARGO,
  ["HEMTT TFFT"] = opn.vehicleTypes.TRUCK_CARGO,
  ["P20_drivable"] = opn.vehicleTypes.CAR,
  ["UAZ-469"] = opn.vehicleTypes.CAR,
  ["Tigr_233036"] = opn.vehicleTypes.CAR,
  ["Land_Rover_109_S3"] = opn.vehicleTypes.CAR,
  ["Hummer"] = opn.vehicleTypes.CAR,
}

-- Templates
opn.InfantryTemplate = {
	["heading"] = 0,
	["skill"] = "Average",
	["playerCanDrive"] = false,
	["type"] = "Infantry AK ver2",
	["x"] = 0,
	["y"] = 0
}

opn.ManpadsTemplate = {
	["heading"] = 0,
	["skill"] = "Average",
	["playerCanDrive"] = false,
	["type"] = "SA-18 Igla-S manpad",
	["x"] = 0,
	["y"] = 0
}

opn.panicTemplate = {
	panicEnabled = true,
	panicThreshold = 95,
	currentPanic = 0,
	prevPanic = 0,
	panicNeighbourKilledRate = 1.0,
	panicWeaponHitRate = 1.0,
	panicWeaponCloseRate = 1.0,	
	panicLifeLostRate = 2.0,
	panicDecreaseRate = 1.0,
	panicDecreaseWhilePanickedRate = 0.8,
}

opn.groupTemplate = {
	-- coalition = "blue",
	coalitionId = 0,
	countryId = 2,
	-- country = "ctjf_blue",
	type = "TANK",
	maxHealth = 20,
	prevHealth = 20,
	maxCrewAmount = 3,
	crewAmount = 2,
	crewStatus = opn.crewStatus.MOUNTED,
	unitStatus = opn.unitStatus.ACTIVE,
	statusInitTime = 0,
	statusRandomTime = 0,
	position = {
		x = 0,
		y = 0
	},
	activePosition = {
		x = 0,
		y = 0,
		z = 0,
	},
	destination = {
		x = 0,
		y = 0,
	},
}

-- Main variables
opn.managedGroups = {}
opn.groupUnits = {}

-- Helper functions

function opn.randomSign()
	return math.random(0, 1) == 0 and -1 or 1
end

function DebugMessage(_messageText, _displayTime, forceShow)
	if opn.debugMessages or forceShow then	
		if _displayTime == nil then
			_displayTime = 5
		end
		trigger.action.outText(_messageText, _displayTime, false)
	end
end

-- Main functions
function opn.RegisterGroup(groupName)
	group = mist.utils.deepCopy(opn.groupTemplate)
	group.panic = mist.utils.deepCopy(opn.panicTemplate)

	groupData = mist.getGroupData(groupName)
	groupTypeName = groupData.units[1].type
	groupType = opn.vehicleList[groupTypeName]
	groupController = Group.getByName(groupName):getController()
	leaderData = Unit.getByName(groupData.units[1].unitName)

	if groupType == nil then
		return
	end

	groupController:setOption(AI.Option.Ground.id.DISPERSE_ON_ATTACK, false) -- disable group dispersion
	group.coalitionId = Group.getByName(groupName):getCoalition()
	group.countryId = groupData.countryId
	group.type = groupTypeName
	group.prevHealth = leaderData:getLife() - 1
	group.maxHealth = leaderData:getLife0() - 1
	group.maxCrewAmount = opn.vehicleStats[groupType].maxCrewAmount
		
	if groupType == opn.vehicleTypes.TRUCK_PERSONAL or groupType == opn.vehicleTypes.APC then
		group.crewAmount = mist.random(2, group.maxCrewAmount)
	else
		group.crewAmount = group.maxCrewAmount
	end
	group.crewAmount = mist.random(0, 100) > opn.vehicleEmptyChance * 100 and group.crewAmount or 0 -- 30% chance of being empty
	if string.find(groupName, opn.fullControlGroupTag) then
		group.crewAmount = group.maxCrewAmount
	elseif string.find(groupName, opn.emptyControlGroupTag) then
		group.crewAmount = 0
	end
	group.crewStatus = group.crewAmount > 0 and opn.crewStatus.MOUNTED or opn.crewStatus.DISMOUNTED
	group.unitStatus = group.crewAmount > 0 and opn.unitStatus.ACTIVE or opn.unitStatus.DISABLED
	
	group.position = mist.utils.makeVec2(mist.getLeadPos(groupName))
	if group.crewAmount == 0 then
		groupController:setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.WEAPON_HOLD)
	end

	group.panic.panicNeighbourKilledRate = opn.vehicleStats[groupType].panicNeighbourKilledRate
	group.panic.panicWeaponHitRate = opn.vehicleStats[groupType].panicWeaponHitRate
	group.panic.panicWeaponCloseRate = opn.vehicleStats[groupType].panicWeaponCloseRate
	group.panic.panicLifeLostRate = opn.vehicleStats[groupType].panicLifeLostRate
	group.panic.panicDecreaseRate = opn.vehicleStats[groupType].panicDecreaseRate
	group.panic.panicDecreaseWhilePanickedRate = opn.vehicleStats[groupType].panicDecreaseWhilePanickedRate

	opn.managedGroups[groupName] = group

	-- ----------------- Populate group units relation table -----------------
	for i = 1, #groupData.units do
		opn.groupUnits[groupData.units[i].unitName] = groupName
	end
end

function opn.RegisterAll()
	blueGroups = coalition.getGroups(coalition.side.BLUE, Group.Category.GROUND)
	redGroups = coalition.getGroups(coalition.side.RED, Group.Category.GROUND)
	neutralGroups = coalition.getGroups(coalition.side.NEUTRAL, Group.Category.GROUND)

	groupNames = {}
	for i = 1, #blueGroups do
		table.insert(groupNames, blueGroups[i]:getName())
	end
	for i = 1, #redGroups do
		table.insert(groupNames, redGroups[i]:getName())
	end
	for i = 1, #neutralGroups do
		table.insert(groupNames, neutralGroups[i]:getName())
	end

	for i = 1, #groupNames do
		if string.find(groupNames[i], opn.controlGroupTag) then
			opn.RegisterGroup(groupNames[i])
		end
	end

	return opn.managedGroups
end

function opn.RemoveGroup(groupName)
	opn.managedGroups[groupName] = nil
end

function opn.StopGroup(groupName)
	squadPath = {
		mist.ground.buildWP(mist.getLeadPos(groupName))
	}
	nextPoint = {
		x = squadPath[1].x + 0.011,
		y = squadPath[1].y + 0.011
	}
	wpToAdd = mist.ground.buildWP(nextPoint)
	table.insert(squadPath, wpToAdd)

	mist.goRoute(groupName, squadPath)
end

function opn.GoToFob(groupName, speed)
	if 
		opn.managedGroups[groupName] and
		opn.managedGroups[groupName].unitStatus == opn.unitStatus.DISABLED 
	then
		return
	end

	local isVehicle = opn.managedGroups[groupName] ~= nil
	local zoneName = ''

	if Group.getByName(groupName):getCoalition() == coalition.side.BLUE then
		zoneName = isVehicle and "Zone-VB" or "Zone-INFB"
	else
		zoneName = isVehicle and "Zone-VR" or "Zone-INFR"
	end

	squadPath = {}
	squadPath[1] = mist.ground.buildWP(mist.getLeadPos(groupName))
	randomPoint = mist.getRandomPointInZone(zoneName)
	wpToAdd = mist.ground.buildWP(randomPoint, nil, speed)
	table.insert(squadPath, wpToAdd)

	if opn.managedGroups[groupName] then
		opn.managedGroups[groupName].destination = randomPoint
	end

	mist.goRoute(groupName, squadPath)	
end

function opn.ResetDestination(groupName)
	if opn.managedGroups[groupName] then
		opn.managedGroups[groupName].destination = {
			x = 0,
			y = 0
		}
	end
end

function opn.GoToRandom(groupName, minDist, maxDist, speed)
	if opn.managedGroups[groupName] and opn.managedGroups[groupName].unitStatus == opn.unitStatus.DISABLED then
		return
	end

	groupPosition = mist.utils.makeVec2(mist.getLeadPos(groupName))
	squadPath = {}
	squadPath[1] = mist.ground.buildWP(groupPosition)
	rd = mist.random(minDist, maxDist)
	ra = mist.random(0, 360)
	rx = rd * math.cos(math.rad(ra))
	ry = rd * math.sin(math.rad(ra))

	randomPoint = {
		x = groupPosition.x + rx,
		y = groupPosition.y + ry
	}

	wpToAdd = mist.ground.buildWP(randomPoint, nil, speed)
	table.insert(squadPath, wpToAdd)

	if opn.managedGroups[groupName] then
		opn.managedGroups[groupName].destination = randomPoint
	end

	mist.goRoute(groupName, squadPath)
	return groupPosition
end

function opn.GoToRandomThenFob(groupName, minDist, maxDist, speed)
	groupPosition = mist.utils.makeVec2(mist.getLeadPos(groupName))
	squadPath = {}
	squadPath[1] = mist.ground.buildWP(groupPosition)
	rd = mist.random(minDist, maxDist)
	ra = mist.random(0, 360)
	rx = rd * math.cos(math.rad(ra))
	ry = rd * math.sin(math.rad(ra))

	randomPoint = {
		x = groupPosition.x + rx,
		y = groupPosition.y + ry
	}

	wpToAdd = mist.ground.buildWP(randomPoint, nil, speed)
	table.insert(squadPath, wpToAdd)

	randomPoint = mist.getRandomPointInZone("Zone-FOB")
	wpToAdd = mist.ground.buildWP(randomPoint, nil, speed)
	table.insert(squadPath, wpToAdd)

	mist.goRoute(groupName, squadPath)
	return groupPosition
end

function opn.SpawnPanickedSquad(group, vehicleGroup)
	DebugMessage("Squad will spawn - " .. group.groupName)
	if (opn.managedGroups[vehicleGroup].unitStatus ~= opn.unitStatus.KILLED) then
		local cId = 80
		if opn.managedGroups[vehicleGroup].coalitionId == 1 then
			cId = 81
		end
		DebugMessage("countryId: " .. tostring(cId) .. " - " .. group.groupName .. " has been spawned")
		newGroup = coalition.addGroup(cId, Group.Category.GROUND, group)
		newGroup:getController():setOption(AI.Option.Ground.id.DISPERSE_ON_ATTACK, false) -- disable group dispersion
		newGroup:getController():setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.WEAPON_HOLD)
		mist.scheduleFunction(opn.GoToRandom, { group.groupName, 200, 300, 30 }, timer.getTime() + 0.5)

		local randomFobTime = mist.random(30, 60)
		mist.scheduleFunction(function ()
			newGroup:getController():setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.OPEN_FIRE)
		end, {}, timer.getTime() + randomFobTime)
		mist.scheduleFunction(opn.GoToFob, { group.groupName }, timer.getTime() + randomFobTime)

		return newGroup
	end
end

function opn.DismountTransport(groupName)
	transport = opn.managedGroups[groupName]
	leadPosition = transport.position
	if mist.groupIsDead(groupName) == false then
		leadPosition = mist.utils.makeVec2(mist.getLeadPos(groupName))
	end

	countryId = 80
	if transport.coalitionId == 1 then
		countryId = 81
	end
	category = "vehicle"

	groups = {}

	for i = 1, transport.crewAmount do
		vars = {}

		vars.category = category
		vars.groupId = nil
		vars.country = nil
		vars.countryId = countryId
		vars.groupName = groupName .. "-Squad-" .. i
		vars.name = groupName .. "-Squad-" .. i
		vars.units = {}
		vars.task = "Ground Nothing"
		vars.coalitionId = transport.coalitionId
		vars.coalition = nil

		unit = mist.utils.deepCopy(opn.InfantryTemplate)

		if (math.random() < opn.manpadsSpawnChance) then
			unit = mist.utils.deepCopy(opn.ManpadsTemplate)
			DebugMessage("Watch out! MANPADS disembarked from a vehicle!", 10, opn.manpadsSpawnMessage)
		end

		unit.x = leadPosition.x + mist.random(-5, 5)
		unit.y = leadPosition.y + mist.random(-5, 5)
		unit.unitName = groupName .. "-Squad-" .. i .. "u"
		table.insert(vars.units, unit)
		table.insert(groups, vars)
	end

	spawnCounterDelay = 0.2 + math.random() * 0.2
	DebugMessage("Spawning " .. #groups .. " squads from " .. groupName)
	for i = 1, #groups do
		mist.scheduleFunction(opn.SpawnPanickedSquad, { groups[i], groupName }, timer.getTime() + spawnCounterDelay)
		spawnCounterDelay = spawnCounterDelay + 0.7 + math.random() * 0.6
	end

	return groups
end

function opn.GetUnitLifePercent(unit)
	local percent = (unit:getLife() - 1) / (unit:getLife0() - 1)
	if percent < 0 then
		percent = 0
	end
	return percent
end

function opn.TrackWeapon(params, time)
	local status, weaponPos = pcall(function ()
		return params.weapon:getPoint()
		end
	)

	if status then
		params.weaponLastPoint = weaponPos
		return timer.getTime() + 0.001

	else -- Weapon hit
		local hitPosition = mist.utils.makeVec2(params.weaponLastPoint)

		for groupName, group in pairs(opn.managedGroups) do
			if mist.groupIsDead(groupName) == false and
				 group.unitStatus ~= opn.unitStatus.DISABLED
			then
				-- ----------- Panic increase on close weapon -------------
				impactDistance = mist.utils.get2DDist(group.position, hitPosition)
				if impactDistance < opn.minWeaponCloseDistance then
					impactDistance = opn.minWeaponCloseDistance
				end
	
				local m = -1 / (opn.maxWeaponCloseDistance - opn.minWeaponCloseDistance)
				local b = 1 - m * opn.minWeaponCloseDistance
	
				local panicFactor = m * impactDistance + b
				closeWeaponPanicIncrease = opn.panicIncreaseOnCloseWeapon * panicFactor
				if closeWeaponPanicIncrease < 0 then
					closeWeaponPanicIncrease = 0
				end

				if closeWeaponPanicIncrease ~= 0 then
					group.panic.currentPanic = group.panic.currentPanic + closeWeaponPanicIncrease * group.panic.panicWeaponCloseRate
				end
			end
		end
	end
end

function opn.ProcessBehavior()
	for groupName, group in pairs(opn.managedGroups) do
		if mist.groupIsDead(groupName) == false then
			leaderUnit = Unit.getByName(mist.getGroupData(groupName).units[1].unitName)
			leaderController = leaderUnit:getController()
			group.position = mist.utils.makeVec2(mist.getLeadPos(groupName))
			if group.unitStatus == opn.unitStatus.ACTIVE then
				group.activePosition = mist.getLeadPos(groupName)
			end			

			if group.crewAmount ~= 0 and group.unitStatus ~= opn.unitStatus.DISABLED then

				-- ----------- Any to Disabled -------------
				if opn.GetUnitLifePercent(leaderUnit) < opn.vehicleDisabledLifePercent then
					group.unitStatus = opn.unitStatus.DISABLED				
					opn.StopGroup(groupName)
					DebugMessage("Group " .. groupName .. " has been disabled")
					leaderController:setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.WEAPON_HOLD)
					DebugMessage("Crew amount before loss: " .. group.crewAmount)
					group.crewAmount = mist.random(0, group.crewAmount) -- Simulate crew loss
					DebugMessage("Crew amount after losses: " .. group.crewAmount)
					mist.scheduleFunction(opn.DismountTransport, { groupName }, timer.getTime() + 6 + mist.random(0, 3))					
				
				-- ----------- Active to Dispersed -------------
				elseif
						group.unitStatus == opn.unitStatus.ACTIVE and
						group.panic.currentPanic > group.panic.panicThreshold * 0.03 and
						group.panic.currentPanic < group.panic.panicThreshold
				then
					group.unitStatus = opn.unitStatus.DISPERSED
					group.statusInitTime = timer.getTime()
					opn.ResetDestination(groupName)
					mist.scheduleFunction(opn.GoToRandom, { groupName, 50, 100, 20 }, timer.getTime() + mist.random(3, 15))
					DebugMessage(groupName .. " has been dispersed")
				-- ----------- Dispersed to Active -------------
				elseif
						group.unitStatus == opn.unitStatus.DISPERSED and
						group.panic.currentPanic <= 0
				then
					group.unitStatus = opn.unitStatus.ACTIVE				
					DebugMessage(groupName .. " is active again")
					if (mist.utils.get2DDist(group.position, group.activePosition) > 300) then
						opn.ResetDestination(groupName)
						local lastActivePosition = {
							point = group.activePosition,
							radius = 1,
						}
						mist.groupToPoint(groupName, lastActivePosition, nil, nil, 100, true)
					end
				-- ----------- Dispersed to Dispersed -------------
				elseif
						group.unitStatus == opn.unitStatus.DISPERSED and
						group.panic.prevPanic + 10 * group.panic.panicDecreaseRate < group.panic.currentPanic and
						group.panic.currentPanic < group.panic.panicThreshold
				then
					group.unitStatus = opn.unitStatus.DISPERSED
					group.statusInitTime = timer.getTime()
					opn.ResetDestination(groupName)
					mist.scheduleFunction(opn.GoToRandom, { groupName, 20, 40, 20 }, timer.getTime() + mist.random(2, 5))
					DebugMessage(groupName .. " has been dispersed")

				-- ----------- Any to Panicked -------------
				elseif
						group.unitStatus ~= opn.unitStatus.PANICKED and
						group.panic.currentPanic > group.panic.panicThreshold
				then
					group.unitStatus = opn.unitStatus.PANICKED
					group.statusInitTime = timer.getTime()
					opn.ResetDestination(groupName)
					mist.scheduleFunction(opn.GoToRandom, { groupName, 400, 600, 25 }, timer.getTime() + mist.random(3, 8))
					DebugMessage(groupName .. " has panicked")
				-- ----------- Panicked to Panicked -------------
				elseif
						group.unitStatus == opn.unitStatus.PANICKED and
						group.panic.prevPanic + 10 * group.panic.panicDecreaseRate < group.panic.currentPanic
				then
					group.statusInitTime = timer.getTime()
					opn.ResetDestination(groupName)
					mist.scheduleFunction(opn.GoToRandom, { groupName, 300, 400, 25 }, timer.getTime() + mist.random(1, 3))

				-- ----------- Panicked to Hiding -------------
				elseif
						group.unitStatus == opn.unitStatus.PANICKED and
						(
							group.panic.currentPanic < group.panic.panicThreshold or
							mist.utils.get2DDist(group.position, group.destination) < 50
						)
				then
					group.panic.currentPanic = group.panic.panicThreshold - 1
					group.unitStatus = opn.unitStatus.HIDING
					group.statusInitTime = timer.getTime() + mist.random(0, 60)
					group.statusRandomTime = mist.random(5, 10)
					opn.StopGroup(groupName)
					DebugMessage(groupName .. " has started hiding")

				-- ----------- Hiding to retreating -------------
				elseif
						group.unitStatus == opn.unitStatus.HIDING and
						timer.getTime() - group.statusInitTime > 15 + group.statusRandomTime and
						group.panic.currentPanic < group.panic.panicThreshold * 0.8
				then
					group.unitStatus = opn.unitStatus.RETREATING
					group.statusInitTime = timer.getTime()
					group.statusRandomTime = mist.random(0, 50)
					opn.ResetDestination(groupName)
					mist.scheduleFunction(opn.GoToFob, { groupName, 80 }, timer.getTime() + mist.random(0, 5))
					DebugMessage(groupName .. " has started retreating")		

				-- --------- Retreating to Active -------------
				elseif
					group.unitStatus == opn.unitStatus.RETREATING and
					timer.getTime() - group.statusInitTime > 250 + group.statusRandomTime and
					mist.utils.get2DDist(group.position, group.destination) < 50 and
					opn.GetUnitLifePercent(leaderUnit) <= opn.vehicleWontReturnLifePercent
				then
					group.unitStatus = opn.unitStatus.ACTIVE
					group.statusInitTime = timer.getTime()
					DebugMessage(groupName .. " won't return and is active")	

				-- --------- Retreating to Returning -------------
				elseif
					group.unitStatus == opn.unitStatus.RETREATING and
					timer.getTime() - group.statusInitTime > 250 + group.statusRandomTime and
					mist.utils.get2DDist(group.position, group.destination) < 50 and
					opn.GetUnitLifePercent(leaderUnit) > 0.7
				then
					local lastActivePosition = {
						point = group.activePosition,
						radius = 1,
					}
					mist.groupToPoint(groupName, lastActivePosition, nil, nil, 90, true)
					group.destination.x = group.activePosition.x
					group.destination.y = group.activePosition.z
					group.unitStatus = opn.unitStatus.RETURNING
					group.statusInitTime = timer.getTime()
					DebugMessage(groupName .. " has started returning")				

				-- ----------- Returning to Active -------------
				elseif
					group.unitStatus == opn.unitStatus.RETURNING and
					mist.utils.get2DDist(group.position, group.activePosition) < 50
				then
					group.unitStatus = opn.unitStatus.ACTIVE
					group.statusInitTime = timer.getTime()
					DebugMessage(groupName .. " has returned to active")
				end

				-- ----------- If panic increased above threshold, cap to min max -----------
				if 
					group.panic.currentPanic > group.panic.panicThreshold and
					group.panic.currentPanic > group.panic.prevPanic			
				then
					if group.panic.currentPanic < group.panic.panicThreshold + opn.minPanicTime * group.panic.panicDecreaseRate then
						group.panic.currentPanic = 
							group.panic.panicThreshold + opn.minPanicTime * group.panic.panicDecreaseRate + math.random() * 8
					end
					if group.panic.currentPanic > group.panic.panicThreshold + opn.maxPanicTime * group.panic.panicDecreaseRate then
						group.panic.currentPanic = 
							group.panic.panicThreshold + opn.maxPanicTime * group.panic.panicDecreaseRate - math.random() * 5
					end
				end

				-- ----------- Decrease panic over time -----------
				group.panic.prevPanic = group.panic.currentPanic
				if group.unitStatus == opn.unitStatus.PANICKED then
					group.panic.currentPanic = group.panic.currentPanic - group.panic.panicDecreaseWhilePanickedRate
				else
					group.panic.currentPanic = group.panic.currentPanic - group.panic.panicDecreaseRate
				end
				if group.panic.currentPanic < 0 then
					group.panic.currentPanic = 0
				end

			end
		end

		if mist.groupIsDead(groupName) then			
			-- ----------- ONFIRE to DEACTIVATED -------------
			if group.crewAmount ~= 0 and group.unitStatus == opn.unitStatus.ONFIRE and group.crewStatus == opn.crewStatus.MOUNTED then				
				group.crewStatus = opn.crewStatus.DISMOUNTED	
				DebugMessage("Original crew amount: " .. group.crewAmount)
				group.crewAmount = mist.random(0, group.crewAmount) -- Simulate crew loss
				DebugMessage("Crew amount after loss: " .. group.crewAmount)
				mist.scheduleFunction(opn.DismountTransport, { groupName }, timer.getTime() + 4 + mist.random(0, 3))
			end
		end
	end
end

function opn.IncreasePanicOnArea(targetGroupName, minDist, maxDist, panicIncrease)
	for groupName, group in pairs(opn.managedGroups) do
		if targetGroupName ~= groupName and
			mist.groupIsDead(groupName) == false and
			group.unitStatus ~= opn.unitStatus.DISABLED and
			opn.managedGroups[targetGroupName].coalition == group.coalition
		then
			-- ----------- Panic increase on kill -------------
			distance = mist.utils.get2DDist(group.position, opn.managedGroups[targetGroupName].position)
			if distance < minDist then
				distance = minDist
			end

			local m = -1 / (maxDist - minDist)
			local b = 1 - m * minDist

			local panicFactor = m * distance + b
			cPanicIncrease = panicIncrease * panicFactor
			if cPanicIncrease < 0 then
				cPanicIncrease = 0
			end
			group.panic.currentPanic = group.panic.currentPanic + cPanicIncrease * group.panic.panicNeighbourKilledRate
		end
	end
end

function opn.OnHitEvent(_event)
	-- local unitName = _event.initiator:getName()
	local eventTarget = _event.target 
	-- local isStrafingWeapon = string.find(_event.weapon:getTypeName():lower(), "weapons.shell")
	local targetName = ''
	local targetGroupName = ''
	
	if eventTarget then
		targetName = eventTarget:getName()
		targetUnit = Unit.getByName(targetName)
		if targetUnit then
			targetGroupName = targetUnit:getGroup():getName()
		end
	end

	if targetGroupName and opn.managedGroups[targetGroupName] then
		target = opn.managedGroups[targetGroupName]
		-- ----------- Panic increase on hit by weapon -------------
		target.panic.currentPanic = target.panic.currentPanic + opn.panicIncreaseOnWeaponHit * target.panic.panicWeaponHitRate
		opn.IncreasePanicOnArea(targetGroupName, opn.minKillPanicDistance / 2, opn.maxKillPanicDistance / 3, opn.panicIncreaseOnWeaponHit * 0.5)
		DebugMessage("Panic increase on hit by weapon")

		-- ----------- Panic increase on hit by life loss -------------
		diffLife = 100 * (target.prevHealth - targetUnit:getLife() - 1) / (target.maxHealth - 1)
		if diffLife > 0 then
			target.panic.currentPanic = target.panic.currentPanic + diffLife * target.panic.panicLifeLostRate
			DebugMessage("Panic increase on life lost")
		end
		target.prevHealth = targetUnit:getLife() - 1
	end

	-- local group = opn.groupUnits[targetName]
	-- if group and opn.managedGroups[group] and targetUnit == nil then
	-- 	target = opn.managedGroups[group]
	-- 	target.unitStatus = opn.unitStatus.ONFIRE
	-- 	target.statusInitTime = timer.getTime()
	-- 	opn.IncreasePanicOnArea(group, opn.minKillPanicDistance, opn.maxKillPanicDistance, opn.panicIncreaseOnKill)
	-- 	DebugMessage("Panic increase on enemy on fire")
	-- end
	mist.scheduleFunction(opn.CheckOnFire, { targetName }, timer.getTime() + 1.5)	
end

function opn.CheckOnFire(unitName)
	targetUnit = Unit.getByName(unitName)
	local group = opn.groupUnits[unitName]
	if group and
		 opn.managedGroups[group] and
		 targetUnit == nil and
		 opn.managedGroups[group].unitStatus ~= opn.unitStatus.DISABLED and
		 opn.managedGroups[group].unitStatus ~= opn.unitStatus.ONFIRE and
		 opn.managedGroups[group].unitStatus ~= opn.unitStatus.KILLED
	then
		target = opn.managedGroups[group]
		target.unitStatus = opn.unitStatus.ONFIRE
		target.statusInitTime = timer.getTime()
		opn.IncreasePanicOnArea(group, opn.minKillPanicDistance, opn.maxKillPanicDistance, opn.panicIncreaseOnKill)
		DebugMessage("Panic increase on enemy on fire")
	end
end

function opn.OnKillEvent(_event)
	-- local unitName = _event.initiator:getName() -- If we need it, we have to check if initiator is valid before getting the name
	local eventTarget = _event.target
	local targetName = ''
	local targetGroupName = ''

	if eventTarget then
		targetName = eventTarget:getName()		
		targetGroupName = opn.groupUnits[targetName]

		if targetGroupName then
			local panicToIncrease = opn.panicIncreaseOnKill
			if opn.managedGroups[targetGroupName].unitStatus == opn.unitStatus.ONFIRE then
				opn.IncreasePanicOnArea(targetGroupName, opn.minKillPanicDistance / 2, opn.maxKillPanicDistance / 3, panicToIncrease * 0.5)
			else
				opn.IncreasePanicOnArea(targetGroupName, opn.minKillPanicDistance, opn.maxKillPanicDistance, panicToIncrease)
			end
			DebugMessage("Panic increase on kill")
			opn.managedGroups[targetGroupName].unitStatus = opn.unitStatus.KILLED
			opn.managedGroups[targetGroupName].statusInitTime = timer.getTime()
		end
	end
end

function opn.OnShotEvent(event)
	local weapon = event.weapon
	-- local unitName = event.initiator:getName() -- If we need it, we have to check if initiator is valid before getting the name

	local params = {}
	params.weapon = weapon
	params.weaponLastPoint = weapon:getPoint()
	params.weaponName = weapon:getTypeName()
	params.weaponID = weapon:getName()

	timer.scheduleFunction(opn.TrackWeapon, params, timer.getTime() + 0.001)
end

opn.EventHandler = {}
function opn.EventHandler:onEvent(_dcsEvent)

	if _dcsEvent == nil then
		return true
	end

	local status, err = pcall(function(_event)
		if _event.id == world.event.S_EVENT_HIT then
			opn.OnHitEvent(_event)
		elseif _event.id == world.event.S_EVENT_KILL then
			opn.OnKillEvent(_event)
		elseif _event.id == world.event.S_EVENT_SHOT then
			opn.OnShotEvent(_event)
		end
	end, _dcsEvent)

	if not status then
		env.error(string.format("DCS OPN: Error while handling event: %s", err), false)
		DebugMessage(string.format("DCS OPN: Error while handling event: %s", err), 10, true)
	end
end

function opn.ReportInitComplete()
	DebugMessage("OPN - v0.84 loaded", 10, true)

	local grpNum = 0
	for _ in pairs(opn.managedGroups) do
			grpNum = grpNum + 1
	end
	DebugMessage("OPN - " .. tostring(grpNum) .. " groups registered", 10, true)

	local zoneIfr = trigger.misc.getZone("Zone-INFR")
	local zoneVr = trigger.misc.getZone("Zone-VR")
	local zoneInfb = trigger.misc.getZone("Zone-INFB")
	local zoneVb = trigger.misc.getZone("Zone-VB")

	local redZones = { zoneIfr, zoneVr }
	local blueZones = { zoneInfb, zoneVb }

	DebugMessage("OPN - " .. tostring(#redZones) .. " red zones registered", 10, true)
	DebugMessage("OPN - " .. tostring(#blueZones) .. " blue zones registered", 10, true)
end

mist.scheduleFunction(opn.ProcessBehavior, {}, timer.getTime() + 2, 1)
world.addEventHandler(opn.EventHandler)

opn.RegisterAll()
mist.scheduleFunction(opn.ReportInitComplete, {}, timer.getTime() + 2)

return opn