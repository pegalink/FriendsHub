local Players = game:GetService("Players")
local player = Players.LocalPlayer
local isAnnoyed = false
local isSpamming = false
local isFollow = false
local character = player.Character
local humanoid = character.Humanoid
local hrp = character.HumanoidRootPart
local root = character.HumanoidRootPart
local isSpin = false
local isCopy = false
local isSit = false	
local log = false
local grt = game.workspace.Gravity
local hs = humanoid.WalkSpeed
local hj = humanoid.JumpPower
local isSuper = false
hrp.CanCollide = true
local UserInputService = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local key = "deltaontop"

local te = Instance.new("TextBox")
te.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
te.TextColor3 = Color3.fromRGB(255, 255, 255)
te.Font = Enum.Font.FredokaOne
te.TextScaled = true
te.BorderSizePixel = 0
te.Parent = gui
te.BackgroundTransparency = 0
te.Text = "Enter your key in"
te.TextEditable = true
te.Position = UDim2.new(0.25, 0, 0.25, 0)
te.Size = UDim2.new(0.5, 0, 0.54, 0)

local function waitForCorrectKey()
    repeat
        wait()
    until te.Text == key
    gui:Destroy()
end

te.FocusLost:Connect(function()
    if te.Text ~= key then
    waitForCorrectKey()
    end
end)
waitForCorrectKey()
te.FocusLost:Connect(function()
if te.Text == key then
gui:Destroy()
end
end)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Brick admin loaded! Choose your prefix (1 character)", "All")

local player = game.Players.LocalPlayer

local function onChatted(msg)
    if #msg == 1 then
        prefix = msg game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Prefix is "..prefix, "All")
        elseif #msg > 1 and not prefix then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Prefix is over 1 character, set prefix to .", "All")
        prefix = "."
    end
end

player.Chatted:Connect(onChatted)

local timeout = 10
local startTime = os.time()

while not prefix do
    if os.time() - startTime >= timeout then
        prefix = "." game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("No prefix chosen. set prefix to "..prefix, "All")
        break
    end
    wait()
end
gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.Name = "CommandBarGui"

f = Instance.new("Frame")
f.Parent = gui
f.BackgroundTransparency = 1
f.Size = UDim2.new(0, 200, 0, 50)
f.Position = UDim2.new(0.5, -100, 0, 0)
f.Name = "CommandBarHolder"

bar = Instance.new("TextBox")
bar.Name = "CommandBar"
bar.Parent = f
bar.Size = UDim2.new(1, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
bar.Font = Enum.Font.FredokaOne
bar.TextScaled = true
bar.TextColor3 = Color3.fromRGB(55, 116, 136)
bar.BorderSizePixel = 0
bar.Text = "Command Bar\nUse prefix (prefix) to change your prefix\nSome commands may not work"

local function plrlist()
local gui = Instance.new("ScreenGui")
gui.Name = "PlayerListGui"
gui.Parent = game.CoreGui
local playerListFrame = Instance.new("ScrollingFrame")
playerListFrame.Size = UDim2.new(0, 120, 0, 200) 
playerListFrame.Position = UDim2.new(0, 10, 0, 80) 
playerListFrame.BackgroundTransparency = 0.5
playerListFrame.BackgroundColor3 = Color3.new(0, 0, 0)
playerListFrame.ScrollBarThickness = 8
	playerListFrame.ScrollBarImageTransparency = 0.5
playerListFrame.Parent = gui

local function updatePlayerList()
    playerListFrame:ClearAllChildren()
    for _, player in ipairs(game.Players:GetPlayers()) do
        local playerFrame = Instance.new("Frame")
        playerFrame.Size = UDim2.new(0, 120, 0, 30)
        playerFrame.Position = UDim2.new(0, 0, 0, (#playerListFrame:GetChildren() * 30))
        playerFrame.BackgroundTransparency = 1
        playerFrame.Parent = playerListFrame
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(0.8, 0, 1, 0)
        nameLabel.Position = UDim2.new(0.2, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.DisplayName .. " || " .. player.Name
        nameLabel.Font = Enum.Font.SourceSans
        nameLabel.TextSize = 10
        nameLabel.TextColor3 = Color3.new(1, 1, 1)
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = playerFrame
        local avatarImage = Instance.new("ImageLabel")
        avatarImage.Size = UDim2.new(0, 20, 0, 20) 
        avatarImage.Position = UDim2.new(0, 5, 0.5, -10)
        avatarImage.AnchorPoint = Vector2.new(0, 0.5)
        avatarImage.BackgroundTransparency = 1
        avatarImage.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?userid=" .. tostring(player.UserId) .. "&x=100&y=100"
        avatarImage.Parent = playerFrame
    end
end
game.Players.PlayerAdded:Connect(function(updatePlayerList)
end)
game.Players.PlayerRemoving:Connect(function(updatePlayerList)
end)
updatePlayerList()
end


local function cmds()
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")

ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.5, 0, 0.54, 0)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.BackgroundTransparency = 0
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)


ScrollingFrame.Size = UDim2.new(1, 0, 1, -20)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 20) 
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 52 * 60)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Parent = Frame
ScrollingFrame.BorderSizePixel = 0

for i = 1, 52 do
    Button = Instance.new("TextLabel")
    Button.Size = UDim2.new(1, -20, 0, 50)
    Button.Position = UDim2.new(0, 10, 0, (i-1)*60)
    Button.AnchorPoint = Vector2.new(0, 0)
    Button.Parent = ScrollingFrame
    Button.BackgroundTransparency = 0
    if i == 1 then
    Button.Text = i..") "..prefix.."goto <player>\nTeleports to a player."
elseif i == 2 then
    Button.Text = i..") "..prefix.."spam <message> (.unspam)\nSpams chat with a message or stops spamming."
elseif i == 3 then
    Button.Text = i..") "..prefix.."dex\nOpens up dex explorer."
elseif i == 4 then
    Button.Text = i..") "..prefix.."rnum\nSays a random number from 1 to 1000 in chat."
elseif i == 5 then
    Button.Text = i..") "..prefix.."rj\nRejoins the server."
elseif i == 6 then
    Button.Text = i..") "..prefix.."annoy <player> (.unannoy)\nSpam teleports you to a player or stops."
elseif i == 7 then
    Button.Text = i..") "..prefix.."setspeed <number>\nSets your speed to a specific amount."
elseif i == 8 then
    Button.Text = i..") "..prefix.."speed(*,+,-) <number>\nMultiplies/adds/removes your speed by an amount."
elseif i == 9 then
    Button.Text = i..") "..prefix.."setjump <number>\nSets your jump power to a specific amount."
elseif i == 10 then
    Button.Text = i..") "..prefix.."jump(*,+,-) <number>\nMultiplies/adds/removes your jump power by an amount."
elseif i == 11 then
    Button.Text = i..") "..prefix.."setgravity <number>\nSets your gravity to a specific amount."
elseif i == 12 then
    Button.Text = i..") "..prefix.."focuson\nFocuses your camera on a player."
elseif i == 13 then
    Button.Text = i..") "..prefix.."re\nResets your character."
elseif i == 14 then
    Button.Text = i..") "..prefix.."follow <player> ("..prefix.."unfollow)\nFollows a player."
elseif i == 15 then
    Button.Text = i..") "..prefix.."spin <speed> (.unspin)\nSpins you at a specific speed (10k max)."
elseif i == 16 then
    Button.Text = i..") "..prefix.."userid <player>/"..prefix.."userid <me>\nCopies a player's userID or copies your userID."
elseif i == 17 then
    Button.Text = i..") "..prefix.."copy <player> ("..prefix.."uncopy)\nCopies or uncopies a player's messages."
elseif i == 18 then
    Button.Text = i..") "..prefix.."rocket\nFun!"
elseif i == 19 then
    Button.Text = i..") "..prefix.."hs <player> ("..prefix.."unhs)\nSits or unsits on a player's head."
elseif i == 20 then
    Button.Text = i..") "..prefix.."testiq <player>\nSays a player's IQ in chat (fake IQ)."
elseif i == 21 then
    Button.Text = i..") "..prefix.."howbad <player>\nSays how bad a player is in chat (fake)."
elseif i == 22 then
    Button.Text = i..") "..prefix.."hownice <player>\nSays how nice a player is in chat (fake)."
elseif i == 23 then
    Button.Text = i..") "..prefix.."gameid\nCopies the game ID to clipboard."	
elseif i == 24 then
    Button.Text = i..") "..prefix.."players\nSays in chat how many players are in the game."
elseif i == 25 then
    Button.Text = i..") "..prefix.."plrlog ("..prefix.."unplrlog)\nSays in chat when a player leaves or joins"
        elseif i == 26 then
        Button.Text = i..") "..prefix.."whois <player> \nPrints a list of information of a player in console"
        elseif i == 27 then
        Button.Text = i..") "..prefix.."bright <amount> \nSets the game brightness for you"
        elseif i == 28 then
        Button.Text = i..") "..prefix.."time <number> \nSets the game time from 0-24 for you"
        elseif i == 29 then
        Button.Text = i..") "..prefix.."rizzup <player> \nRizzes up a player"
        elseif i == 30 then
        Button.Text = i..") "..prefix.."stats <player> \nShows a list of a player's stats such as hp, speed, jump power."	
        elseif i == 31 then
        Button.Text = i..") "..prefix.."superhuman (.unsuperhuman)\nMakes your character super."
        elseif i == 32 then
        Button.Text = i..") "..prefix.."copyall ("..prefix.."uncopy)\nCopies every player's messages"
        elseif i == 33 then
        Button.Text = i..") "..prefix.."remotespy \nLoads up turtlespy"
        elseif i == 34 then
        Button.Text = i..") "..prefix.."beniceto <player> \nCompliments a player"
        elseif i == 35 then
        Button.Text = i..") "..prefix.."cmds \nLoads up this menu"
        elseif i == 36 then
        Button.Text = i..") "..prefix.."crosshair \nShows a very bad crosshair"	
        elseif i == 37 then
        Button.Text = i..") "..prefix.."plrlist \nShows a better version of roblox's player list"
        elseif i == 38 then
        Button.Text = i..") "..prefix.."night/day \nMakes the game in night time or day"
        elseif i == 39 then
        Button.Text = i..") "..prefix.."boom <player> \nMakes you go to a following player, then you die."
        elseif i == 40 then
        Button.Text = i..") "..prefix.."drophs <player> ("..prefix.."unhs)\nMakes you fall from the sky then headsit on a player."
        elseif i == 41 then
        Button.Text = i..") "..prefix.."ac \nAka anti crash (type this when a script kiddie starts \nlagging chat.)"
        elseif i == 42 then
        Button.Text = i..") "..prefix.."mute <player> \nMutes a player from chatting for you."
        elseif i == 43 then
        Button.Text = i..") "..prefix.."copypos <player> \nCopies a player's position to clipboard."
        elseif i == 44 then
        Button.Text = i..") "..prefix.."copycf <player> \nCopies a player's CFrame to clipboard."
        elseif i == 45 then
        Button.Text = i..") "..prefix.."match <player> \nMatches a player's speed and jump power."
          elseif i == 46 then
        Button.Text = i..") "..prefix.."float <amount> ("..prefix.."unfloat) \nMakes you float/stop floating in the sky."
        elseif i == 47 then
        Button.Text = i..") "..prefix.."freeze/thaw ("..prefix.."unfreeze/unthaw) \nMakes you freeze or unfreeze in your place."
        elseif i == 48 then
        Button.Text = i..") "..prefix.."sit <seconds> ("..prefix.."unsit) \nMakes you sit for a certain amount of time."
        elseif i == 49 then
        Button.Text = i..") "..prefix.."coffset/"..prefix.."cameraoffset <x>, <y>, <z> \nSets your camera offset based\n off what you choose."
        elseif i == 50 then
        Button.Text = i..") "..prefix.."walkto <player> \nWalks up to a player."
        elseif i == 51 then
        Button.Text = i..") "..prefix.."prefix <prefix> \nChanges your prefix to a 1 character\nprefix."
        elseif i == 52 then
        Button.Text = i..") "..prefix.."notify <seconds> <message>\nSends a notification with whatever message you pick."
        end
        Button.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        Button.TextColor3 = Color3.fromRGB(55, 116, 136)
        Button.Font = Enum.Font.FredokaOne
        Button.TextSize = 16
        Button.BorderSizePixel = 0
end

local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.Size = UDim2.new(0.1, 0, 0.15, 0)
closeButton.Parent = Frame
closeButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
closeButton.Font = Enum.Font.FredokaOne
closeButton.TextScaled = true
closeButton.BorderSizePixel = 0
closeButton.TextColor3 = Color3.new(192,0,0)
text = Instance.new("TextLabel")
text.Text = "🧱Brick Admin v3.1🧱"
text.Position = UDim2.new(0.17, 0, 0, 0)
text.Size = UDim2.new(0.1, 0, 0.15, 0)
text.Parent = Frame
text.TextSize = 18
text.TextColor3 = Color3.fromRGB(55, 116, 136)
text.Font = Enum.Font.FredokaOne
text.BackgroundTransparency = 1 currentDate = os.date("%m/%d/%Y")
date = Instance.new("TextLabel")
date.Position = UDim2.new(0.52, 0, 0, 0)
date.Size = UDim2.new(0.1, 0, 0.15, 0)
date.Parent = Frame
date.TextColor3 = Color3.fromRGB(55, 116, 136)
date.Font = Enum.Font.FredokaOne
date.BackgroundTransparency = 1
date.TextSize = 20
date.Text = currentDate


local miniButton = Instance.new("TextButton")
miniButton.Text = "-"
miniButton.Position = UDim2.new(0.8, 0, 0, 0)
miniButton.Size = UDim2.new(0.1, 0, 0.15, 0)
miniButton.Parent = Frame
miniButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
miniButton.TextColor3 = Color3.fromRGB(255, 0, 0)
miniButton.BorderSizePixel = 0
miniButton.TextSize = 30
miniButton.Font = Enum.Font.FredokaOne

closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local minimized = false

miniButton.MouseButton1Click:Connect(function()
    if minimized == false then
         Button.Visible = false
         ScrollingFrame.Visible = false
         Frame.BackgroundTransparency = 1
         Button.Visible = false
         text.Visible = false
         date.Visible = false
        miniButton.Text = "+"
        miniButton.TextColor3 = Color3.fromRGB(0, 200, 10)
        minimized = true
    else
        Button.Visible = true
         ScrollingFrame.Visible = true
         Frame.BackgroundTransparency = 0
         Button.Visible = true
         text.Visible = true
         date.Visible = true
        miniButton.Text = "-"
        miniButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        minimized = false
    end
end)
end
local function findPlayer(playerName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower() == playerName:lower() or player.DisplayName:lower():sub(1, #playerName) == playerName:lower() then
            return player
        end
    end
    return nil
end
wait(0.5)
cmds()
local function changePrefix()
ScreenGui:Destroy()
cmds()
end game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Made by SawconBestShow";
                Text = "Script was made by SawconBestShow aka ted.#2538. ";
                Duration = 2;
            })
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 5) == prefix.."goto" then
        local playerName = string.sub(message, 7)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            if player.Character then
                player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                wait()
            end
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 3) == prefix.."rj" then
        game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."annoy" then
        if not isAnnoyed then
            isAnnoyed = true
            local playerName = string.sub(message, 8)
            
            local targetPlayer = nil
            for _,p in pairs(game.Players:GetPlayers()) do
                if p.Name:lower() == playerName:lower() or p.DisplayName:lower():sub(1,#playerName) == playerName:lower() then
                    targetPlayer = p
                    break
                end
            end
            if targetPlayer then
                if player.Character then
                    while isAnnoyed do
                        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        wait()
                    end
                end
            end
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."unannoy" then
        isAnnoyed = false
    end
end)


game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 5) == prefix.."spam" then
        if not isSpamming then
            isSpamming = true
            local spamMessage = string.sub(message, 7)
            while isSpamming do
                wait(0.1)
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamMessage, "All")
            end
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."unspam" then
        isSpamming = false
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 9) == prefix.."beniceto" then
        local playerName = string.sub(message, 11)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local number = math.random(1, 10)
            local compliments = {
                "You look great today!",
                "Your outfit is on point!",
                "You have a beautiful smile!",
                "You're annoying!",
                "You're a talented person!",
                "You're an inspiration to others!",
                "You have a kind heart!",
                "You're doing a fantastic job!",
                "You're a great listener!",
                "You have a great sense of humor!"
            }
           wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." "..compliments[number], "All")
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Player not found.", "All")
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 9) == prefix.."setspeed" then
        local speed = string.sub(message, 11)
        humanoid.WalkSpeed = speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed set! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end)
	game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."speed-" then
        local speed = string.sub(message, 9,16)
        humanoid.WalkSpeed = humanoid.WalkSpeed - speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed removed! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end)
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."speed+" then
        local speed = string.sub(message, 9,16)
        humanoid.WalkSpeed = humanoid.WalkSpeed + speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed added! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end)
       game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."speed*" then
        local speed = string.sub(message, 9,16)
        humanoid.WalkSpeed = humanoid.WalkSpeed * speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed multiplied! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end) game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == ".setjump" then
local jp = string.sub(message, 10)
        humanoid.JumpPower = jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power set! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."jump+" then
local jp = string.sub(message, 8,15)
        humanoid.JumpPower = humanoid.JumpPower + jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power added! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."jump-" then
local jp = string.sub(message, 8,15)
        humanoid.JumpPower = humanoid.JumpPower - jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power removed! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."jump*" then
local jp = string.sub(message, 8,15)
        humanoid.JumpPower = humanoid.JumpPower * jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power multiplied! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
     game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."focuson" then
        local playerName = string.sub(message, 10)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            game.Workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 3) == prefix.."re" then
    player.Character:BreakJoints()
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."follow" then
        isFollow = true
        local playerName = string.sub(message, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
           repeat
               humanoid:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
               wait()
           until not isFollow
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 9) == prefix.."unfollow" then
        isFollow = false
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 5) == prefix.."spin" then
   local ss = string.sub(message, 7)
            isSpin = true
            while isSpin do player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(ss), 0)
                wait()
            end
        end
end)
       game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."unspin" then
        isSpin = false
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 11) == prefix.."setgravity" then
   local ss = string.sub(message, 13)
   game.Workspace.Gravity = ss
   end
   end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."userid" then
        local playerName = string.sub(message, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local userId = tostring(targetPlayer.UserId)
            setclipboard(userId)
        else
            print("Player not found")
        end
        end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."gameid"  then
        print("Game ID copied to clipboard: " .. game.JobId)
        setclipboard(game.JobId)
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."copy " then
        isCopy = true
        local playerName = string.sub(message, 7)
        targetPlayer = findPlayer(playerName)
        if targetPlayer then
  targetPlayer.Chatted:Connect(function(msg)
                if isCopy then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
                end
            end)
            print("Copied "..targetPlayer.Name.."'s chat messages.")
        else
            print("Player not found.")
        end
end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."uncopy" then
        isCopy = false
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."rocket" then
        local character = game.Players.LocalPlayer.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        humanoid.JumpPower = 1000
game.workspace.Gravity = 0
humanoid:ChangeState("Jumping")
wait(4)
player.Character:BreakJoints()
game.workspace.Gravity = grt
    end
end) game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7)  == prefix.."testiq" then
        local playerName = string.sub(message, 9)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        wait(0.1)
    local number = math.random(0,310) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." has "..number.." iq!", "All")
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7)  == prefix.."howbad" then
        local playerName = string.sub(message, 9)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        wait(0.1)
    local number = math.random(0,100) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." is "..number.."% bad", "All")
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8)  == prefix.."hownice" then
        local playerName = string.sub(message, 10)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        wait(0.1)
    local number = math.random(0,100) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." is "..number.."% nice", "All")
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 5) == prefix.."rnum" then
        wait(0.1)
    local number = math.random(0,1000)
    bar.Text = number game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(number,"All")
    end
end) game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."players" then
    wait(0.1)
        local players = #game.Players:GetPlayers() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("there are "..players.." players in the game.", "All")
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."plrlog" then
    log = true
    local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Chat = game:GetService("Chat")
Players.PlayerRemoving:Connect(function(player)
if log then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("bruh.. "..player.Name.." has left","All")
end
end)
Players.PlayerAdded:Connect(function(player)
if log then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." has joined the party","All")
end
end)
end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."unplrlog" then
    log = false
    end
    end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 6) == prefix.."whois" then
        local playerName = string.sub(message, 8)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local displayName = targetPlayer.DisplayName
            local username = targetPlayer.Name
            local userId = targetPlayer.UserId
            local age = targetPlayer.AccountAge or "N/A"
            local team = targetPlayer.Team or "N/A"
            local teamcolor = targetPlayer.TeamColor or "N/A"
            local ju = targetPlayer.AutoJumpEnabled or "N/A"
            local rs = targetPlayer.RespawnLocation or "N/A"
            local siet = targetPlayer.Character.Humanoid.Sit
            local R = targetPlayer.Character.Humanoid.RigType
            if R == Enum.HumanoidRigType.R15 then
                R = "R15"
            elseif R == Enum.HumanoidRigType.R6 then
                R = "R6"
            else
                R = "Unknown"
            end
            local speed = targetPlayer.Character.Humanoid.WalkSpeed
            local jump = targetPlayer.Character.Humanoid.JumpPower
            local accountAge = targetPlayer.AccountAge
local currentDate = os.date("%m/%d/%Y %I:%M %p")
local joinDate = os.date("%m/%d/%Y %I:%M %p", os.time() - accountAge * 86400)
local estimatedJoinDate = "approximately "..joinDate
            print(string.format("Player: %s \n----------------\nDisplay Name: %s\nUsername: %s\nUser ID: %d\nAccount Age: %s Days \nTeam: %s \nTeam Color: %s \nAuto Jump Enabled: %s \nRespawn Location: %s \nR15/6: %s \nSitting: %s \nSpeed: %d \nJump Power: %d \nJoined at: %s\n------------\nInfo generated by ted.#2538/SawconBestShow", playerName, displayName, username, userId, age, team, tostring(teamcolor), tostring(ju), tostring(rs), tostring(R), tostring(siet), speed, jump, estimatedJoinDate))
          wait()  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Information gotten! Check console.", "All")
        else
            print("Could not find player " .. playerName)
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 7) == prefix.."bright" then
        local br = string.sub(message, 9)
        game.Lighting.Brightness = br
        end
        end)
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 6) == prefix.."time " then
        local tm = string.sub(message, 7)
        game.Lighting.ClockTime = tm
        end
        end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 7) == prefix.."rizzup" then
        local playerName = string.sub(message, 9)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
local lines = 
{
    "Are you made of copper and tellurium? Because you're CuTe.	",
    "Are you a bank loan? Because you got my interest.",
    "Do you have a sunburn or are you always this hot?",
    "If you were a vegetable, you'd be a cute-cumber.",
    "You know what's on the menu? Me-n-u.",
    "I'm not a photographer, but I can picture us together.",
    "Do you have a magnet in your pocket? Because I'm attracted to you.",
    "Excuse me, can you give me directions to your heart?",
    "Can I follow you home? Because my parents always told me to follow my dreams.",
    "Do you believe in love at first sight, or should I walk by again?",
    "Is it hot in here or is it just you? Because I'm feeling weak in the knees.",
    "Excuse me, do you have a Band-Aid? Because I just scraped my knee falling for you.",
    "If you were a library book, I'd check you out.",
    "Can I have your picture so I can show Santa what I want for Christmas?",
}
            local number = math.random(1, 13)
           wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." "..lines[number], "All")
          wait(3.5) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." rate the riz", "All")
          end
          end
          end)
          game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 7) == prefix.."notify" then
        local sec = tonumber(string.sub(message, 9, 10))
        local mesg = ""
        if message:sub(11) ~= "" then
            mesg = message:sub(11)
        elseif message:sub(12) ~= "" then
            mesg = message:sub(12)
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Notification:";
            Text = mesg;
            Duration = sec;
        })
    end
end)
            game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 6) == prefix.."stats" then
   local playerName = string.sub(message, 8)
   targetPlayer = findPlayer(playerName)
   local hum = targetPlayer.Character.Humanoid game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = tostring(targetPlayer.DisplayName).."'s stats";
                Text = "Speed: "..tostring(hum.WalkSpeed).."\nJump Power: "..tostring(hum.JumpPower).."\nHealth: "..tostring(hum.Health);
                Duration = 3;
            })
            end
            end)
            game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."superhuman"  then
    isSuper = true
    if isSuper then
    wait()
    humanoid.WalkSpeed = 120
    humanoid.JumpPower = 200
    end
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."unsuperhuman"  then
    isSuper = false
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50
    end
    end)
local function crosshair()
local gui = Instance.new("ScreenGui")
gui.Name = "MyGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local frame = Instance.new("Frame")
frame.Name = "Background"
frame.Size = UDim2.new(0, 10, 0,10)
frame.Position = UDim2.new(0, 375, 0, 140)
frame.BackgroundColor3 = Color3.fromRGB(255, 5, 10)
frame.BackgroundTransparency = 0.4
frame.BorderSizePixel = 0 
frame.Parent = gui
gui.Parent = game.Players.LocalPlayer.PlayerGui

end
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.. "crosshair"  then
    crosshair()
end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."copyall" then
        isCopy = true
        for _, player in ipairs(game.Players:GetPlayers()) do player.Chatted:Connect(function(chatMsg)
                if isCopy then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.DisplayName.."> "..chatMsg, "All")
                end
            end)
        end
        game.Players.PlayerAdded:Connect(function(newPlayer)
            newPlayer.Chatted:Connect(function(chatMsg)
                if isCopy then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(chatMsg, "All")
                end
            end)
        end)
        print("Copying all players' chat messages.")
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."remotespy" then loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-TurtleSpy-4402"))()
   end
      end)
      game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."fpsboost" then
    _G.Settings = {
    Players = {
        ["Ignore Me"] = false,
        ["Ignore Others"] = false
    },
    Meshes = {
        Destroy = false, 
        LowDetail = true
    },
    Images = {
        Invisible = true,
        LowDetail = true,
        Destroy = false,
    },
    ["No Particles"] = true,
    ["No Camera Effects"] = true,
    ["No Explosions"] = true,
    ["No Clothes"] = false,
    ["Low Water Graphics"] = true,
    ["No Shadows"] = true, 
    ["Low Rendering"] = true, 
    ["Low Quality Parts"] = true
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."dex" then
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Dark-Dex-V3-Secured-(Bypass-Dex-Detections)-4163"))()
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."cmds" then
    cmds()
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."plrlist" then
    plrlist()
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."night" then
        game.Lighting.ClockTime = 24
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 4) == prefix.."day" then
        game.Lighting.ClockTime = 12
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message:sub(1, 5) == prefix.."boom" then
    wait()
        local playerName = string.sub(message, 7)
        local targetPlayer = findPlayer(playerName)
        humanoid = game.Players.LocalPlayer.Character.Humanoid
        hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        local post = targetPlayer.Character.HumanoidRootPart.Position
        humanoid:MoveTo(post) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("booming "..targetPlayer.DisplayName.. "...", "All")	
  humanoid.MoveToFinished:Connect(function()
  if hrp.Position ~= post then
  humanoid:MoveTo(post)
        humanoid:TakeDamage(math.huge) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("boomed", "All")
        targetPlayer = nil
        else
         humanoid:TakeDamage(math.huge) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("boomed", "All")
        targetPlayer = nil
        end
        end)
                    end
                    end)
                    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 3) == prefix.."hs" then
    isSit = true
        local playerName = string.sub(message, 5)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local plr = game.Players.LocalPlayer
            local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            local targethrp = targetPlayer.Character.HumanoidRootPart
            local targetchar = targetPlayer.Character
            local humanoid = plr.Character.Humanoid
            humanoid.Sit = true
            game.Workspace.Gravity = 0
            while isSit do
               humanoid.Sit = true plr.Character.HumanoidRootPart.CFrame = targetchar.Head.CFrame
                wait()
            end
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."unhs" then
    isSit = false
    game.Workspace.Gravity = 196.2
    end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    humanoid = character:WaitForChild("Humanoid")
    hrp = humanoid.Parent.HumanoidRootPart
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."drophs" then
    isSit = true
        local playerName = string.sub(message, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local plr = game.Players.LocalPlayer
            local targetChar = targetPlayer.Character
            local targetHead = targetChar:WaitForChild("Head")
            local humanoid = plr.Character:WaitForChild("Humanoid")
            plr.Character.HumanoidRootPart.CFrame = targetChar.Head.CFrame + Vector3.new(0, 1000, 0)

            wait(5)
            while isSit do
            wait()
            game.Workspace.Gravity = 0
            humanoid.Sit = true
            plr.Character.HumanoidRootPart.CFrame = targetChar.Head.CFrame + Vector3.new(0, 0.2, 0)
            end
            end
            end
            end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."ac" then
    wait(0.1)
                local anti = 4
                while anti > 1 do game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🚫NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS!🚫 NO CHAT CRASHING KIDS! 🚫NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS! 🚫 🚫NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS!🚫", "All")
                    anti = anti - 1
                end
            end
        end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 5) == prefix.."mute" then
        local playerName = string.sub(message, 7)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/mute "..targetPlayer.Name, "All")
        end
        end
        end)
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."copypos" then
        local playerName = string.sub(message, 10)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        local pos = targetPlayer.Character.HumanoidRootPart.Position
        setclipboard(tostring(pos))
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully copied "..targetPlayer.DisplayName.." 'position to clipboard", "All")
        end
        end
        end)
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."copycf " then
        local playerName = string.sub(message, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        local cf = targetPlayer.Character.HumanoidRootPart.CFrame
        setclipboard(tostring(cf)) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully copied "..targetPlayer.DisplayName.." 's cframe to clipboard", "All")
        end
        end
        end)
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."userid me" then
    local userid = tostring(game.Players.LocalPlayer.UserId)
        setclipboard(userid)
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."match" then
        local playerName = string.sub(message, 8)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
                    humanoid.WalkSpeed = targetPlayer.Character.Humanoid.WalkSpeed
                    humanoid.JumpPower = targetPlayer.Character.Humanoid.JumpPower
                    wait(0.1) 
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully matched "..targetPlayer.DisplayName, "All")
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if message == prefix.."timer" then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Timer is currently at "..timer.." seconds." ,"All")
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7 ) == prefix.."float " then 
    local float = string.sub(message, 8)
    humanoid.HipHeight = float
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."unfloat" then
    humanoid.HipHeight = 0
    end
    end)
    local function character()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Seated:Connect(function(isSeated)
            if isSeated then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            else
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            end
        end)
    end
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 4) == prefix.."sit" then
        local time = tonumber(string.sub(message, 6))
        if time and time > 0 then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and not humanoid.Sit then
                humanoid.Sit = true
                wait(time)
                humanoid.Sit = false
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            end
        end
    end
end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 6) == prefix.."unsit" then
    sit = false
    humanoid.Sit = sit
    time = 0
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."freeze" or string.sub(message, 1, 5) == prefix.."thaw" then
   humanoid.WalkSpeed = 0
   humanoid.JumpPower = 0
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 9) == prefix.."unfreeze" or string.sub(message, 1, 7) == prefix.."unthaw" then
   humanoid.WalkSpeed = 16
   humanoid.JumpPower = 50
    end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 10) == prefix.."camoffset" then
        local numbers = {}
        for num in string.gmatch(message, "%d+") do
            table.insert(numbers, tonumber(num))
        end
        if #numbers >= 1 then
            humanoid.CameraOffset = Vector3.new(numbers[1], numbers[2] or 0, numbers[3] or 0)
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 8) == prefix.."coffset" then
        local numbers = {}
        for num in string.gmatch(message, "%d+") do
            table.insert(numbers, tonumber(num))
        end
        if #numbers >= 1 then
            humanoid.CameraOffset = Vector3.new(numbers[1], numbers[2] or 0, numbers[3] or 0)
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local message = msg:lower()
    if string.sub(message, 1, 7) == prefix.."walkto" then
        local playerName = string.sub(message, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then humanoid:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
        end
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
local message = msg:lower()
if string.sub(message, 1, 7) == prefix.."prefix" then
prefix = string.sub(message, 9)
changePrefix()
bar.Text = "Successfully changed prefix to "..prefix
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully changed prefix to "..prefix, "All")
end
end)

bar.FocusLost:Connect(function()
if string.sub(bar.Text, 1, 5) == prefix.."goto" then
local playerName = string.sub(bar.Text, 7)
local t = findPlayer(playerName)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame
end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 3) == prefix.."rj" then
        game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."annoy" then
        if not isAnnoyed then
            isAnnoyed = true
            local playerName = string.sub(bar.Text, 8)
            local targetPlayer = findPlayer(playerName)
            if targetPlayer then
                if player.Character then
                    while isAnnoyed do
                        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        wait()
                    end
                end
            end
        end
    end
end)

bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."unannoy" then
        isAnnoyed = false
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text,  1, 5) == prefix.."spam" then
        if not isSpamming then
            isSpamming = true
            local spamMessage = string.sub(bar.Text, 6)
            while isSpamming do
                wait(0.1)
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamMessage, "All")
            end
        end
    end
end)

bar.FocusLost:Connect(function() if string.sub(bar.Text,  1, 7) == prefix.."unspam" then
        isSpamming = false
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 9) == prefix.."beniceto" then
        local playerName = string.sub(bar.Text, 11)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local number = math.random(1, 10)
            local compliments = {
                "You look great today!",
                "Your outfit is on point!",
                "You have a beautiful smile!",
                "You're annoying!",
                "You're a talented person!",
                "You're an inspiration to others!",
                "You have a kind heart!",
                "You're doing a fantastic job!",
                "You're a great listener!",
                "You have a great sense of humor!"
            }
           wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." "..compliments[number], "All")
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Player not found.", "All")
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 9) == prefix.."setspeed" then
        local speed = string.sub(bar.Text, 11)
        humanoid.WalkSpeed = speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed set! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end)
	bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."speed-" then
        local speed = string.sub(bar.Text, 9,16)
        humanoid.WalkSpeed = humanoid.WalkSpeed - speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed removed! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end)
        bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."speed+" then
        local speed = string.sub(bar.Text, 9,16)
        humanoid.WalkSpeed = humanoid.WalkSpeed + speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed added! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end)
       bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."speed*" then
        local speed = string.sub(bar.Text, 9,16)
        humanoid.WalkSpeed = humanoid.WalkSpeed * speed
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Speed multiplied! Your current speed is: "..humanoid.WalkSpeed, "All")
        end
        end) bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == ".setjump" then
local jp = string.sub(bar.Text, 10)
        humanoid.JumpPower = jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power set! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."jump+" then
local jp = string.sub(bar.Text, 8,15)
        humanoid.JumpPower = humanoid.JumpPower + jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power added! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."jump-" then
local jp = string.sub(bar.Text, 8,15)
        humanoid.JumpPower = humanoid.JumpPower - jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power removed! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."jump*" then
local jp = string.sub(bar.Text, 8,15)
        humanoid.JumpPower = humanoid.JumpPower * jp
       wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Jump Power multiplied! Your current JP is: "..humanoid.JumpPower, "All")
        end
        end)
     bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."focuson" then
        local playerName = string.sub(bar.Text, 10)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            game.Workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 3) == prefix.."re" then
    player.Character:BreakJoints()
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."follow" then
        isFollow = true
        local playerName = string.sub(bar.Text, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
           repeat
               humanoid:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
               wait()
           until not isFollow
        end
    end
end)

bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 9) == prefix.."unfollow" then
        isFollow = false
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 5) == prefix.."spin" then
   local ss = string.sub(bar.Text, 7)
            isSpin = true
            while isSpin do player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(ss), 0)
                wait()
            end
        end
end)
       bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."unspin" then
        isSpin = false
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 11) == prefix.."setgravity" then
   local ss = string.sub(bar.Text, 13)
   game.Workspace.Gravity = ss
   end
   end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."userid" then
        local playerName = string.sub(bar.Text, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local userId = tostring(targetPlayer.UserId)
            setclipboard(userId)
        else
            print("Player not found")
        end
        end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."gameid"  then
        print("Game ID copied to clipboard: " .. game.JobId)
        setclipboard(game.JobId)
    end
end)

bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."copy " then
        isCopy = true
        local playerName = string.sub(bar.Text, 7)
        targetPlayer = findPlayer(playerName)
        if targetPlayer then
  targetPlayer.Chatted:Connect(function(msg)
                if isCopy then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
                end
            end)
            print("Copied "..targetPlayer.Name.."'s chat bar.Texts.")
        else
            print("Player not found.")
        end
end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."uncopy" then
        isCopy = false
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."rocket" then
        local character = game.Players.LocalPlayer.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        humanoid.JumpPower = 1000
game.workspace.Gravity = 0
humanoid:ChangeState("Jumping")
wait(4)
player.Character:BreakJoints()
game.workspace.Gravity = grt
    end
end) bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7)  == prefix.."testiq" then
        local playerName = string.sub(bar.Text, 9)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        wait(0.1)
    local number = math.random(0,310) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." has "..number.." iq!", "All")
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7)  == prefix.."howbad" then
        local playerName = string.sub(bar.Text, 9)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        wait(0.1)
    local number = math.random(0,100) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." is "..number.."% bad", "All")
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8)  == prefix.."hownice" then
        local playerName = string.sub(bar.Text, 10)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        wait(0.1)
    local number = math.random(0,100) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." is "..number.."% nice", "All")
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 5)  == prefix.."rnum" then
        wait(0.1)
    local number = math.random(0,1000) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(number,"All")
    bar.Text = number
    end
end) bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."players" then
    wait(0.1)
        local players = #game.Players:GetPlayers() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("there are "..players.." players in the game.", "All")
    end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."plrlog" then
    log = true
    local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Chat = game:GetService("Chat")
Players.PlayerRemoving:Connect(function(player)
if log then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("bruh.. "..player.Name.." has left","All")
end
end)
Players.PlayerAdded:Connect(function(player)
if log then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." has joined the party","All")
end
end)
end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."unplrlog" then
    log = false
    end
    end)
bar.FocusLost:Connect(function()
    
    if bar.Text:sub(1, 6) == prefix.."whois" then
        local playerName = string.sub(bar.Text, 8)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local displayName = targetPlayer.DisplayName
            local username = targetPlayer.Name
            local userId = targetPlayer.UserId
            local age = targetPlayer.AccountAge or "N/A"
            local team = targetPlayer.Team or "N/A"
            local teamcolor = targetPlayer.TeamColor or "N/A"
            local ju = targetPlayer.AutoJumpEnabled or "N/A"
            local rs = targetPlayer.RespawnLocation or "N/A"
            local siet = targetPlayer.Character.Humanoid.Sit
            local R = targetPlayer.Character.Humanoid.RigType
            if R == Enum.HumanoidRigType.R15 then
                R = "R15"
            elseif R == Enum.HumanoidRigType.R6 then
                R = "R6"
            else
                R = "Unknown"
            end
            local speed = targetPlayer.Character.Humanoid.WalkSpeed
            local jump = targetPlayer.Character.Humanoid.JumpPower
            local accountAge = targetPlayer.AccountAge
local currentDate = os.date("%m/%d/%Y %I:%M %p")
local joinDate = os.date("%m/%d/%Y %I:%M %p", os.time() - accountAge * 86400)
local estimatedJoinDate = "approximately "..joinDate
            print(string.format("Player: %s \n----------------\nDisplay Name: %s\nUsername: %s\nUser ID: %d\nAccount Age: %s Days \nTeam: %s \nTeam Color: %s \nAuto Jump Enabled: %s \nRespawn Location: %s \nR15/6: %s \nSitting: %s \nSpeed: %d \nJump Power: %d \nJoined at: %s\n------------\nInfo generated by ted.#2538/SawconBestShow", playerName, displayName, username, userId, age, team, tostring(teamcolor), tostring(ju), tostring(rs), tostring(R), tostring(siet), speed, jump, estimatedJoinDate))
          wait()  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Information gotten! Check console.", "All")
        else
            print("Could not find player " .. playerName)
        end
    end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text:sub(1, 7) == prefix.."bright" then
        local br = string.sub(bar.Text, 9)
        game.Lighting.Brightness = br
        end
        end)
        bar.FocusLost:Connect(function()
    
    if bar.Text:sub(1, 6) == prefix.."time " then
        local tm = string.sub(bar.Text, 7)
        game.Lighting.ClockTime = tm
        end
        end)
bar.FocusLost:Connect(function()
    
    if bar.Text:sub(1, 7) == prefix.."rizzup" then
        local playerName = string.sub(bar.Text, 9)
        
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
local lines = 
{
    "Are you made of copper and tellurium? Because you're CuTe.	",
    "Are you a bank loan? Because you got my interest.",
    "Do you have a sunburn or are you always this hot?",
    "If you were a vegetable, you'd be a cute-cumber.",
    "You know what's on the menu? Me-n-u.",
    "I'm not a photographer, but I can picture us together.",
    "Do you have a magnet in your pocket? Because I'm attracted to you.",
    "Excuse me, can you give me directions to your heart?",
    "Can I follow you home? Because my parents always told me to follow my dreams.",
    "Do you believe in love at first sight, or should I walk by again?",
    "Is it hot in here or is it just you? Because I'm feeling weak in the knees.",
    "Excuse me, do you have a Band-Aid? Because I just scraped my knee falling for you.",
    "If you were a library book, I'd check you out.",
    "Can I have your picture so I can show Santa what I want for Christmas?",
}
            local number = math.random(1, 13)
           wait() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." "..lines[number], "All")
          wait(3.5) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayer.Name.." rate the riz", "All")
          end
          end
          end)
          bar.FocusLost:Connect(function()
    if bar.Text:sub(1, 6) == prefix.."stats" then
   local playerName = string.sub(bar.Text, 8)
   targetPlayer = findPlayer(playerName)
   local hum = targetPlayer.Character.Humanoid game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = tostring(targetPlayer.DisplayName).."'s stats";
                Text = "Speed: "..tostring(hum.WalkSpeed).."\nJump Power: "..tostring(hum.JumpPower).."\nHealth: "..tostring(hum.Health);
                Duration = 3;
            })
            end
            end)
            bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."superhuman"  then
    isSuper = true
    if isSuper then
    wait()
    humanoid.WalkSpeed = 120
    humanoid.JumpPower = 200
    end
    end
    end)
    bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."unsuperhuman"  then
    isSuper = false
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50
    end
    end)
local function crosshair()
local gui = Instance.new("ScreenGui")
gui.Name = "MyGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local frame = Instance.new("Frame")
frame.Name = "Background"
frame.Size = UDim2.new(0, 10, 0,10)
frame.Position = UDim2.new(0, 375, 0, 140)
frame.BackgroundColor3 = Color3.fromRGB(255, 5, 10)
frame.BackgroundTransparency = 0.4
frame.BorderSizePixel = 0 
frame.Parent = gui
gui.Parent = game.Players.LocalPlayer.PlayerGui

end
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.. "crosshair"  then
    crosshair()
end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."copyall" then
        isCopy = true
        for _, player in ipairs(game.Players:GetPlayers()) do player.Chatted:Connect(function(chatMsg)
                if isCopy then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.DisplayName.."> "..chatMsg, "All")
                end
            end)
        end
        game.Players.PlayerAdded:Connect(function(newPlayer)
            newPlayer.Chatted:Connect(function(chatMsg)
                if isCopy then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(chatMsg, "All")
                end
            end)
        end)
        print("Copying all players' chat bar.Texts.")
    end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."remotespy" then loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-TurtleSpy-4402"))()
   end
      end)
      bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."fpsboost" then
    _G.Settings = {
    Players = {
        ["Ignore Me"] = false,
        ["Ignore Others"] = false
    },
    Meshes = {
        Destroy = false, 
        LowDetail = true
    },
    Images = {
        Invisible = true,
        LowDetail = true,
        Destroy = false,
    },
    ["No Particles"] = true,
    ["No Camera Effects"] = true,
    ["No Explosions"] = true,
    ["No Clothes"] = false,
    ["Low Water Graphics"] = true,
    ["No Shadows"] = true, 
    ["Low Rendering"] = true, 
    ["Low Quality Parts"] = true
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."dex" then
      loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Dark-Dex-V3-Secured-(Bypass-Dex-Detections)-4163"))()
    end
    end)
    bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."cmds" then
    cmds()
    end
    end)
    bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."plrlist" then
    plrlist()
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."night" then
        game.Lighting.ClockTime = 24
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 4) == prefix.."day" then
        game.Lighting.ClockTime = 12
    end
end)

bar.FocusLost:Connect(function()
    
    if bar.Text:sub(1, 5) == prefix.."boom" then
    wait()
        local playerName = string.sub(bar.Text, 7)
        local targetPlayer = findPlayer(playerName)
        humanoid = game.Players.LocalPlayer.Character.Humanoid
        hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        local post = targetPlayer.Character.HumanoidRootPart.Position
        humanoid:MoveTo(post) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("booming "..targetPlayer.DisplayName.. "...", "All")	
  humanoid.MoveToFinished:Connect(function()
  if hrp.Position ~= post then
  humanoid:MoveTo(post)
        humanoid:TakeDamage(math.huge) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("boomed", "All")
        targetPlayer = nil
        else
         humanoid:TakeDamage(math.huge) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("boomed", "All")
        targetPlayer = nil
        end
        end)
                    end
                    end)
                    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 3) == prefix.."hs" then
    isSit = true
        local playerName = string.sub(bar.Text, 5)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local plr = game.Players.LocalPlayer
            local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            local targethrp = targetPlayer.Character.HumanoidRootPart
            local targetchar = targetPlayer.Character
            local humanoid = plr.Character.Humanoid
            humanoid.Sit = true
            game.Workspace.Gravity = 0
            while isSit do
               humanoid.Sit = true plr.Character.HumanoidRootPart.CFrame = targetchar.Head.CFrame
                wait()
            end
        end
    end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."unhs" then
    isSit = false
    game.Workspace.Gravity = 196.2
    end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    humanoid = character:WaitForChild("Humanoid")
    hrp = humanoid.Parent.HumanoidRootPart
end)

bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."drophs" then
    isSit = true
        local playerName = string.sub(bar.Text, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            local plr = game.Players.LocalPlayer
            local targetChar = targetPlayer.Character
            local targetHead = targetChar:WaitForChild("Head")
            local humanoid = plr.Character:WaitForChild("Humanoid")
            plr.Character.HumanoidRootPart.CFrame = targetChar.Head.CFrame + Vector3.new(0, 1000, 0)

            wait(5)
            while isSit do
            wait()
            game.Workspace.Gravity = 0
            humanoid.Sit = true
            plr.Character.HumanoidRootPart.CFrame = targetChar.Head.CFrame + Vector3.new(0, 0.2, 0)
            end
            end
            end
            end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."ac" then
    wait(0.1)
                local anti = 4
                while anti > 1 do game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🚫NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS!🚫 NO CHAT CRASHING KIDS! 🚫NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS! 🚫 🚫NO CHAT CRASHING KIDS! 🚫 NO CHAT CRASHING KIDS!🚫", "All")
                    anti = anti - 1
                end
            end
        end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 5) == prefix.."mute" then
        local playerName = string.sub(bar.Text, 7)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/mute "..targetPlayer.Name, "All")
        end
        end
        end)
        bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."copypos" then
        local playerName = string.sub(bar.Text, 10)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        local pos = targetPlayer.Character.HumanoidRootPart.Position
        setclipboard(tostring(pos))
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully copied "..targetPlayer.DisplayName.." 'position to clipboard", "All")
        end
        end
        end)
        bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."copycf " then
        local playerName = string.sub(bar.Text, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
        local cf = targetPlayer.Character.HumanoidRootPart.CFrame
        setclipboard(tostring(cf)) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully copied "..targetPlayer.DisplayName.." 's cframe to clipboard", "All")
        end
        end
        end)
        bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."userid me" then
    local userid = tostring(game.Players.LocalPlayer.UserId)
        setclipboard(userid)
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."match" then
        local playerName = string.sub(bar.Text, 8)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
                    humanoid.WalkSpeed = targetPlayer.Character.Humanoid.WalkSpeed
                    humanoid.JumpPower = targetPlayer.Character.Humanoid.JumpPower
                    wait(0.1) 
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully matched "..targetPlayer.DisplayName, "All")
        end
    end
end)
bar.FocusLost:Connect(function()
    
    if bar.Text == prefix.."timer" then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Timer is currently at "..timer.." seconds." ,"All")
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7 ) == prefix.."float " then 
    local float = string.sub(bar.Text, 8)
    humanoid.HipHeight = float
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."unfloat" then
    humanoid.HipHeight = 0
    end
    end)
    local function character()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Seated:Connect(function(isSeated)
            if isSeated then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            else
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            end
        end)
    end
end

bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 4) == prefix.."sit" then
        local time = tonumber(string.sub(bar.Text, 6))
        if time and time > 0 then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and not humanoid.Sit then
                humanoid.Sit = true
                wait(time)
                humanoid.Sit = false
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            end
        end
    end
end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 6) == prefix.."unsit" then
    sit = false
    humanoid.Sit = sit
    time = 0
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."freeze" or string.sub(bar.Text, 1, 5) == prefix.."thaw" then
   humanoid.WalkSpeed = 0
   humanoid.JumpPower = 0
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 9) == prefix.."unfreeze" or string.sub(bar.Text, 1, 7) == prefix.."unthaw" then
   humanoid.WalkSpeed = 16
   humanoid.JumpPower = 50
    end
    end)
    bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 10) == prefix.."camoffset" then
        local numbers = {}
        for num in string.gmatch(bar.Text, "%d+") do
            table.insert(numbers, tonumber(num))
        end
        if #numbers >= 1 then
            humanoid.CameraOffset = Vector3.new(numbers[1], numbers[2] or 0, numbers[3] or 0)
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 8) == prefix.."coffset" then
        local numbers = {}
        for num in string.gmatch(bar.Text, "%d+") do
            table.insert(numbers, tonumber(num))
        end
        if #numbers >= 1 then
            humanoid.CameraOffset = Vector3.new(numbers[1], numbers[2] or 0, numbers[3] or 0)
        end
    end
end)
bar.FocusLost:Connect(function() if string.sub(bar.Text, 1, 7) == prefix.."walkto" then
        local playerName = string.sub(bar.Text, 9)
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then humanoid:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
        end
    end
end)
bar.FocusLost:Connect(function()

if string.sub(bar.Text, 1, 7) == prefix.."prefix" then
prefix = string.sub(bar.Text, 9)
changePrefix()
bar.Text = "Successfully changed prefix to "..prefix
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfuly set prefix to "..prefix, "All")
end
end)
bar.FocusLost:Connect(function()
    if string.sub(bar.Text, 1, 7) == prefix.."notify" then
    local sec = tonumber(string.sub(bar.Text, 9, 10))
        local mesg = ""
        if bar.Text:sub(11) ~= "" then
            mesg = bar.Text:sub(11)
        elseif message:sub(12) ~= "" then
            mesg = bar.Text:sub(12)
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Notification:";
            Text = mesg;
            Duration = sec;
        })
            end
            end)
