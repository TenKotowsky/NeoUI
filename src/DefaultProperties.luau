--not all properties are here, but feel free to modify the defaultProperties table, add your own properties and change whathever you want

local defaultProperties = {
	ScreenGui = {
		Enabled = true,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 0
	},
	SurfaceGui = {
		Enabled = true,
		ResetOnSpawn = false,
		AlwaysOnTop = false
	},
	BillboardGui = {
		Enabled = true,
		ResetOnSpawn = false,
		AlwaysOnTop = false
	},
	Frame = {
		Size = UDim2.new(0.5,0,0.5,0),
	},
	ScrollingFrame = {
		Size = UDim2.new(0.5,0,0.5,0),
		CanvasSize = UDim2.new(0,0,1,0),
		AutomaticCanvasSize = Enum.AutomaticSize.XY
	},
	ViewportFrame = {
		Size = UDim2.new(0.5,0,0.5,0),
	},
	VideoFrame = {
		Size = UDim2.new(0.5,0,0.5,0),
	},
	TextBox = {
		Size = UDim2.new(0.5,0,0.5,0),

		TextScaled = true
	},
	TextButton = {
		Size = UDim2.new(0.5,0,0.5,0),

		TextScaled = true
	},
	TextLabel = {
		Size = UDim2.new(0.5,0,0.5,0),

		TextScaled = true
	},
	ImageLabel = {
		Size = UDim2.new(0.5,0,0.5,0),
		
		BackgroundTransparency = 1
	},
	ImageButton = {
		Size = UDim2.new(0.5,0,0.5,0),

		BackgroundTransparency = 1
	},
	CanvasGroup = {
		Size = UDim2.new(0.5,0,0.5,0)
	},
	Path2D = {
		Size = UDim2.new(0.5,0,0.5,0)
	}
}

return defaultProperties