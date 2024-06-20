--!strict
--!native
--!optimize 2
local Type = require(script.Parent.Parent.Type)

local Features = {}

function Features:SetFeatures(element: GuiBase | Instance, features: Type.Dictionary)
    for feature: string, config: any in pairs(features) do
        local newFeature = Instance.new(feature)
        newFeature.Parent = element
        for property: string, value: any in pairs(config) do
            newFeature[property] = value
        end
    end
end

return Features :: typeof(Features)