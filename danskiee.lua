-- =========================
-- PREMIUM HUB GUI
-- =========================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player.PlayerGui
ScreenGui.ResetOnSpawn = false

-- MAIN
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,450,0,270)
Main.Position = UDim2.new(0.5,-225,0.5,-135)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Active = true
Main.Draggable = true

Instance.new("UICorner",Main).CornerRadius = UDim.new(0,10)

-- TOP BAR
local Top = Instance.new("Frame")
Top.Parent = Main
Top.Size = UDim2.new(1,0,0,35)
Top.BackgroundColor3 = Color3.fromRGB(30,30,30)

Instance.new("UICorner",Top).CornerRadius = UDim.new(0,10)

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = Top
Title.Size = UDim2.new(1,-40,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Premium Script Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

-- MINIMIZE
local Minimize = Instance.new("TextButton")
Minimize.Parent = Top
Minimize.Size = UDim2.new(0,30,0,25)
Minimize.Position = UDim2.new(1,-35,0.5,-12)
Minimize.BackgroundColor3 = Color3.fromRGB(50,50,50)
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",Minimize).CornerRadius = UDim.new(0,6)

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Parent = Main
Sidebar.Position = UDim2.new(0,0,0,35)
Sidebar.Size = UDim2.new(0,120,1,-35)
Sidebar.BackgroundColor3 = Color3.fromRGB(28,28,28)

-- CONTENT
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0,120,0,35)
Content.Size = UDim2.new(1,-120,1,-35)
Content.BackgroundTransparency = 1

-- TAB LAYOUT
local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = Sidebar
TabLayout.Padding = UDim.new(0,5)

-- PAGE SYSTEM
local Pages = {}

local function createPage(name)

	local page = Instance.new("Frame")
	page.Parent = Content
	page.Size = UDim2.new(1,0,1,0)
	page.BackgroundTransparency = 1
	page.Visible = false

	local layout = Instance.new("UIListLayout")
	layout.Parent = page
	layout.Padding = UDim.new(0,6)

	Pages[name] = page

	return page
end

local function createTab(name)

	local btn = Instance.new("TextButton")
	btn.Parent = Sidebar
	btn.Size = UDim2.new(1,0,0,35)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextSize = 14

	Instance.new("UICorner",btn).CornerRadius = UDim.new(0,6)

	btn.MouseButton1Click:Connect(function()

		for _,p in pairs(Pages) do
			p.Visible = false
		end

		Pages[name].Visible = true

	end)

end

local function createButton(page,text)

	local btn = Instance.new("TextButton")
	btn.Parent = page
	btn.Size = UDim2.new(0.9,0,0,35)
	btn.Position = UDim2.new(0.05,0,0,0)
	btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextSize = 14

	Instance.new("UICorner",btn).CornerRadius = UDim.new(0,6)

	return btn

end

-- CREATE PAGES
local PlayerPage = createPage("Player")
local TeleportPage = createPage("Teleport")
local ServerPage = createPage("Server")

-- CREATE TABS
createTab("Player")
createTab("Teleport")
createTab("Server")

Pages["Player"].Visible = true

-- EXAMPLE BUTTONS
createButton(PlayerPage,"Fly")
createButton(PlayerPage,"Speed Boost")
createButton(PlayerPage,"Noclip")

createButton(TeleportPage,"Teleport Player")

createButton(ServerPage,"Rejoin")
createButton(ServerPage,"Server Hop")

-- MINIMIZE FUNCTION
local minimized = false

Minimize.MouseButton1Click:Connect(function()

	minimized = not minimized

	if minimized then
		Content.Visible = false
		Sidebar.Visible = false
		Main.Size = UDim2.new(0,200,0,35)
	else
		Content.Visible = true
		Sidebar.Visible = true
		Main.Size = UDim2.new(0,450,0,270)
	end

end)
