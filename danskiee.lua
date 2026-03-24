-- =========================
-- DANSKIEE HUB FULL LOADER
-- =========================

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "DanskieeLoader"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- MAIN FRAME
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,380,0,130)
main.Position = UDim2.new(0.5,-190,0.5,-65)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)

Instance.new("UICorner",main).CornerRadius = UDim.new(0,12)

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1,0,0,45)
title.BackgroundTransparency = 1
title.Text = "DANSKIEE HUB"
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255,255,255)

-- EXECUTING TEXT
local text = Instance.new("TextLabel")
text.Parent = main
text.Position = UDim2.new(0,0,0,45)
text.Size = UDim2.new(1,0,0,25)
text.BackgroundTransparency = 1
text.Text = "Executing..."
text.Font = Enum.Font.GothamBold
text.TextSize = 16
text.TextColor3 = Color3.fromRGB(200,200,200)

-- BAR BACKGROUND
local barBG = Instance.new("Frame")
barBG.Parent = main
barBG.Position = UDim2.new(0.07,0,0.72,0)
barBG.Size = UDim2.new(0.86,0,0,14)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)

Instance.new("UICorner",barBG).CornerRadius = UDim.new(0,7)

-- BAR
local bar = Instance.new("Frame")
bar.Parent = barBG
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)

Instance.new("UICorner",bar).CornerRadius = UDim.new(0,7)

-- LOADING BAR ANIMATION
local tween = TweenService:Create(
	bar,
	TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{Size = UDim2.new(1,0,1,0)}
)

tween:Play()

-- EXECUTING TEXT ANIMATION
task.spawn(function()
	while tween.PlaybackState ~= Enum.PlaybackState.Completed do
		text.Text = "Executing."
		task.wait(0.35)

		text.Text = "Executing.."
		task.wait(0.35)

		text.Text = "Executing..."
		task.wait(0.35)
	end
end)

-- TITLE FLOAT ANIMATION
local floatTween = TweenService:Create(
	title,
	TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
	{Position = UDim2.new(0,0,0,5)}
)

floatTween:Play()

-- AFTER LOADING
tween.Completed:Connect(function()

	task.wait(0.6)

	local closeTween = TweenService:Create(
		main,
		TweenInfo.new(0.4, Enum.EasingStyle.Quad),
		{Size = UDim2.new(0,0,0,0)}
	)

	closeTween:Play()

	closeTween.Completed:Connect(function()
		gui:Destroy()

		-- =========================
		-- EXECUTE SCRIPT DARI GITHUB
		-- =========================

		loadstring(game:HttpGet("https://raw.githubusercontent.com/danzyavailable/ggtzy/main/danskiee.lua"))()

	end)

end)
