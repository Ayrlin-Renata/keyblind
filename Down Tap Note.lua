local t =
	Def.ActorFrame {
	Def.Sprite {
		Texture = "_bar",
		Frame0000 = 0,
		Delay0000 = 1,
		InitCommand = function(self)
			self:xy(0,0):baserotationz(0)
		end
	},
	Def.Sprite {
		Texture = "_arrow",
		Frame0000 = 0,
		Delay0000 = 1
	}
}
return t
