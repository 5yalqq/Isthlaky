local Players = game:GetService("Players")
local UserService = game:GetService("UserService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

---------------------------------------------------------
-- 1. بناء واجهة التحكم (تظهر وتختفي بمفتاح P)
---------------------------------------------------------
local coreGui = pcall(function() return game:GetService("CoreGui") end) and game:GetService("CoreGui") or gui

if coreGui:FindFirstChild("SpooferGUI") then
    coreGui.SpooferGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpooferGUI"
ScreenGui.Parent = coreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 310, 0, 310)
Frame.Position = UDim2.new(0.5, -155, 0.5, -155)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BackgroundTransparency = 0.15
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true 
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(55, 55, 55)
FrameStroke.Thickness = 1
FrameStroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Strict Icon Cutter Spoofer V21 • [P]"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13
Title.Parent = Frame

-- خانة اليوزر المستهدف
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.65, 0, 0, 36)
TextBox.Position = UDim2.new(0.05, 0, 0.14, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "يوزر الشخص المستهدف..."
TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 13
TextBox.Text = ""
TextBox.Parent = Frame

local TextCorner = Instance.new("UICorner")
TextCorner.CornerRadius = UDim.new(0, 8)
TextCorner.Parent = TextBox

local AvatarPreview = Instance.new("ImageLabel")
AvatarPreview.Size = UDim2.new(0, 56, 0, 56)
AvatarPreview.Position = UDim2.new(0.74, 0, 0.14, 0)
AvatarPreview.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AvatarPreview.Image = "rbxassetid://0"
AvatarPreview.ScaleType = Enum.ScaleType.Crop
AvatarPreview.Parent = Frame

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 8)
AvatarCorner.Parent = AvatarPreview

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Color = Color3.fromRGB(55, 55, 55)
AvatarStroke.Thickness = 1
AvatarStroke.Parent = AvatarPreview

-- خانة رقم رتبة الصورة الايقونة
local RebirthTextBox = Instance.new("TextBox")
RebirthTextBox.Size = UDim2.new(0.9, 0, 0, 36)
RebirthTextBox.Position = UDim2.new(0.05, 0, 0.38, 0)
RebirthTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RebirthTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
RebirthTextBox.PlaceholderText = "رقم الصورة المطلوبة (من 1 إلى 20)..."
RebirthTextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
RebirthTextBox.Font = Enum.Font.Gotham
RebirthTextBox.TextSize = 13
RebirthTextBox.Text = ""
RebirthTextBox.Parent = Frame

local RebirthCorner = Instance.new("UICorner")
RebirthCorner.CornerRadius = UDim.new(0, 8)
RebirthCorner.Parent = RebirthTextBox

-- الخانة الجديدة لكتابة نص الريبيرث بالكامل
local CustomRebirthBox = Instance.new("TextBox")
CustomRebirthBox.Size = UDim2.new(0.9, 0, 0, 36)
CustomRebirthBox.Position = UDim2.new(0.05, 0, 0.58, 0)
CustomRebirthBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CustomRebirthBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomRebirthBox.PlaceholderText = "نص الريبيرث تحت الرتبة (مثال: Rebirth 8)..."
CustomRebirthBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
CustomRebirthBox.Font = Enum.Font.Gotham
CustomRebirthBox.TextSize = 13
CustomRebirthBox.Text = ""
CustomRebirthBox.Parent = Frame

local CustomRebirthCorner = Instance.new("UICorner")
CustomRebirthCorner.CornerRadius = UDim.new(0, 8)
CustomRebirthCorner.Parent = CustomRebirthBox

-- زر التفعيل وحقن السكربت
local ApplyBtn = Instance.new("TextButton")
ApplyBtn.Size = UDim2.new(0.9, 0, 0, 40)
ApplyBtn.Position = UDim2.new(0.05, 0, 0.80, 0)
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyBtn.Text = "تثبيت وحقن دائم"
ApplyBtn.Font = Enum.Font.GothamBold
ApplyBtn.TextSize = 14
ApplyBtn.Parent = Frame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ApplyBtn

---------------------------------------------------------
-- 2. مفتاح الإخفاء والإظهار (P)
---------------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.P then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

---------------------------------------------------------
-- 3. منطق عمل زر الواجهة التجريبي (بدون تعديل فعلي على اللعبة)
---------------------------------------------------------
local function tweenColor(element, targetColor)
    TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = targetColor}):Play()
end

ApplyBtn.MouseButton1Click:Connect(function()
    local inputUser = TextBox.Text
    if inputUser == "" or inputUser == " " then
        ApplyBtn.Text = "اكتب يوزر أولاً!"
        return
    end

    ApplyBtn.Text = "جاري المحاكاة..."
    
    task.spawn(function()
        local success, userId = pcall(function()
            return Players:GetUserIdFromNameAsync(inputUser)
        end)

        if success and userId then
            local success2, userInfo = pcall(function()
                return UserService:GetUserInfosByUserIdsAsync({userId})
            end)
            
            if success2 and userInfo[1] then
                -- تحديث الأفاتار داخل اللوحة فقط كعرض بدون أي تغيير خارجي
                AvatarPreview.Image = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150"
                
                ApplyBtn.Text = "تمت المحاكاة بالواجهة فقط!"
                tweenColor(ApplyBtn, Color3.fromRGB(0, 180, 90))
                
                wait(2)
                ApplyBtn.Text = "تثبيت وحقن دائم"
                tweenColor(ApplyBtn, Color3.fromRGB(0, 120, 255))
            end
        else
            ApplyBtn.Text = "المستخدم غير موجود!"
            tweenColor(ApplyBtn, Color3.fromRGB(180, 40, 40))
            wait(2)
            ApplyBtn.Text = "تثبيت وحقن دائم"
            tweenColor(ApplyBtn, Color3.fromRGB(0, 120, 255))
        end
    end)
end)
