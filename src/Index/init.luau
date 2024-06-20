--!strict
--!native
--!optimize 2
local Type = require(script.Parent.Type)
local Properties = require(script.Properties)
local Features = require(script.Features)

local Index = {}

function Index.createElement(parent: any, elementType: Type.Element, properties: Type.Dictionary | nil, features: Type.Dictionary | nil): GuiBase | Instance
    local element: GuiBase | Instance = Instance.new(elementType)
    element.Parent = parent
    Properties:SetProperties(element, properties, true)
    if features then
        Features:SetFeatures(element, features)
    end
    return element :: typeof(element)
end

function Index.createFromTemplate(parent: any, template: Type.Template, overwriteProperties: Type.Dictionary | nil)
    local element: GuiBase | Instance = Instance.new(template.elementType)
    element.Parent = parent
    Properties:SetPropertiesFromTemplate(element, template, overwriteProperties)
    if template.features then
        Features:SetFeatures(element, template.features)
    end
    return element :: typeof(element)
end

function Index.createTemplate(elementType: Type.Element, properties: Type.Dictionary | nil, features: Type.Dictionary | nil, children: Type.Children | nil): Type.Template
    return {elementType = elementType, properties = properties, features = features, children = children} :: Type.Template
end

function Index.copyElement(parent: any, elementToCopy: GuiBase | Instance, properties: Type.Dictionary | nil): GuiBase | Instance
    local element: GuiBase | Instance = elementToCopy:Clone()
    element.Parent = parent
    Properties:SetProperties(element, properties, true)
    return element :: typeof(element)
end

function Index.modifyElement(element: GuiBase | Instance, properties: Type.Dictionary | nil)
    Properties:SetProperties(element, properties, false)
end

return table.freeze(Index) :: typeof(Index)