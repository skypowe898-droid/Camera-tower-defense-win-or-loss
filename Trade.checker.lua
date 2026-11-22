
-- CTD TRADE CALCULATOR
-- GUI BLACK & RED

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "CTDTradeCalculator"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(420, 390)
frame.Position = UDim2.new(0.5, -210, 0.5, -195)
frame.BackgroundColor3 = Color3.fromRGB(10,10,14)
frame.BorderSizePixel = 0
frame.Parent = gui

local outline = Instance.new("UIStroke")
outline.Color = Color3.fromRGB(255,0,0)
outline.Thickness = 3
outline.Parent = frame

local function label(text, y, height)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,-20,0,height)
    l.Position = UDim2.fromOffset(10,y)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = Color3.new(1,1,1)
    l.TextScaled = true
    l.Font = Enum.Font.GothamBold
    l.Parent = frame
    return l
end

label("CTD TRADE CALCULATOR",10,45)

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35,35)
close.Position = UDim2.new(1,-45,0,10)
close.Text = "X"
close.TextColor3 = Color3.new(1,0,0)
close.BackgroundColor3 = Color3.fromRGB(35,0,0)
close.Parent = frame

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local function input(placeholder,y)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1,-50,0,38)
    box.Position = UDim2.fromOffset(25,y)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextScaled = true
    box.Font = Enum.Font.Gotham
    box.TextColor3 = Color3.new(1,1,1)
    box.BackgroundColor3 = Color3.fromRGB(35,35,40)
    box.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,7)
    corner.Parent = box

    return box
end

label("TU OFERTA",65,25)
local yourUnit = input("Nombre de tu unidad",95)
local yourValue = input("Valor de tu unidad",140)

label("OFERTA DEL RIVAL",185,25)
local rivalUnit = input("Nombre de su unidad",215)
local rivalValue = input("Valor de su unidad",260)

local compare = Instance.new("TextButton")
compare.Size = UDim2.new(1,-50,0,42)
compare.Position = UDim2.fromOffset(25,305)
compare.Text = "COMPARAR"
compare.TextScaled = true
compare.Font = Enum.Font.GothamBold
compare.TextColor3 = Color3.new(1,1,1)
compare.BackgroundColor3 = Color3.fromRGB(190,0,0)
compare.Parent = frame

local result = label("RESULT: WAITING",350,30)
result.TextColor3 = Color3.fromRGB(255,0,0)

compare.MouseButton1Click:Connect(function()
    local a = tonumber(yourValue.Text)
    local b = tonumber(rivalValue.Text)

    if not a or not b or a < 0 or b < 0 then
        result.Text = "INVALID VALUES"
        return
    end

    if b > a then
        result.Text = "WIN!"
        result.TextColor3 = Color3.fromRGB(0,255,80)
    elseif b < a then
        result.Text = "LOSS!"
        result.TextColor3 = Color3.fromRGB(255,40,40)
    else
        result.Text = "FAIR!"
        result.TextColor3 = Color3.fromRGB(255,210,0)
    end
end)
