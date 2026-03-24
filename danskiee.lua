-- PREMIUM EXECUTOR LOADER + GUI

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "PremiumLoader"

-------------------------------------------------
-- LOADING SCREEN
-------------------------------------------------

local Loader = Instance.new("Frame",ScreenGui)
Loader.Size = UDim2.new(1,0,1,0)
Loader.BackgroundColor3 = Color3.fromRGB(15,15,15)

local Title = Instance.new("TextLabel",Loader)
Title.Size = UDim2.new(1,0,0,60)
Title.Position = UDim2.new(0,0,0.4,0)
Title.Text = ""
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 28
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1

local BarBG = Instance.new("Frame",Loader)
BarBG.Size = UDim2.new(0,300,0,10)
BarBG.Position = UDim2.new(0.5,-150,0.5,20)
BarBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner",BarBG)

local Bar = Instance.new("Frame",BarBG)
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner",Bar)

-------------------------------------------------
-- TEXT TYPING ANIMATION
-------------------------------------------------

local text = "Executing Premium Script..."

for i = 1,#text do
	Title.Text = string.sub(text,1,i)
	task.wait(0.05)
end

-------------------------------------------------
-- PROGRESS BAR ANIMATION (5 DETIK)
-------------------------------------------------

TweenService:Create(
	Bar,
	TweenInfo.new(5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
	{Size = UDim2.new(1,0,1,0)}
):Play()

task.wait(5)

-------------------------------------------------
-- DELAY 3 DETIK
-------------------------------------------------

task.wait(3)

-------------------------------------------------
-- HIDE LOADER
-------------------------------------------------

TweenService:Create(
	Loader,
	TweenInfo.new(0.5),
	{BackgroundTransparency = 1}
):Play()

task.wait(0.5)

Loader:Destroy()

-------------------------------------------------
-- MAIN GUI
-------------------------------------------------

local Main = Instance.new("Frame",ScreenGui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Instance.new("UICorner",Main)

-------------------------------------------------
-- TOPBAR
-------------------------------------------------

local Top = Instance.new("Frame",Main)
Top.Size = UDim2.new(1,0,0,40)
Top.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner",Top)

local Title2 = Instance.new("TextLabel",Top)
Title2.Text = "Premium Executor"
Title2.Size = UDim2.new(1,0,1,0)
Title2.BackgroundTransparency = 1
Title2.Font = Enum.Font.GothamBlack
Title2.TextColor3 = Color3.new(1,1,1)
Title2.TextSize = 18

-------------------------------------------------
-- BUTTON TEMPLATE
-------------------------------------------------

local Content = Instance.new("Frame",Main)
Content.Size = UDim2.new(1,0,1,-40)
Content.Position = UDim2.new(0,0,0,40)
Content.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout",Content)
Layout.Padding = UDim.new(0,10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Center

local function Button(text)

	local btn = Instance.new("TextButton",Content)

	btn.Size = UDim2.new(0.9,0,0,40)
	btn.Text = text.." : OFF"
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 15

	Instance.new("UICorner",btn)

	local state = false

	btn.MouseButton1Click:Connect(function()

		state = not state

		btn.Text = text.." : "..(state and "ON" or "OFF")

		TweenService:Create(btn,TweenInfo.new(0.25),{
			BackgroundColor3 = state and Color3.fromRGB(70,170,90) or Color3.fromRGB(40,40,40)
		}):Play()

	end)

end

Button("Fly")
Button("Speed")
Button("Noclip")
Button("Teleport")

-------------------------------------------------
-- ICON MINIMIZE
-------------------------------------------------

local Icon = Instance.new("TextButton",ScreenGui)

Icon.Size = UDim2.new(0,50,0,50)
Icon.Position = UDim2.new(0.05,0,0.8,0)
Icon.Text = "⚡"
Icon.Font = Enum.Font.GothamBlack
Icon.TextSize = 25
Icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
Icon.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",Icon).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- DRAG ICON FIX
-------------------------------------------------

local dragging = false
local dragStart
local startPos

Icon.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = true
		dragStart = input.Position
		startPos = Icon.Position

	end

end)

UIS.InputChanged:Connect(function(input)

	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

		local delta = input.Position - dragStart

		Icon.Position = UDim2.new(
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
