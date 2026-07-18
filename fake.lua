local player = game.Players.LocalPlayer
local stats = player:WaitForChild("leaderstats")
local cash = stats:WaitForChild("Cash")

local remoteFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") or game:GetService("ReplicatedStorage")

for _, remote in pairs(remoteFolder:GetDescendants()) do
    if remote:IsA("RemoteEvent") then
        local name = remote.Name:lower()
        if name:find("collect") or name:find("add") or name:find("cash") then
            print("Targeting: " .. remote.Name)
            remote:FireServer(999999999)
            remote:FireServer(true)
        end
    end
end

cash.Value = 999999999
cash:GetPropertyChangedSignal("Value"):Connect(function()
    cash.Value = 999999999
end)

print("Execution completed.")