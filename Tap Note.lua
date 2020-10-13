local sButton = Var "Button"
local counterRotation = {
	["Up"] = 180,
	["Down"] = 0,
	["Left"] = 270,
	["Right"] = 90,
	["UpLeft"] = 225,
	["UpRight"] = 135
}
local t =
	Def.ActorFrame {
	Def.Sprite {
		Texture = "bars/" .. tostring(NOTESKIN:GetMetric("NoteskinPreferences","NoteBarType")) .. "/_bar",
		Frame0000 = 0,
		Delay0000 = 1,
		InitCommand = function(self)
			self:xy(0,0):baserotationz(counterRotation[sButton])
		end
	},
	Def.Sprite {
		Texture = "notes/" .. tostring(NOTESKIN:GetMetric("NoteskinPreferences","NoteArrowType")) .. "/_arrow",
		Frame0000 = 0,
		Delay0000 = 1
	}
}
return t
