--// PREMIUM TASKBAR GUI

local TweenService = game:GetService("TweenService")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "PremiumTaskbar"

-- MAIN FRAME
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,420,0,220)
Main.Position = UDim2.new(0.5,-210,0.5,-110)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.BorderSizePixel = 0

local UICorner = Instance.new("UICorner",Main)
UICorner.CornerRadius = UDim.new(0,10)

-- TOPBAR
local Top = Instance.new("Frame")
Top.Parent = Main
Top.Size = UDim2.new(1,0,0,35)
Top.BackgroundColor3 = Color3.fromRGB(35,35,35)
Top.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner",Top)
TopCorner.CornerRadius = UDim.new(0,10)

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = Top
Title.Size = UDim2.new(1,-80,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.Text = "Premium Taskbar"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- MINIMIZE BUTTON
local Minimize = Instance.new("TextButton")
Minimize.Parent = Top
Minimize.Size = UDim2.new(0,30,0,25)
Minimize.Position = UDim2.new(1,-70,0.5,-12)
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 18
Minimize.BackgroundColor3 = Color3.fromRGB(50,50,50)
Minimize.TextColor3 = Color3.fromRGB(255,255,255)

local MinCorner = Instance.new("UICorner",Minimize)
MinCorner.CornerRadius = UDim.new(0,6)

-- CLOSE BUTTON
local Close = Instance.new("TextButton")
Close.Parent = Top
Close.Size = UDim2.new(0,30,0,25)
Close.Position = UDim2.new(1,-35,0.5,-12)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.BackgroundColor3 = Color3.fromRGB(170,40,40)
Close.TextColor3 = Color3.fromRGB(255,255,255)

local CloseCorner = Instance.new("UICorner",Close)
CloseCorner.CornerRadius = UDim.new(0,6)

-- CONTENT
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Size = UDim2.new(1,0,1,-35)
Content.Position = UDim2.new(0,0,0,35)
Content.BackgroundTransparency = 1

-- CONTAINER TEXT
local Text = Instance.new("TextLabel")
Text.Parent = Content
Text.Size = UDim2.new(1,0,1,0)
Text.Text = "Premium GUI Ready"
Text.TextColor3 = Color3.fromRGB(255,255,255)
Text.BackgroundTransparency = 1
Text.Font = Enum.Font.GothamBold
Text.TextSize = 18

-- CLOSE CONFIRM
local Confirm = Instance.new("Frame")
Confirm.Parent = ScreenGui
Confirm.Size = UDim2.new(0,260,0,130)
Confirm.Position = UDim2.new(0.5,-130,0.5,-65)
Confirm.BackgroundColor3 = Color3.fromRGB(30,30,30)
Confirm.Visible = false
Confirm.BorderSizePixel = 0

local ConfirmCorner = Instance.new("UICorner",Confirm)
ConfirmCorner.CornerRadius = UDim.new(0,10)

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Parent = Confirm
ConfirmText.Size = UDim2.new(1,0,0,60)
ConfirmText.Text = "Apakah kamu yakin ingin menutup GUI?"
ConfirmText.TextColor3 = Color3.fromRGB(255,255,255)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Font = Enum.Font.GothamBold
ConfirmText.TextSize = 16

-- YAKIN BUTTON
local Yes = Instance.new("TextButton")
Yes.Parent = Confirm
Yes.Size = UDim2.new(0,100,0,35)
Yes.Position = UDim2.new(0.1,0,0.65,0)
Yes.Text = "Yakin"
Yes.Font = Enum.Font.GothamBold
Yes.TextSize = 14
Yes.BackgroundColor3 = Color3.fromRGB(170,40,40)
Yes.TextColor3 = Color3.new(1,1,1)

local YesCorner = Instance.new("UICorner",Yes)
YesCorner.CornerRadius = UDim.new(0,6)

-- BATAL BUTTON
local Cancel = Instance.new("TextButton")
Cancel.Parent = Confirm
Cancel.Size = UDim2.new(0,100,0,35)
Cancel.Position = UDim2.new(0.55,0,0.65,0)
Cancel.Text = "Batal"
Cancel.Font = Enum.Font.GothamBold
Cancel.TextSize = 14
Cancel.BackgroundColor3 = Color3.fromRGB(50,50,50)
Cancel.TextColor3 = Color3.new(1,1,1)

local CancelCorner = Instance.new("UICorner",Cancel)
CancelCorner.CornerRadius = UDim.new(0,6)

-- MINIMIZE FUNCTION
local minimized = false

Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	
	if minimized then
		TweenService:Create(Main,TweenInfo.new(0.3),{Size = UDim2.new(0,420,0,35)}):Play()
	else
		TweenService:Create(Main,TweenInfo.new(0.3),{Size = UDim2.new(0,420,0,220)}):Play()
	end
end)

-- CLOSE CLICK
Close.MouseButton1Click:Connect(function()
	Confirm.Visible = true
end)

-- CANCEL
Cancel.MouseButton1Click:Connect(function()
	Confirm.Visible = false
end)

-- YES CLOSE
Yes.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
