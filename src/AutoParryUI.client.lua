-- Auto Parry UI Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoParryUI"
screenGui.Parent = playerGui

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Create a TextButton
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.5, -25)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Text = "Auto Parry: OFF"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

-- Function to toggle auto parry
local function toggleAutoParry()
    local autoParryEnabled = not game.ReplicatedStorage:WaitForChild("AutoParryEnabled").Value
    game.ReplicatedStorage.AutoParryEnabled.Value = autoParryEnabled
    button.Text = autoParryEnabled and "Auto Parry: ON" or "Auto Parry: OFF"
end

-- Connect the button click event
button.MouseButton1Click:Connect(toggleAutoParry)

-- Initialize the auto parry state
if not game.ReplicatedStorage:FindFirstChild("AutoParryEnabled") then
    local autoParryEnabled = Instance.new("BoolValue")
    autoParryEnabled.Name = "AutoParryEnabled"
    autoParryEnabled.Value = false
    autoParryEnabled.Parent = game.ReplicatedStorage
end

button.Text = game.ReplicatedStorage.AutoParryEnabled.Value and "Auto Parry: ON" or "Auto Parry: OFF"