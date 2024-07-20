--!strict
--!native
--!optimize 2
local Type = require(script.Parent.Type)
local Properties = require(script.Properties)
local Features = require(script.Features)

local Index = {}

function Index.createElement(parent: Instance, elementType: Type.Element, properties: Type.Dictionary?, features: Type.Dictionary?): GuiObject | Instance
	local element = Instance.new(elementType) :: Instance & {Parent: Instance}
	element.Parent = parent
	Properties:SetProperties(element, properties, true)
	if features then
		Features:SetFeatures(element, features)
	end
	return element :: typeof(element)
end

function Index.createFromTemplate(parent: Instance, template: Type.Template, overwriteProperties: Type.Dictionary?)
	local element: Instance = Instance.new(template.elementType) :: Instance & {Parent: Instance}
	element.Parent = parent
	Properties:SetPropertiesFromTemplate(element, template, overwriteProperties)
	if template.features then
		Features:SetFeatures(element, template.features)
	end
	return element :: typeof(element)
end

function Index.createTemplate(elementType: Type.Element, properties: Type.Dictionary?, features: Type.Dictionary?, children: Type.Children?): Type.Template
	return {elementType = elementType, properties = properties, features = features, children = children} :: Type.Template
end

function Index.copyElement(parent: Instance, elementToCopy: GuiObject | Instance, properties: Type.Dictionary?): GuiObject | Instance
	local element = elementToCopy:Clone() :: Instance & {Parent: Instance}
	element.Parent = parent
	Properties:SetProperties(element, properties, true)
	return element :: typeof(element)
end

function Index.modifyElement(element: GuiObject | Instance, properties: Type.Dictionary?)
	Properties:SetProperties(element, properties, false)
end

return table.freeze(Index) :: typeof(Index)