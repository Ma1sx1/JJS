local function handleAnimationDetection(animIdsToStop, replacementAnimId, animSpeed)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local function onAnimPlayed(animationTrack)
        local animId = tonumber(string.match(animationTrack.Animation.AnimationId, "%d+"))
        
        for _, stopId in ipairs(animIdsToStop) do
            if animId == stopId then
                animationTrack:Stop()
                local replacementAnimation = Instance.new("Animation")
                replacementAnimation.AnimationId = "rbxassetid://" .. replacementAnimId
                local replacementTrack = humanoid:LoadAnimation(replacementAnimation)
                replacementTrack:Play()
                replacementTrack:AdjustSpeed(animSpeed) -- Adjust the speed of the replacement animation
                break
            end
        end
    end
    
    humanoid.AnimationPlayed:Connect(onAnimPlayed)
end

-- Function to handle animation detection and replacement
local function handleAnimationDetection(animIdsToStop, replacementAnimId, animSpeed)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local function onAnimPlayed(animationTrack)
        local animId = tonumber(string.match(animationTrack.Animation.AnimationId, "%d+"))
        
        for _, stopId in ipairs(animIdsToStop) do
            if animId == stopId then
                animationTrack:Stop()
                local replacementAnimation = Instance.new("Animation")
                replacementAnimation.AnimationId = "rbxassetid://" .. replacementAnimId
                local replacementTrack = humanoid:LoadAnimation(replacementAnimation)
                replacementTrack:Play()
                replacementTrack:AdjustSpeed(animSpeed) -- Adjust the speed of the replacement animation
                break
            end
        end
    end
    
    humanoid.AnimationPlayed:Connect(onAnimPlayed)
end

-- First set of animations
local firstAnimIdsToStop = {16705392699}
local firstReplacementAnimId = 18219731885
local firstAnimspeed = 1.7
handleAnimationDetection(firstAnimIdsToStop, firstReplacementAnimId, firstAnimspeed)

-- Second set of animations
local secondAnimIdsToStop = {16460186941}
local secondReplacementAnimId = 136831270818672
local secondAnimspeed = 1.3
handleAnimationDetection(secondAnimIdsToStop, secondReplacementAnimId, secondAnimspeed)

-- Third set of animations
local thirdAnimIdsToStop = {15076580998} 
local thirdReplacementAnimId = 14771588355
local thirdAnimspeed = 1.3
handleAnimationDetection(thirdAnimIdsToStop, thirdReplacementAnimId, thirdAnimspeed)

-- Fourth set of animations
local fourthAnimIdsToStop = {17099951429}
local fourthReplacementAnimId = 120144030789516
local fourthAnimspeed = 1.5
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- Special set of animations
local fourthAnimIdsToStop = {16671125770}
local fourthReplacementAnimId = 14841505475
local fourthAnimspeed = 1.3
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)


-- Ult Use set of animations
local fourthAnimIdsToStop = {16357948708}
local fourthReplacementAnimId = 121718733604230
local fourthAnimspeed = 1
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- 1 ULT set of animations
local fourthAnimIdsToStop = {16714319570}
local fourthReplacementAnimId = 15042750274
local fourthAnimspeed = 2.4
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- 2 ULT set of animations
local fourthAnimIdsToStop = {17011596206}
local fourthReplacementAnimId = 15042750274
local fourthAnimspeed = 1
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- 3 ULT set of animations
local fourthAnimIdsToStop = {17044048176}
local fourthReplacementAnimId = 126108492532596
local fourthAnimspeed = 1.3
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- 4 ULT set of animations
local fourthAnimIdsToStop = {17044048176}
local fourthReplacementAnimId = 15042750274
local fourthAnimspeed = 1
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- RUSH ENEMY set of animations
local fourthAnimIdsToStop = {16827230331}
local fourthReplacementAnimId = 15042750274
local fourthAnimspeed = 2.4
handleAnimationDetection(fourthAnimIdsToStop, fourthReplacementAnimId, fourthAnimspeed)

-- Notification
local function callback(Text)
 if Text == "Button1 text" then
  print ("Answer")
elseif Text == ("Button2 text") then
 print ("Answer2")
 end
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
--
game.StarterGui:SetCore("SendNotification",  {
 Title = "Should work now (use Hakari)";
 Text = "Credits IDK";
 Icon = "128416195873096";
 Duration = 5;
 Callback = NotificationBindable;
})

local soundID = 9039704032  -- Replace with the audio's ID
local userInputService = game:GetService("UserInputService")
local debounceTime = 240       -- The minimum time (in seconds) between sound plays
local lastPlayed = 0         -- The time when the sound was last played

local function playSound()
    local currentTime = os.time() -- Get the current time in seconds

    if currentTime - lastPlayed < debounceTime then
        -- If the cooldown period hasn't expired, don't play the sound
        return
    end

    lastPlayed = currentTime -- Update the last played time

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundID
    sound.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer -- Parent to character if it exists, otherwise parent to player
    sound.Volume = 1 -- Adjust volume as needed

    -- Optionally, destroy the sound after it's done:
    sound.Ended:Connect(function()
        sound:Destroy()
    end)

    sound:Play()  -- Play the sound
end

userInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent)
    if gameProcessedEvent then return end -- Ignore input already processed by the game

    if inputObject.KeyCode == Enum.KeyCode.Five then
        playSound()
    end
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local animationId = "15076580998"
local animationTrack

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent or input.KeyCode ~= Enum.KeyCode.Three then return end

    local player = Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not humanoid then return end

    if animationTrack then animationTrack:Stop() end

    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    animationTrack = humanoid:LoadAnimation(animation)

    animationTrack:AdjustSpeed(0)
    animationTrack.TimePosition = 0
    animationTrack:AdjustSpeed(1)
    animationTrack:Play()

    task.delay(2, function() -- Проигрывает 2 секунды
        if animationTrack.IsPlaying then animationTrack:Stop() end
    end)
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/sussy's%20animation%20logger.txt",true))()

