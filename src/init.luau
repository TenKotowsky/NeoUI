--NeoUI 1.0.2
--!strict
--!optimize 2

local Index = require(script.Index)

return {
	createElement = Index.createElement,
	modifyElement = Index.modifyElement,
	copyElement = Index.copyElement,

	createTemplate = Index.createTemplate,
	createFromTemplate = Index.createFromTemplate
}