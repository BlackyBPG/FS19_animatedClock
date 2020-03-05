-- 
-- Animated Clock
-- Script by Blacky_BPG
--
-- last Change for FS13		19.09.2013
-- converted for FS17		16.11.2016
-- converted for FS19		04.02.2020
-- 
-- Version 1.9.0.1       04.02.2020     first release for FS19, add digitalDisplay functionality, add realtime functionality
-- Version 1.3.0.0 A     02.12.2016     optimize code
-- Version 1.3.0.0       16.11.2016     converted to FS17
-- 

animatedClock = {}
animatedClock.version = "1.9.0.1"
animatedClock.date = "04.02.2020"
local animatedClock_mt = Class(animatedClock)
function animatedClock.onCreate(id)
	local object = animatedClock:new(id)
	if object ~= nil then
		g_currentMission:addUpdateable(object)
	end
end
function animatedClock:new(id)
	local self = {}
	setmetatable(self, animatedClock_mt)

	local digits = getUserAttribute(id, "digits")
	local hourPointer = getUserAttribute(id, "hourPointer")
	local minutePointer = getUserAttribute(id, "minutePointer")
	local secondPointer = getUserAttribute(id, "secondPointer")
	self.pointerSteps = Utils.getNoNil(getUserAttribute(id, "pointerSteps"),false)
	self.realTime = Utils.getNoNil(getUserAttribute(id, "realTime"),false)
	if digits ~= nil then
		self.digits = I3DUtil.indexToObject(id, digits)
		if self.digits ~= nil then
			self.numDigits = getNumOfChildren(self.digits)
		end
	end
	if hourPointer ~= nil then
		self.hourPointer = I3DUtil.indexToObject(id, hourPointer)
	end
	if minutePointer ~= nil then
		self.minutePointer = I3DUtil.indexToObject(id, minutePointer)
	end
	if secondPointer ~= nil then
		self.secondPointer = I3DUtil.indexToObject(id, secondPointer)
	end
	if (self.hourPointer == nil or self.minutePointer == nil) and (self.digits == nil or self.numDigits < 1) then
		print("ERROR: Animated Clock cant be created for clock "..tostring(getName(id)).." ("..tostring(id)..") !")
		self.isEnabled = false
		return
	end
	self.oldTime = 0
	self.isEnabled = true
	return self
end
function animatedClock:delete()
end
function animatedClock:update(dt)
	if self.isEnabled then
		local cTime = (g_currentMission.environment.dayTime / 3600 / 1000)
		local hourFull = cTime
		local minuteFull = (cTime - math.floor(hourFull)) * 60
		local secondFull = (((cTime - math.floor(hourFull)) * 60) - math.floor(minuteFull)) * 60
		if self.realTime then
			hourFull = getDate("%H")
			minuteFull = getDate("%M")
			secondFull = getDate("%S")
		end
		local hour = math.floor(hourFull)
		local minute = math.floor(minuteFull)
		local second = math.floor(secondFull)

		local secondDegree = 360 / 60 * secondFull
		local minuteDegree = 360 / 60 * minuteFull
		local hourDegree = 360 / 12 * hourFull
		if self.pointerSteps then
			secondDegree = 360 / 60 * second
			minuteDegree = 360 / 60 * minute
			hourDegree = 360 / 12 * hourFull
		end

		if self.secondPointer ~= nil then
			setRotation(self.secondPointer, 0, 0, MathUtil.degToRad(secondDegree))
		end
		if self.minutePointer ~= nil then
			setRotation(self.minutePointer, 0, 0, MathUtil.degToRad(minuteDegree))
		end
		if self.hourPointer ~= nil then
			setRotation(self.hourPointer, 0, 0, MathUtil.degToRad(hourDegree))
		end
		if self.digits ~= nil then
			local sTime = ""
			if self.numDigits == 6 then
				sTime = 1000000 + (hour * 10000) + (minute * 100) + second
			elseif self.numDigits == 4 then
				sTime = 10000 + (hour * 100) + minute
			end
			if hour < 10 then
				setVisibility(getChildAt(self.digits,self.numDigits-1),false)
			else
				setVisibility(getChildAt(self.digits,self.numDigits-1),true)
			end
			I3DUtil.setNumberShaderByValue(self.digits, sTime, 0, true)
		end
	end
end

g_onCreateUtil.addOnCreateFunction("animatedClock", animatedClock.onCreate)

print(" ++ loading Animated Clock V "..tostring(animatedClock.version).." - "..tostring(animatedClock.date).." (by Blacky_BPG)")
