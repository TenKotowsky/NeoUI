--!strict
--!native
--!optimize 2
local Type = require(script.Parent.Parent.Type)
local DefaultProperties = require(script.Parent.Parent.DefaultProperties)

local Properties = {}

function Properties:SetProperties(element: GuiBase | Instance, properties: Type.Dictionary | nil, initialCreation: boolean)
    local properties: Type.Dictionary = properties or {}
    if initialCreation then
        for property: string, value: any in DefaultProperties[element.ClassName] do
            element[property] = value
        end
    end
    for property: string, value: any in pairs(properties) do
        element[property] = value
    end
end

function Properties:SetPropertiesFromTemplate(element: GuiBase | Instance, template: Type.Template, overwriteProperties: Type.Dictionar | nil)
	local overwriteProperties: Type.Dictionary = overwriteProperties or {}

    for property: string, value: any in DefaultProperties[element.ClassName] do
        element[property] = value
    end

    for property: string, value: any in template.properties do
        if overwriteProperties[property] then
            element[property] = overwriteProperties[property]
        else
            element[property] = value
        end
    end

    if template.children then
        for _, child: Instance in pairs(template.children) do
            child:Clone().Parent = element
        end
    end
end

return Properties :: typeof(Properties)