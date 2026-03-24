--// PREMIUM EXECUTOR STYLE GUI
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

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
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
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

-- FEATURE BUTTON TEMPLATE
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

-- MINIMIZE ICON
local Icon = Instance.new("TextButton",ScreenGui)
Icon.Size = UDim2.new(0,50,0,50)
Icon.Position = UDim2.new(0.05,0,0.8,0)
Icon.Text = "⚡"
Icon.Visible = false
Icon.TextSize = 22
Icon.Font = Enum.Font.GothamBold
Icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
Icon.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Icon).CornerRadius = UDim.new(1,0)

-- CLOSE CONFIRM
local Confirm = Instance.new("Frame",ScreenGui)
Confirm.Size = UDim2.new(0,260,0,120)
Confirm.Position = UDim2.new(0.5,-130,0.5,-60)
Confirm.BackgroundColor3 = Color3.fromRGB(30,30,30)
Confirm.Visible = false
Instance.new("UICorner",Confirm)

local Text = Instance.new("TextLabel",Confirm)
Text.Text = "Yakin ingin menutup GUI?"
Text.Size = UDim2.new(1,0,0,60)
Text.BackgroundTransparency = 1
Text.TextColor3 = Color3.new(1,1,1)
Text.Font = Enum.Font.GothamBold

local Yes = Instance.new("TextButton",Confirm)
Yes.Text = "Yakin"
Yes.Size = UDim2.new(0.4,0,0,35)
Yes.Position = UDim2.new(0.05,0,0.6,0)
Yes.BackgroundColor3 = Color3.fromRGB(180,50,50)
Yes.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Yes)

local Cancel = Instance.new("TextButton",Confirm)
Cancel.Text = "Batal"
Cancel.Size = UDim2.new(0.4,0,0,35)
Cancel.Position = UDim2.new(0.55,0,0.6,0)
Cancel.BackgroundColor3 = Color3.fromRGB(60,60,60)
Cancel.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Cancel)

-- WELCOME ANIMATION
local Welcome = Instance.new("TextLabel",ScreenGui)
Welcome.Size = UDim2.new(0,400,0,50)
Welcome.Position = UDim2.new(0.5,-200,0.2,0)
Welcome.Text = "Welcome, Loading Premium GUI..."
Welcome.Font = Enum.Font.GothamBold
Welcome.TextSize = 22
Welcome.BackgroundTransparency = 1
Welcome.TextColor3 = Color3.new(1,1,1)

TweenService:Create(Welcome,TweenInfo.new(1.2),{
TextTransparency = 1
}):Play()

task.delay(1.3,function()
Welcome:Destroy()
end)

-- MINIMIZE
Minimize.MouseButton1Click:Connect(function()

TweenService:Create(Main,TweenInfo.new(0.35),{
Size = UDim2.new(0,0,0,0),
Position = Icon.Position
}):Play()

task.wait(0.35)
Main.Visible = false
Icon.Visible = true

end)

-- OPEN FROM ICON
Icon.MouseButton1Click:Connect(function()

Main.Visible = true

TweenService:Create(Main,TweenInfo.new(0.35),{
Size = UDim2.new(0,420,0,260),
Position = UDim2.new(0.5,-210,0.5,-130)
}):Play()

Icon.Visible = false

end)

-- CLOSE
Close.MouseButton1Click:Connect(function()
Confirm.Visible = true
end)

Cancel.MouseButton1Click:Connect(function()
Confirm.Visible = false
end)

Yes.MouseButton1Click:Connect(function()
ScreenGui:Destroy()
end)

-- DRAG
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
