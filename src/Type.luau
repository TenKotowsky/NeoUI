--!strict

export type Element = "ScreenGui" | "SurfaceGui" | "BillboardGui" | "Frame" | "ScrollingFrame" | "ViewportFrame" | "VideoFrame" | "TextLabel" | "ImageLabel" | "TextButton" | "ImageButton" | "TextBox" | "CanvasGroup" | "Path2D"

export type Feature = "UIGridLayout" | "UIListLayout" | "UIPageLayout" | "UITableLayout" | "UIPadding" |"UIFlexItem" | "UIAspectRatioConstraint" | "UISizeConstraint" | "UITextSizeConstraint" | "UICorner" | "UIGradient" | "UIScale" | "UIStroke"

export type Dictionary = {
    [any]: any?
}

export type Children = {
    [number]: GuiObject | Instance
}

export type Template = {
    elementType: Element,
    properties: Dictionary | nil,
    features: Dictionary | nil,
    children: Children | nil
}

return nil