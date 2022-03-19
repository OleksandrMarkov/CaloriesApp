--local bg = display.newImage("bg.jpg")
--bg.x = display.contentCenterX
--bg.y = display.contentCenterY

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 119 / 255, 15 / 255, 64 / 255) -- rgb
display.setDefault("fillColor", 0)
--display.setDefault("background", 0) -- 0 = black, 0.5 = grey, 1 = white
--display.setDefault("background", 0.5, 0) -- 1st is color, 2nd is transperency(прозрачность: 0 - absolute transperency)
 
w = display.contentWidth - 20
weightMin = 40
weightMax = 140
weight = weightMin
 
local weightGroup = display.newGroup()
 
circle = display.newCircle(weightGroup, display.contentCenterX, 54, 50) -- y = topY - 54, radius = 50
circle:setFillColor(66 / 255, 135 / 255, 245 / 255)
 
rectangle = display.newRoundedRect(weightGroup, display.contentCenterX, 110, w, 100, 10 ) -- y = topY - 110, height = 100, radius = 15
rectangle:setFillColor(66 / 255, 135 / 255, 245 / 255) 
 
--weightGroup:removeSelf()
--display.remove(weightGroup) -- the same

-- by default X=Y=0
--weightGroup.y = 100
--weightGroup.x = 50

display.newText(weightGroup, "Укажите вес в килограммах:", display.contentCenterX, 90, "SuezOne-Regular", 20) -- size = 20

local myWeight = display.newText({
	parent = weightGroup,
	fontSize = 35,
	text = weight,
	x = display.contentCenterX,
	y = 53,
	font = "Obelix Pro", -- native.systemFont
})

myWeight: setFillColor(19 / 255, 3 / 255, 56 / 255)