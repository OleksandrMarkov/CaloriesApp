--local bg = display.newImage("bg.jpg")
--bg.x = display.contentCenterX
--bg.y = display.contentCenterY

--display.setDefault("background", 185 / 255, 245 / 255, 245 / 255) --default

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("fillColor", 34 / 255, 45 / 255, 56 / 255)
--display.setDefault("background", 34 / 255, 45 / 255, 56 / 255) -- rgb

display.setDefault("background", 0) -- 0 = black, 0.5 = grey, 1 = white

display.setDefault("background", 0.5, 0) -- 1st is color, 2nd is transperency(прозрачность: 0 - absolute transperency)
 