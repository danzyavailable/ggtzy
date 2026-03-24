--// PREMIUM SMOOTH GUI

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "PremiumGui"

-- MAIN
local Main = Instance.new("Frame",ScreenGui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Main.BorderSizePixel = 0
Instance.new("UICorner",Main).CornerRadius = UDim.new(0,12)

-- GRADIENT ANIMATION
local Gradient = Instance.new("UIGradient",Main)
Gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(60,60,255)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(120,0,255))
}

task.spawn(function()
	while true do
		TweenService:Create(Gradient,TweenInfo.new(6),{
			Rotation = Gradient.Rotation + 360
		}):Play()
		task.wait(6)
	end
end)

-- TOPBAR
local Top = Instance.new("Frame",Main)
Top.Size = UDim2.new(1,0,0,40)
Top.BackgroundColor3 = Color3.fromRGB(25,25,25)
Top.BorderSizePixel = 0
Instance.new("UICorner",Top)

local Title = Instance.new("TextLabel",Top)
Title.Text = "Premium Executor"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1,0,1,0)

-- MINIMIZE
local Minimize = Instance.new("TextButton",Top)
Minimize.Text = "—"
Minimize.Size = UDim2.new(0,35,0,25)
Minimize.Position = UDim2.new(1,-80,0.5,-12)
Minimize.BackgroundColor3 = Color3.fromRGB(70,70,70)
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Font = Enum.Font.GothamBold
Instance.new("UICorner",Minimize)

-- CLOSE
local Close = Instance.new("TextButton",Top)
Close.Text = "X"
Close.Size = UDim2.new(0,35,0,25)
Close.Position = UDim2.new(1,-40,0.5,-12)
Close.BackgroundColor3 = Color3.fromRGB(200,60,60)
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Instance.new("UICorner",Close)

-- CONTENT
local Content = Instance.new("Frame",Main)
Content.BackgroundTransparency = 1
Content.Size = UDim2.new(1,0,1,-40)
Content.Position = UDim2.new(0,0,0,40)

local Layout = Instance.new("UIListLayout",Content)
Layout.Padding = UDim.new(0,10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Center

-- FEATURE BUTTON
local function Feature(text)

	local btn = Instance.new("TextButton",Content)
	btn.Size = UDim2.new(0.9,0,0,40)
	btn.Text = text.." : OFF"
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 15
	Instance.new("UICorner",btn)

	local state = false

	-- hover animation
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(60,60,60)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(40,40,40)
		}):Play()
	end)

	btn.MouseButton1Click:Connect(function()

		state = not state

		btn.Text = text.." : "..(state and "ON" or "OFF")

		TweenService:Create(btn,TweenInfo.new(0.25),{
			BackgroundColor3 = state and Color3.fromRGB(70,160,90) or Color3.fromRGB(40,40,40)
		}):Play()

	end)

end

Feature("Fly")
Feature("Speed Boost")
Feature("Noclip")
Feature("Teleport Player")

-- ICON
local Icon = Instance.new("TextButton",ScreenGui)
Icon.Size = UDim2.new(0,55,0,55)
Icon.Position = UDim2.new(0.05,0,0.8,0)
Icon.Text = "⚡"
Icon.TextSize = 26
Icon.Font = Enum.Font.GothamBlack
Icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
Icon.TextColor3 = Color3.new(1,1,1)
Icon.Visible = false
Instance.new("UICorner",Icon).CornerRadius = UDim.new(1,0)

-- MINIMIZE
Minimize.MouseButton1Click:Connect(function()

	TweenService:Create(Main,TweenInfo.new(0.35),{
		Size = UDim2.new(0,60,0,60),
		Position = Icon.Position
	}):Play()

	task.wait(0.35)

	Main.Visible = false
	Icon.Visible = true

end)

-- OPEN
Icon.MouseButton1Click:Connect(function()

	Main.Visible = true
	Main.Size = UDim2.new(0,60,0,60)
	Main.Position = Icon.Position

	TweenService:Create(Main,TweenInfo.new(0.35),{
		Size = UDim2.new(0,420,0,260),
		Position = UDim2.new(0.5,-210,0.5,-130)
	}):Play()

	Icon.Visible = false

end)

-- CLOSE GUI
Close.MouseButton1Click:Connect(function()

	TweenService:Create(Main,TweenInfo.new(0.3),{
		BackgroundTransparency = 1
	}):Play()

	task.wait(0.3)

	ScreenGui:Destroy()

end)

-- DRAG MAIN
local dragging
local dragInput
local dragStart
local startPos

Top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

UIS.InputChanged:Connect(function(input)

	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

		local delta = input.Position - dragStart

		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)

	end

end)

UIS.InputEnded:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end

end)

-- DRAG ICON
local draggingIcon
local startIcon

Icon.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingIcon = true
		startIcon = input.Position
	end

end)

UIS.InputChanged:Connect(function(input)

	if draggingIcon then

		local delta = input.Position - startIcon

		Icon.Position = UDim2.new(
			Icon.Position.X.Scale,
			Icon.Position.X.Offset + delta.X,
			Icon.Position.Y.Scale,
			Icon.Position.Y.Offset + delta.Y
		)

		startIcon = input.Position

	end

end)

UIS.InputEnded:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingIcon = false
	end

end)

-- WELCOME
local Welcome = Instance.new("TextLabel",ScreenGui)
Welcome.Size = UDim2.new(0,420,0,50)
Welcome.Position = UDim2.new(0.5,-210,0.15,0)
Welcome.Text = "Executing Premium Script..."
Welcome.Font = Enum.Font.GothamBlack
Welcome.TextSize = 24
Welcome.BackgroundTransparency = 1
Welcome.TextColor3 = Color3.new(1,1,1)
Welcome.TextTransparency = 1

TweenService:Create(Welcome,TweenInfo.new(0.7),{
	TextTransparency = 0
}):Play()

task.wait(2)

TweenService:Create(Welcome,TweenInfo.new(0.7),{
	TextTransparency = 1
}):Play()

task.wait(0.7)

Welcome:Destroy()
