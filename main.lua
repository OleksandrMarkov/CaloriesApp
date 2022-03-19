local composer = require("composer")

weightMin = 40
weightMax = 180
weight = 60

ageMin = 18
ageMax = 120
age = ageMin

timeMin = 1
timeMax = 120
currentTime = timeMin

heightMin = 100
heightMax = 220
height = heightMin

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 119 / 255, 15 / 255, 64 / 255) -- rgb
display.setDefault("fillColor", 0)

w = display.contentWidth - 25


composer.gotoScene("scenes.calc")