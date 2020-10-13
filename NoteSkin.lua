local noteskin = ... or {}

local OldRedir = noteskin.Redir

noteskin.Redir = function(sButton, sElement)
	sButton, sElement = OldRedir(sButton, sElement)

	--Point the head files back to the tap note
	if sElement == "Tap Fake"
	or string.find(sElement, "Head") 
	or string.find(sElement, "Tap Note") then
		sButton = ""
		sElement = "Tap Note"
	end

	if string.find(sElement, "Tap Explosion") then
		sElement = "Tap Explosion Bright"
		sButton = ""
	end
	
	if string.find(sElement, "Receptor")
	or string.find(sElement, "Active")
	or string.find(sElement, "Inactive")
	or string.find(sElement, "Tap Mine") then
		sButton = ""
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

local OldFunc = noteskin.Load
function noteskin.Load()
	local t = OldFunc()

	-- The main "Explosion" part just loads other actors; don't rotate
	-- it.  The "Hold Explosion" part should not be rotated.
	if Var "Element" == "Explosion" 
	or Var "Element" == "Roll Explosion" then
		t.BaseRotationZ = nil
	end
	return t
end

noteskin.PartsToRotate = {
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
noteskin.Rotate = {
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = 225
}

noteskin.Blank = {
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

return noteskin
