--// PREMIUM EXECUTOR GUI (SMOOTH VERSION)

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "PremiumGui"

-- MAIN
local Main = Instance.new("Frame",ScreenGui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0

Instance.new("UICorner",Main).CornerRadius = UDim.new(0,12)

-- TOPBAR
local Top = Instance.new("Frame",Main)
Top.Size = UDim2.new(1,0,0,40)
Top.BackgroundColor3 = Color3.fromRGB(30,30,30)
Top.BorderSizePixel = 0
Instance.new("UICorner",Top).CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel",Top)
Title.Text = "Premium Executor"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,12,0,0)
Title.Size = UDim2.new(0.6,0,1,0)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- MINIMIZE
local Minimize = Instance.new("TextButton",Top)
Minimize.Text = "-"
Minimize.Size = UDim2.new(0,30,0,25)
Minimize.Position = UDim2.new(1,-70,0.5,-12)
Minimize.BackgroundColor3 = Color3.fromRGB(60,60,60)
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Font = Enum.Font.GothamBold
Instance.new("UICorner",Minimize)

-- CLOSE
local Close = Instance.new("TextButton",Top)
Close.Text = "X"
Close.Size = UDim2.new(0,30,0,25)
Close.Position = UDim2.new(1,-35,0.5,-12)
Close.BackgroundColor3 = Color3.fromRGB(180,50,50)
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Instance.new("UICorner",Close)

-- CONTENT
local Content = Instance.new("Frame",Main)
Content.Size = UDim2.new(1,0,1,-40)
Content.Position = UDim2.new(0,0,0,40)
Content.BackgroundTransparency = 1

-- ICON
local Icon = Instance.new("TextButton",ScreenGui)
Icon.Size = UDim2.new(0,50,0,50)
Icon.Position = UDim2.new(0.05,0,0.8,0)
Icon.Text = "⚡"
Icon.Visible = false
Icon.TextSize = 22
Icon.Font = Enum.Font.GothamBlack
Icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
Icon.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",Icon).CornerRadius = UDim.new(1,0)

-- FEATURE BUTTON
local function createButton(text,posY)

	local btn = Instance.new("TextButton",Content)
	btn.Size = UDim2.new(0.9,0,0,40)
	btn.Position = UDim2.new(0.05,0,0,posY)
	btn.Text = text.." : OFF"
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14

	Instance.new("UICorner",btn)

	local on = false

	-- hover animation
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			Size = UDim2.new(0.92,0,0,42)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			Size = UDim2.new(0.9,0,0,40)
		}):Play()
	end)

	btn.MouseButton1Click:Connect(function()

		on = not on
		btn.Text = text.." : "..(on and "ON" or "OFF")

		TweenService:Create(btn,TweenInfo.new(0.2),{
			BackgroundColor3 = on and Color3.fromRGB(60,150,80) or Color3.fromRGB(40,40,40)
		}):Play()

	end)

end

createButton("Fly",10)
createButton("Speed",60)
createButton("Noclip",110)

-- WELCOME ANIMATION
local Welcome = Instance.new("TextLabel",ScreenGui)
Welcome.Size = UDim2.new(0,400,0,50)
Welcome.Position = UDim2.new(0.5,-200,0.15,0)
Welcome.Text = "Welcome, Loading Premium GUI..."
Welcome.Font = Enum.Font.GothamBlack
Welcome.TextSize = 24
Welcome.BackgroundTransparency = 1
Welcome.TextColor3 = Color3.new(1,1,1)

Welcome.TextTransparency = 1

TweenService:Create(Welcome,TweenInfo.new(0.8),{
	TextTransparency = 0,
	Position = UDim2.new(0.5,-200,0.2,0)
}):Play()

task.delay(1.6,function()

	TweenService:Create(Welcome,TweenInfo.new(0.8),{
		TextTransparency = 1,
		Position = UDim2.new(0.5,-200,0.1,0)
	}):Play()

	task.wait(0.8)
	Welcome:Destroy()

end)

-- MINIMIZE
Minimize.MouseButton1Click:Connect(function()

	TweenService:Create(Main,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{
		Position = UDim2.new(0.05,0,0.8,0),
		Size = UDim2.new(0,60,0,60)
	}):Play()

	task.wait(0.35)

	Main.Visible = false
	Icon.Visible = true

	TweenService:Create(Icon,TweenInfo.new(0.25),{
		Size = UDim2.new(0,55,0,55)
	}):Play()

end)

-- OPEN FROM ICON
Icon.MouseButton1Click:Connect(function()

	Main.Visible = true

	Main.Size = UDim2.new(0,60,0,60)
	Main.Position = Icon.Position

	TweenService:Create(Main,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
		Size = UDim2.new(0,420,0,260),
		Position = UDim2.new(0.5,-210,0.5,-130)
	}):Play()

	Icon.Visible = false

end)

-- DRAG SYSTEM
local dragging = false
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
