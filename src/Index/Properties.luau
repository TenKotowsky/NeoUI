--!strict
--!native
--!optimize 2
local Type = require(script.Parent.Parent.Type)
local DefaultProperties = require(script.Parent.Parent.DefaultProperties)
local Features = require(script.Parent.Features)

local Properties = {}

function Properties:SetProperties(element: GuiObject | Instance, properties: Type.Dictionary?, initialCreation: boolean)
	local properties: Type.Dictionary = properties or {}
	if initialCreation then
		for property: string, value: any in pairs(DefaultProperties[element.ClassName]) do
			element[property] = value
		end
	end
	for property: string, value: any in pairs(properties) do
		element[property] = value
	end
end

function Properties:SetPropertiesFromTemplate(element: GuiObject | Instance, template: Type.Template, overwriteProperties: Type.Dictionary?)
	local overwriteProperties: Type.Dictionary = overwriteProperties or {}

	--first apply the defaults
	for property: string, value: any in pairs(DefaultProperties[element.ClassName]) do
		element[property] = value
	end

	--if the template has properties specified, apply these
	for property: string, value: any in pairs(template.properties :: Type.Dictionary) do
		element[property] = value
	end

	--if the template's properties are supposed to be overwritten, well, overwrite them
	for property: string, value: any in pairs (overwriteProperties) do
		element[property] = value
	end

	if template.children then
		for _, child: Type.Template in pairs(template.children) do
			local newChild = Instance.new(child.elementType) :: Instance & {Parent: Instance}
			newChild.Parent = element
			Properties:SetPropertiesFromTemplate(newChild, child, overwriteProperties)
			if child.features then
				Features:SetFeatures(newChild, child.features)
			end
		end
	end
end

return Properties :: typeof(Properties)