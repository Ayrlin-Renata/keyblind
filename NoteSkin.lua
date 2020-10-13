local ret = ... or {}

local OldRedir = ret.Redir

ret.Redir = function(sButton, sElement)
	sButton, sElement = OldRedir(sButton, sElement)

	--Point the head files back to the tap note
	if string.find(sElement, "Head") 
	or sElement == "Tap Fake" then
		sElement = "Tap Note"
	end
	
	if string.find(sElement, "Tap Explosion") then
		sElement = "Tap Explosion Bright"
		sButton = "Down"
	end
	
	if string.find(sElement, "Active") 
	or string.find(sElement, "Inactive")
	or string.find(sElement, "Tap Mine")
	or string.find(sElement, "Receptor") then
		sButton = "Down"
	end
	
	if string.find(sElement, "Roll") then 
		if string.find(sElement, "Bottomcap") then
			if string.find(sElement, "Active") then
				sElement = "Hold Bottomcap Active"
			else 
				sElement = "Hold Bottomcap Inactive"
			end
		end
		if string.find(sElement, "Topcap") then
			if string.find(sElement, "Active") then
				sElement = "Hold Topcap Active"
			else 
				sElement = "Hold Topcap Inactive"
			end
		end
	end

	return sButton, sElement
end

local OldFunc = ret.Load
function ret.Load()
	local t = OldFunc()

	-- The main "Explosion" part just loads other actors; don't rotate
	-- it.  The "Hold Explosion" part should not be rotated.
	if Var "Element" == "Explosion" 
	or Var "Element" == "Roll Explosion" then
		t.BaseRotationZ = nil
	end
	return t
end

ret.PartsToRotate = {
	["Receptor"] = false,
	["Tap Note"] = true,
	["Tap Lift"] = false,
	["Tap Fake"] = true,
	["Ready Receptor"] = false,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true
}
ret.Rotate = {
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = 225
}

ret.Blank = {
	["Hold Explosion"] = true,
	["Roll Explosion"] = true,
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Tap Lift"] = true
}

return ret
