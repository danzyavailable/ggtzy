--// PREMIUM EXECUTOR GUI (ULTIMATE SMOOTH VERSION)
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "PremiumExecutor_v2"
ScreenGui.ResetOnSpawn = false

-- Services & Variables
local FlyConnection, NoclipConnection
local FlyEnabled, SpeedEnabled, NoclipEnabled = false, false, false

-------------------------------------------------
-- MAIN GUI
-------------------------------------------------
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 450, 0, 320)
Main.Position = UDim2.new(0.5, -225, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 16)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(0, 170, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.7

-------------------------------------------------
-- BACKGROUND GRADIENT
-------------------------------------------------
local MainGradient = Instance.new("UIGradient", Main)
MainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
MainGradient.Rotation = 45

-------------------------------------------------
-- TOPBAR
-------------------------------------------------
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1, 0, 0, 50)
Top.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Top.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner", Top)
TopCorner.CornerRadius = UDim.new(0, 16)

local TopGradient = Instance.new("UIGradient", Top)
TopGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 45))
}

local Title = Instance.new("TextLabel", Top)
Title.Text = "⚡ PREMIUM EXECUTOR"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 0)
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeTransparency = 0.8
Title.TextStrokeColor3 = Color3.new(0, 0, 0)

-------------------------------------------------
-- BUTTONS (MINIMIZE/CLOSE)
-------------------------------------------------
local Minimize = Instance.new("TextButton", Top)
Minimize.Text = "−"
Minimize.Size = UDim2.new(0, 35, 0, 30)
Minimize.Position = UDim2.new(1, -75, 0.5, -15)
Minimize.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
Minimize.TextColor3 = Color3.new(1, 1, 1)
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 20
Instance.new("UICorner", Minimize).CornerRadius = UDim.new(0, 8)

local Close = Instance.new("TextButton", Top)
Close.Text = "✕"
Close.Size = UDim2.new(0, 35, 0, 30)
Close.Position = UDim2.new(1, -35, 0.5, -15)
Close.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 8)

-------------------------------------------------
-- CONTENT FRAME
-------------------------------------------------
local Content = Instance.new("ScrollingFrame", Main)
Content.Size = UDim2.new(1, -20, 1, -70)
Content.Position = UDim2.new(0, 10, 0, 60)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
Content.ScrollingDirection = Enum.ScrollingDirection.Y

local ContentLayout = Instance.new("UIListLayout", Content)
ContentLayout.Padding = UDim.new(0, 15)
ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Content.CanvasSize = UDim2.new(0, 0, 0, 0)

-------------------------------------------------
-- SMOOTH ICON (MINIMIZED STATE)
-------------------------------------------------
local Icon = Instance.new("TextButton", ScreenGui)
Icon.Size = UDim2.new(0, 60, 0, 60)
Icon.Position = UDim2.new(1, -80, 1, -80)
Icon.Text = "⚡"
Icon.Visible = false
Icon.TextSize = 28
Icon.Font = Enum.Font.GothamBlack
Icon.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Icon.TextColor3 = Color3.new(1, 1, 1)

local IconCorner = Instance.new("UICorner", Icon)
IconCorner.CornerRadius = UDim.new(1, 0)

local IconStroke = Instance.new("UIStroke", Icon)
IconStroke.Color = Color3.fromRGB(0, 170, 255)
IconStroke.Thickness = 2

local IconGradient = Instance.new("UIGradient", Icon)
IconGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}

-------------------------------------------------
-- ADVANCED BUTTON CREATOR
-------------------------------------------------
local function createPremiumButton(text, callback)
    local btn = Instance.new("TextButton", Content)
    btn.Size = UDim2.new(0.9, 0, 0, 55)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    btn.Text = text .. " : OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 12)
    
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Color = Color3.fromRGB(60, 60, 70)
    btnStroke.Thickness = 1
    
    local btnGradient = Instance.new("UIGradient", btn)
    btnGradient.Color = ColorSequence.new(Color3.fromRGB(55, 55, 65), Color3.fromRGB(40, 40, 50))
    
    local state = false
    
    -- CLICK ANIMATION
    btn.MouseButton1Click:Connect(function()
        state = not state
        callback(state)
        
        local targetColor = state and Color3.fromRGB(80, 160, 90) or Color3.fromRGB(45, 45, 55)
        local targetStroke = state and Color3.fromRGB(100, 200, 110) or Color3.fromRGB(60, 60, 70)
        
        btn.Text = text .. " : " .. (state and "ON" or "OFF")
        
        TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            BackgroundColor3 = targetColor,
            Size = UDim2.new(0.92, 0, 0, 58)
        }):Play()
        
        TweenService:Create(btnStroke, TweenInfo.new(0.3), {Color = targetStroke}):Play()
        
        task.wait(0.15)
        TweenService:Create(btn, TweenInfo.new(0.2), {
            Size = UDim2.new(0.9, 0, 0, 55)
        }):Play()
    end)
    
    -- HOVER ANIMATION
    btn.MouseEnter:Connect(function()
        if not state then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 70),
                Size = UDim2.new(0.92, 0, 0, 57)
            }):Play()
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if not state then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(45, 45, 55),
                Size = UDim2.new(0.9, 0, 0, 55)
            }):Play()
        end
    end)
    
    return btn
end

-------------------------------------------------
-- WORKING FEATURES
-------------------------------------------------
local Character = player.Character or player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- FLY
createPremiumButton("✈️ Fly", function(enabled)
    FlyEnabled = enabled
    if enabled then
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(4000, 4000, 4000)
        bv.Parent = RootPart
        
        FlyConnection = RunService.Heartbeat:Connect(function()
            if FlyEnabled and RootPart then
                local cam = workspace.CurrentCamera
                local move = cam.CFrame.LookVector * (UIS:IsKeyDown(Enum.KeyCode.W) and 1 or 0) +
                           cam.CFrame.RightVector * (UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0) +
                           cam.CFrame.LookVector * (UIS:IsKeyDown(Enum.KeyCode.S) and -1 or 0) +
                           cam.CFrame.RightVector * (UIS:IsKeyDown(Enum.KeyCode.A) and -1 or 0)
                bv.Velocity = move * 50 + Vector3.new(0, (UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or UIS:IsKeyDown(Enum.KeyCode.LeftShift) and -1 or 0) * 50, 0)
            end
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() FlyConnection = nil end
        if RootPart:FindFirstChild("BodyVelocity") then RootPart.BodyVelocity:Destroy() end
    end
end)

-- SPEED
createPremiumButton("⚡ Speed", function(enabled)
    SpeedEnabled = enabled
    Humanoid.WalkSpeed = enabled and 60 or 16
end)

-- NOCLIP
createPremiumButton("👻 Noclip", function(enabled)
    NoclipEnabled = enabled
    if enabled then
        NoclipConnection = RunService.Stepped:Connect(function()
            if NoclipEnabled then
                for _, part in pairs(Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        if NoclipConnection then NoclipConnection:Disconnect() NoclipConnection = nil end
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end)

-------------------------------------------------
-- BUTTON ANIMATIONS (MINIMIZE/CLOSE)
-------------------------------------------------
local function animateButton(btn, hoverColor, clickColor)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = clickColor}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = hoverColor}):Play()
    end)
end

animateButton(Minimize, Color3.fromRGB(90, 90, 100), Color3.fromRGB(110, 110, 120))
animateButton(Close, Color3.fromRGB(240, 70, 70), Color3.fromRGB(255, 90, 90))

-------------------------------------------------
-- MINIMIZE/RESTORE FUNCTIONALITY
-------------------------------------------------
Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    Icon.Visible = true
    
    TweenService:Create(Icon, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 70, 0, 70),
        Rotation = 360
    }):Play()
end)

Icon.MouseButton1Click:Connect(function()
    Icon.Visible = false
    Main.Visible = true
    
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 470, 0, 340),
        Position = UDim2.new(0.5, -235, 0.5, -170)
    }):Play()
    
    task.wait(0.5)
    TweenService:Create(Main, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 450, 0, 320),
        Position = UDim2.new(0.5, -225, 0.5, -160)
    }):Play()
end)

-------------------------------------------------
-- CLOSE BUTTON (FIXED!)
-------------------------------------------------
Close.MouseButton1Click:Connect(function()
    -- CLEANUP
    if FlyConnection then FlyConnection:Disconnect() end
    if NoclipConnection then NoclipConnection:Disconnect() end
    
    TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    
    TweenService:Create(Icon, TweenInfo.new(0.4), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    task.wait(0.4)
    ScreenGui:Destroy()
end)

-------------------------------------------------
-- DRAG SYSTEM (MAIN + ICON)
-------------------------------------------------
local function makeDraggable(frame)
    local dragging = false
    local dragStart, startPos
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

makeDraggable(Top)
makeDraggable(Icon)

-------------------------------------------------
-- AUTO UPDATE CANVAS SIZE
-------------------------------------------------
ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Content.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 30)
end)

-------------------------------------------------
-- WELCOME ANIMATION
-------------------------------------------------
local Welcome = Instance.new("TextLabel", ScreenGui)
Welcome.Size = UDim2.new(0, 500, 0, 70)
Welcome.Position = UDim2.new(0.5, -250, -0.2, 0)
Welcome.Text = "⚡ PREMIUM EXECUTOR LOADED!"
Welcome.Font = Enum.Font.GothamBlack
Welcome.TextSize = 32
Welcome.BackgroundTransparency = 1
Welcome.TextColor3 = Color3.fromRGB(0, 170, 255)
Welcome.TextStrokeTransparency = 0.7
Welcome.TextStrokeColor3 = Color3.new(0, 0, 0)

Welcome.TextTransparency = 1
Welcome.Position = UDim2.new(0.5, -250, -1, 0)
Welcome.Rotation = -15

TweenService:Create(Welcome, TweenInfo.new(1, Enum.EasingStyle.Back), {
    TextTransparency = 0,
    Position = UDim2.new(0.5, -250, 0.3, 0),
    Rotation = 0
}):Play()

task.delay(2, function()
    TweenService:Create(Welcome, TweenInfo.new(1, Enum.EasingStyle.Back), {
        TextTransparency = 1,
        Position = UDim2.new(0.5, -250, 0.6, 0),
        Rotation = 15
    }):Play()
    
    task.wait(1)
    Welcome:Destroy()
end)

-- INITIAL APPEARANCE ANIMATION
Main.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(Main, TweenInfo.new(0.8, Enum.EasingStyle.Back), {
    Size = UDim2.new(0, 450, 0, 320)
}):Play()

print("✅ Premium Executor v2 Loaded - Fully Smooth & Functional!")
