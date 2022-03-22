local composer = require("composer")

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 119 / 255, 15 / 255, 64 / 255) -- rgb
display.setDefault("fillColor", 0)

--text constants
setWeightText = "Укажите вес в килограммах:"
setHeightText = "Укажите рост в сантиметрах:"
setAgeText = "Укажите возраст:"
setTimeText = "Укажите время в минутах:"
chooseSexText = "Укажите пол:"
maleText = "Мужской"
femaleText = "Женский" 
--

-- no-text constants
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
height = 170

blocksWidth = display.contentWidth - 25
margin = 1
blocksHeight = 70
blocksMarginTop = 20
RectCornerRounding = 10

circleRadius = 40

whiteColor = 1
blackColor = 0

setValueLabelFontSize = 15

valueFontSize = 20
valueLabelY = -23
numberValuesColor = {140/255, 52/255, 235/255}

littleButtonRadius = 5
littleButtonSide = 25
littleButtonFontSize = 40
littleButtonTop = 5
littleButtonDefaultColor = {76/255, 76/255, 76/255}
littleButtonOverColor = {150/255, 150/255, 150/255}

sliderWidth = 200
sliderHeight = 47
sliderTop = 6
sliderLeft = 61
--

composer.gotoScene("scenes.calc")