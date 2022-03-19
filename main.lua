display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 119 / 255, 15 / 255, 64 / 255) -- rgb
display.setDefault("fillColor", 0)

local widget = require("widget")

w = display.contentWidth - 25
weightMin = 40
weightMax = 140
weight = 60
 
local weightGroup = display.newGroup()
weightGroup.y = 0
 
circle = display.newCircle(weightGroup, display.contentCenterX, 10, 40) -- y = topY - 15, radius = 50
circle:setFillColor(1)
 
rectangle = display.newRoundedRect(weightGroup, display.contentCenterX, 30, w, 70, 10 ) -- y = topY - 110, height = 100, radius = 15
rectangle:setFillColor(1) 
 
display.newText(weightGroup, "Укажите вес в килограммах:", display.contentCenterX, 15, "SuezOne-Regular", 15) -- size = 15

local myWeight = display.newText({
	parent = weightGroup,
	fontSize = 25,
	text = weight,
	x = display.contentCenterX,
	y = -5,
	font = "Obelix Pro", -- native.systemFont
})

myWeight: setFillColor(19 / 255, 3 / 255, 56 / 255)

local optionSlider = {
	frames = {
	{ x = 0, y = 0, width = 15, height = 45},
	{ x = 16, y = 0, width = 130, height = 45},
	{ x = 332, y = 0, width = 15, height = 45},
	{ x = 153, y = 0, width = 15, height = 45},
	{ x = 353, y = 0, width = 47, height = 47},
	},
	sheetContentWidth = 400,
	sheetContentHeight = 45
}

weightSlider = widget.newSlider{
	sheet = graphics.newImageSheet("img/slider.png", optionSlider),
	leftFrame = 1,
	middleFrame = 2,
	rightFrame = 3,
	fillFrame = 4,
	handleFrame = 5,
	frameWidth = 15,
	frameHeight = 45,
	handleWidth = 45,
	handleHeight = 45,
	top = 20,
	left = 61,
	width = 200,
	height = 47,
	orientation = "horizontal",
	value = 100 * (weight - weightMin) / (weightMax - weightMin),
	
	listener = function(event)
		weight = math.round(weightMin + (weightMax - weightMin) * event.value / 100)
		myWeight.text = weight
	end
}

weightGroup:insert(weightSlider)

weightMinusButton = widget.newButton{
	shape = 'roundedRect',
	radius = 5,
	width = 25, height = 25,
	left = 20, top = 20,
	fontSize = 40,
	fillColor = {default = {76 / 255}, over = {150/255} },
	labelColor = {default = {1}, over = {0} },
	label = "-",
	
	onPress = function(event)
		if (weight > weightMin) then
			weight = weight - 1
			myWeight.text = weight
			weightSlider:setValue( 100 * (weight - weightMin) / (weightMax - weightMin))
		end	
	end
}

weightPlusButton = widget.newButton{
	shape = 'roundedRect',
	radius = 5,
	width = 25, height = 25,
	left = 275, top = 20,
	fontSize = 40,
	fillColor = {default = {76 / 255}, over = {150/255} },
	labelColor = {default = {1}, over = {0} },
	label = "+",
	
	onPress = function(event)
		if (weight < weightMax) then
			weight = weight + 1
			myWeight.text = weight
			weightSlider:setValue( 100 * (weight - weightMin) / (weightMax - weightMin))
		end	
	end
}

weightGroup:insert(weightMinusButton)
weightGroup:insert(weightPlusButton)


-----------------------

sex = "Мужской"

local sexGroup = display.newGroup()
display.newRoundedRect(sexGroup, display.contentCenterX, 380, w, 120, 10):setFillColor(244/255)
display.newText(sexGroup, "Укажите пол", 90, 360, "Obelix Pro", 16)

sexSelect = display.newText(sexGroup, sex, 90, 400, "Obelix Pro", 14)
sexSelect:setFillColor(0.4)

maleOn = display.newImage(sexGroup, "img/male_active.png", 200, 380)
maleOff = display.newImage(sexGroup, "img/male.png", 200, 380)
femaleOn = display.newImage(sexGroup, "img/female_active.png", 270, 380)
femaleOff = display.newImage(sexGroup, "img/female.png", 270, 380)


if (sex == "Мужской") then
	maleOff.isVisible = false
	femaleOn.isVisible = false

else
	maleOn.isVisible = false
	femaleOff.isVisible = false
end

function selectMale(event)
	if (event.phase == "began") then
		sex = "Мужской"
		sexSelect.text = sex
		maleOn.isVisible = true
		femaleOff.isVisible = true
		maleOff.isVisible = false
		femaleOn.isVisible = false
	end
end

function selectFemale(event)
	if (event.phase == "began") then
		sex = "Женский"
		sexSelect.text = sex
		maleOn.isVisible = false
		femaleOff.isVisible = false
		maleOff.isVisible = true
		femaleOn.isVisible = true
	end
end

maleOff:addEventListener("touch", selectMale)
femaleOff:addEventListener("touch", selectFemale)