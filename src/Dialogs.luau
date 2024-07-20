--!strict
--!optimize 2
local TextModule = require(script.Parent.TextModule)

local dialogs = {
    ["Start"] = {
        [1] = {
            ["Name"] = "Bri'ish weatherman",
            ["Text"] = "yo what's up",
            ["Interval"] = 0.02,
            ["AutoDialogWait"] = 5
        },
        [2] = {
            ["Name"] = "Bri'ish weatherman",
            ["Text"] = "the weather's quite nice, innit?",
            ["Interval"] = 0.02,
            ["AutoDialogWait"] = 5
        },
        [3] = {
            ["Name"] = "Fellix",
            ["Text"] = TextModule:Customize({"b r u h", Color = "#ff5500"}),
            ["Interval"] = 0.5,
            ["AutoDialogWait"] = 5
        }
    }
}

return dialogs :: typeof(dialogs)