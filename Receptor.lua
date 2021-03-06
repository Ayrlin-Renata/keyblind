local t =
	Def.ActorFrame {
	Def.Sprite {
		Texture = "recpts/" .. tostring(NOTESKIN:GetMetric("NoteskinPreferences","ReceptorType")) .. "/_receptor",
		Frame0000 = 0,
		Delay0000 = 1,
		InitCommand = NOTESKIN:GetMetricA("ReceptorArrow", "InitCommand"),
		NoneCommand = NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand")
	},
	Def.Sprite {
		Texture = "_rflash",
		Frame0000 = 0,
		Delay0000 = 1,
		InitCommand = NOTESKIN:GetMetricA("ReceptorStatic", "InitCommand"),
		PressCommand = NOTESKIN:GetMetricA("ReceptorStatic", "PressCommand"),
		LiftCommand = NOTESKIN:GetMetricA("ReceptorStatic", "LiftCommand"),
		NoneCommand = NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand")
	},
	Def.Sprite {
		Texture = "_eclipse",
		Frame0000 = 0,
		Delay0000 = 1,
		InitCommand = NOTESKIN:GetMetricA("ReceptorOverlay", "InitCommand"),
		PressCommand = NOTESKIN:GetMetricA("ReceptorOverlay", "PressCommand"),
		LiftCommand = NOTESKIN:GetMetricA("ReceptorOverlay", "LiftCommand"),
		NoneCommand = NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand")
	}
}
return t
