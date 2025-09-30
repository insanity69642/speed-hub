local rf = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local humanoid = game.Players.LocalPlayer.Character.Humanoid


local KeyHint = math.random(0,250)

local window = rf:CreateWindow({
    Name = "Speed Hub",
    LoadingTitle = "Loading Speed Hub...",
    LoadingSubtitle = "Made by insanity",
    ToggleUIKeybind = "G",
    KeySystem = true,
    KeySettings = {
        Key = {tostring(KeyHint*4)},
        Note = "The key is "..tostring(KeyHint).."*4, Do some math first!"
    }
})

local tab = window:CreateTab("main","chevrons-right")

local Text = tab:CreateSection("Current speed is "..tostring(humanoid.WalkSpeed))

local speedbox = tab:CreateInput({
    Name = "Speed",
    CurrentValue = "",
    PlaceholderText = "Enter speed",
    Callback = function()end
})

local SpeedButton = tab:CreateButton({
    Name = "Set Speed",
    Callback = function()
        local good,bad = pcall(function()
            local humanoid = game.Players.LocalPlayer.Character.Humanoid
            humanoid.WalkSpeed = tonumber(speedbox.CurrentValue)
        end)

        if good then
            rf:Notify({
                Title = "Success",
                Content = "Successfully changed speed to "..speedbox.CurrentValue
            })
            Text:Set("Current speed is "..speedbox.CurrentValue)
        else
            rf:Notify({
                Title = "Error",
                Content = "Error: "..bad
            })
       end 
    end
})

