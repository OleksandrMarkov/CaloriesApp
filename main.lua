--local bg = display.newImage("bg.jpg")
--bg.x = display.contentCenterX
--bg.y = display.contentCenterY

display.setStatusBar(display.HiddenStatusBar)

--display.setDefault("fillColor", 34 / 255, 45 / 255, 56 / 255)
display.setDefault("background", 119 / 255, 15 / 255, 64 / 255) -- rgb
--display.setDefault("background", 0) -- 0 = black, 0.5 = grey, 1 = white
--display.setDefault("background", 0.5, 0) -- 1st is color, 2nd is transperency(прозрачность: 0 - absolute transperency)
 
 --w = display.contentWidth - 20

 --circle = display.newCircle(display.contentCenterX, 74, 60) -- y = topY - 74, radius = 60
 --circle:setFillColor(66 / 255, 135 / 255, 245 / 255)
 
 --rectangle = display.newRoundedRect(display.contentCenterX, 110, w, 100, 15 ) -- y = topY - 110, height = 100, radius = 15
 --rectangle:setFillColor(66 / 255, 135 / 255, 245 / 255)
 
local weightGroup = display.newGroup()
 
circle = display.newCircle(weightGroup, display.contentCenterX, 74, 60)
circle:setFillColor(66 / 255, 135 / 255, 245 / 255)
 
circle = display.newCircle(weightGroup, display.contentCenterX, 254, 60)
circle:setFillColor(66 / 255, 135 / 255, 245 / 255)

--weightGroup:removeSelf()
--display.remove(weightGroup) -- the same

weightGroup.y = 100
weightGroup.x = 50
-- previous X=Y=0