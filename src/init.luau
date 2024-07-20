--!strict
--!optimize 2

local UserInputService = game:GetService("UserInputService")
local Dialogs = require(script.Dialogs) :: {}

local Dialog = {} :: dialog
Dialog.__index = Dialog

local function writeTextInput(textLabel: TextLabel, text: string, interval: number)
    local inputConnection
    inputConnection = UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
        if (not gameProcessedEvent) and input.UserInputType == Enum.UserInputType.MouseButton1 then
            inputConnection:Disconnect()
        end
    end)
    textLabel.MaxVisibleGraphemes = 0
    textLabel.Text = text
    for i = 1, string.len(text), 1 do
        if (not inputConnection.Connected) then break end
        textLabel.MaxVisibleGraphemes = i
        local startTime = os.clock()
        repeat
            task.wait()
        until (not inputConnection.Connected) or os.clock() - startTime >= interval
    end
    if inputConnection.Connected then
        inputConnection:Disconnect()
    else
        textLabel.MaxVisibleGraphemes = -1
    end
    inputConnection = UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
        if (not gameProcessedEvent) and input.UserInputType == Enum.UserInputType.MouseButton1 then
            inputConnection:Disconnect()
        end
    end)
    while inputConnection.Connected do task.wait() end
    textLabel.MaxVisibleGraphemes = 0
end

local function writeTextAuto(textLabel: TextLabel, text: string, interval: number, continueWait: number)
    textLabel.MaxVisibleGraphemes = 0
    textLabel.Text = text
    for i = 1, string.len(text), 1 do
        textLabel.MaxVisibleGraphemes = i
        task.wait(interval)
    end
    task.wait(continueWait)
end

local function runDialog(dialog: dialog, dialogID: string) : boolean
    if (not Dialogs[dialogID]) then return false end
    local dialogData = Dialogs[dialogID]
    
    dialog.gui.Enabled = true
    dialog.dialogRunning = true
    
    for _, iteration in pairs(dialogData) do
        if dialog.nameLabel then
            dialog.nameLabel.Text = iteration.Name
        end
        if dialog.continueType == "Input" then
            writeTextInput(dialog.textLabel, iteration.Text, iteration.Interval)
        else
            writeTextAuto(dialog.textLabel, iteration.Text, iteration.Interval, iteration.AutoDialogWait)
        end
    end
    
    dialog.dialogRunning = false
    dialog.gui.Enabled = false
    
    return true
end

function Dialog.new(dialogGui: ScreenGui, textLabel: TextLabel, nameLabel: TextLabel?, dialogConfig: dialogConfig) : dialog
    local self = setmetatable({}, Dialog) :: dialog

    self.gui = dialogGui :: ScreenGui
	self.textLabel = textLabel :: TextLabel
	if nameLabel then
		self.nameLabel = nameLabel :: TextLabel
	end

    self.dialogRunning = false :: boolean
    self.continueType = "Input"

    if dialogConfig then
        
        if dialogConfig.continueType then
            self.continueType = dialogConfig.continueType
        end

    end

    self.run = function(dialogID: string) : boolean
        return runDialog(self, dialogID)
    end

    return self
end

export type dialogConfig = {
    continueType: "Auto" | "Input"
}
export type dialog = typeof(Dialog.new(Instance.new("ScreenGui"), Instance.new("TextLabel"), Instance.new("TextLabel"), {} :: dialogConfig))

return table.freeze(Dialog) :: typeof(Dialog)