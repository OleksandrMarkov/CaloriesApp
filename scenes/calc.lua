local composer = require("composer")
local scene = composer.newScene()

local json = require("json")


-- function scene:create(event)
	-- local sceneGroup = self.view;
-- end

function scene:show(event)
	local sceneGroup = self.view
	local widget = require("widget")
	
	settings = loadSetting("settings.json")
	if(settings) then
		weight = settings.weight
		height = settings.height
		age = settings.age
		sex = settings.sex
		currentTime = settings.time
		activity_index = settings.activity_index
		activity_name = settings.activity_name
		activity_factor = settings.activity_factor
	end
	
	
	-- Weight
	-----------------------------------------------------------------
	--
	local weightGroup = display.newGroup()
	weightGroup.y = 0
	 
	circle = display.newCircle(weightGroup, display.contentCenterX, margin, circleRadius)
	circle:setFillColor(whiteColor)
	 
	rectangle = display.newRoundedRect(weightGroup, display.contentCenterX, blocksMarginTop, blocksWidth, blocksHeight, RectCornerRounding)
	rectangle:setFillColor(whiteColor) 
	 
	display.newText(weightGroup, setWeightText, display.contentCenterX, margin, "SuezOne-Regular", setValueLabelFontSize)

	local myWeight = display.newText({
		parent = weightGroup,
		fontSize = valueFontSize,
		text = weight,
		x = display.contentCenterX,
		y = valueLabelY,
		font = "Obelix Pro", -- native.systemFont
	})
	
	myWeight: setFillColor(unpack(numberValuesColor))

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
		top = sliderTop,
		left = sliderLeft,
		width = sliderWidth,
		height = sliderHeight,
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
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 23, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		
		labelColor = {default = {whiteColor}, over = {blackColor}},
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
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 272, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
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
	
	-- Age
	-----------------------------------------------------------------
	--
	local ageGroup = display.newGroup()
	ageGroup.y = 191
	 
	circle2 = display.newCircle(ageGroup, display.contentCenterX, margin, circleRadius)
	circle2:setFillColor(whiteColor)
	 
	rectangle2 = display.newRoundedRect(ageGroup, display.contentCenterX, blocksMarginTop, blocksWidth, blocksHeight, RectCornerRounding)
	rectangle2:setFillColor(whiteColor) 
	 
	display.newText(ageGroup, setAgeText, display.contentCenterX, margin, "SuezOne-Regular", setValueLabelFontSize)

	local myAge = display.newText({
		parent = ageGroup,
		fontSize = valueFontSize,
		text = age,
		x = display.contentCenterX,
		y = valueLabelY,
		font = "Obelix Pro", -- native.systemFont
	})

	myAge: setFillColor(unpack(numberValuesColor))

	ageSlider = widget.newSlider{
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
		top = sliderTop,
		left = sliderLeft,
		width = sliderWidth,
		height = sliderHeight,
		orientation = "horizontal",
		value = 100 * (age - ageMin) / (ageMax - ageMin),
		
		listener = function(event)
			age = math.round(ageMin + (ageMax - ageMin) * event.value / 100)
			myAge.text = age
		end
	}

	ageGroup:insert(ageSlider)

	ageMinusButton = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 23, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
		label = "-",
		
		onPress = function(event)
			if (age > ageMin) then
				age = age - 1
				myAge.text = age
				ageSlider:setValue( 100 * (age - ageMin) / (ageMax - ageMin))
			end	
		end
	}

	agePlusButton = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 272, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
		label = "+",
		
		onPress = function(event)
			if (age < ageMax) then
				age = age + 1
				myAge.text = age
				ageSlider:setValue( 100 * (age - ageMin) / (ageMax - ageMin))
			end	
		end
	}

	ageGroup:insert(ageMinusButton)
	ageGroup:insert(agePlusButton)
	
		-- Height
	-----------------------------------------------------------------
	--
	local heightGroup = display.newGroup()
	heightGroup.y = 96
	 
	circle3 = display.newCircle(heightGroup, display.contentCenterX, margin, circleRadius)
	circle3:setFillColor(whiteColor)
	 
	rectangle3 = display.newRoundedRect(heightGroup, display.contentCenterX, blocksMarginTop,blocksWidth, blocksHeight, RectCornerRounding)
	rectangle3:setFillColor(whiteColor) 
	 
	display.newText(heightGroup, "Укажите рост в сантиметрах:", display.contentCenterX, margin, "SuezOne-Regular", setValueLabelFontSize)

	local myHeight = display.newText({
		parent = heightGroup,
		fontSize = valueFontSize,
		text = height,
		x = display.contentCenterX,
		y = valueLabelY,
		font = "Obelix Pro", -- native.systemFont
	})

	myHeight: setFillColor(unpack(numberValuesColor))

	heightSlider = widget.newSlider{
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
		top = sliderTop,
		left = sliderLeft,
		width = sliderWidth,
		height = sliderHeight,
		orientation = "horizontal",
		value = 100 * (height - heightMin) / (heightMax - heightMin),
		
		listener = function(event)
			height = math.round(heightMin + (heightMax - heightMin) * event.value / 100)
			myHeight.text = height
		end
	}

	heightGroup:insert(heightSlider)

	heightMinusButton = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 23, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
		label = "-",
		
		onPress = function(event)
			if (height > heightMin) then
				height = height - 1
				myHeight.text = height
				heightSlider:setValue( 100 * (height - heightMin) / (heightMax - heightMin))
			end
		end
	}

	heightPlusButton = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 272, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
		label = "+",
		
		onPress = function(event)
			if (height < heightMax) then
				height = height + 1
				myHeight.text = height
				heightSlider:setValue( 100 * (height - heightMin) / (heightMax - heightMin))
			end
		end
	}

	heightGroup:insert(heightMinusButton)
	heightGroup:insert(heightPlusButton)
	
		-- Time
	-----------------------------------------------------------------
	--
	local timeGroup = display.newGroup()
	timeGroup.y = 286
	 
	circle4 = display.newCircle(timeGroup, display.contentCenterX, margin, circleRadius)
	circle4:setFillColor(whiteColor)
	 
	rectangle4 = display.newRoundedRect(timeGroup, display.contentCenterX, blocksMarginTop, blocksWidth, blocksHeight, RectCornerRounding)
	rectangle4:setFillColor(whiteColor) 
	 
	display.newText(timeGroup, setTimeText, display.contentCenterX, margin, "SuezOne-Regular", setValueLabelFontSize)

	local myTime = display.newText({
		parent = timeGroup,
		fontSize = valueFontSize,
		text = currentTime,
		x = display.contentCenterX,
		y = valueLabelY,
		font = "Obelix Pro", -- native.systemFont
	})

	myTime: setFillColor(unpack(numberValuesColor))

	timeSlider = widget.newSlider{
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
		top = sliderTop,
		left = sliderLeft,
		width = sliderWidth,
		height = sliderHeight,
		orientation = "horizontal",
		value = 100 * (currentTime - timeMin) / (timeMax - timeMin),
		
		listener = function(event)
			currentTime = math.round(timeMin + (timeMax - timeMin) * event.value / 100)
			myTime.text = currentTime
		end
	}

	timeGroup:insert(timeSlider)

	timeMinusButton = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 23, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
		label = "-",
		
		onPress = function(event)
			if (currentTime > timeMin) then
				currentTime = currentTime - 1
				myTime.text = currentTime
				timeSlider:setValue( 100 * (currentTime - timeMin) / (timeMax - timeMin))
			end
		end
	}

	timePlusButton = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = littleButtonSide, height = littleButtonSide,
		left = 272, top = littleButtonTop,
		fontSize = littleButtonFontSize,
		fillColor = {default = littleButtonDefaultColor, over = littleButtonOverColor },
		labelColor = {default = {whiteColor}, over = {blackColor} },
		label = "+",
		
		onPress = function(event)
			if (currentTime < timeMax) then
				currentTime = currentTime + 1
				myTime.text = currentTime
				timeSlider:setValue( 100 * (currentTime - timeMin) / (timeMax - timeMin))
			end
		end
	}

	timeGroup:insert(timeMinusButton)
	timeGroup:insert(timePlusButton)
	
		-- Sex
	-----------------------------------------------------------------
	--
	sex = maleText
	local sexGroup = display.newGroup()
	
	rectangle5 = display.newRoundedRect(sexGroup, display.contentCenterX, 379, blocksWidth, blocksHeight, RectCornerRounding)
	rectangle5:setFillColor(whiteColor)
		
	display.newText(sexGroup, chooseSexText, 90, 365, "Obelix Pro", 13)

	sexSelect = display.newText(sexGroup, sex, 90, 390, "Obelix Pro", 18)
	sexSelect:setFillColor(0.4)

	maleOn = display.newImage(sexGroup, "img/male_active.png", 200, 378)
	maleOff = display.newImage(sexGroup, "img/male.png", 200, 378)
	femaleOn = display.newImage(sexGroup, "img/female_active.png", 270, 378)
	femaleOff = display.newImage(sexGroup, "img/female.png", 270, 378)

	if (sex == maleText) then
		maleOff.isVisible = false
		femaleOn.isVisible = false

	else
		maleOn.isVisible = false
		femaleOff.isVisible = false
	end

	function selectMale(event)
		if (event.phase == "began") then
			sex = maleText
			sexSelect.text = sex
			maleOn.isVisible = true
			femaleOff.isVisible = true
			maleOff.isVisible = false
			femaleOn.isVisible = false
		end
	end

	function selectFemale(event)
		if (event.phase == "began") then
			sex = femaleText
			sexSelect.text = sex
			maleOn.isVisible = false
			femaleOff.isVisible = false
			maleOff.isVisible = true
			femaleOn.isVisible = true
		end
	end

	maleOff:addEventListener("touch", selectMale)
	femaleOff:addEventListener("touch", selectFemale)
	
	--sexGroup:insert(maleOn)
	--sexGroup:insert(maleOff)
	--sexGroup:insert(femaleOn)
	--sexGroup:insert(femaleOff)
	--sexGroup:insert(sex)
	
	
	local activityGroup = display.newGroup()
	rectangle5 = display.newRoundedRect(activityGroup, display.contentCenterX, blocksMarginTop + 430, blocksWidth, 50, RectCornerRounding)
	rectangle5:setFillColor(whiteColor)
	
	--display.newPolygon(activityGroup, 290, 430, {500, 452, 520, 452, 510, 466}): setFillColor(blackColor)
	polygon = display.newPolygon(activityGroup, 290, 435, {500, 452, 520, 452, 510, 466})
	polygon: setFillColor(blackColor)
	
	activityText = display.newText(activityGroup, activity_name, display.contentCenterX, 450, native.systemFont, 15)
	activityText:setFillColor(blackColor)
	
	activityGroup: addEventListener("touch",
	
	function(event)
		composer.showOverlay("scenes.activity", {
		isModal = true, --modal window
		effect = "fade",
		time = 400,
		})
	end
	
	)
	
	
	local buttonCalculate = widget.newButton{
		shape = 'roundedRect',
		radius = littleButtonRadius,
		width = blocksWidth,
		height = littleButtonSide,
		left = 10,
		top = 485,
		fillColor = {default = {245/255, 77/255, 128/255}, over = {0, 149/255, 59/255} },
		labelColor = {default = {whiteColor}, over = {whiteColor} },
		label = "Расчитать калории",
		fontSize = 20,
		
		onPress = function(event)
			composer.showOverlay("scenes.results", {
			isModal = true, 
			effect = "fade",
			time = 400,	
			})
		end	
	}
		
	-- adding all objects to sceneGroup
	sceneGroup:insert(weightGroup)
	sceneGroup:insert(sexGroup)
	sceneGroup:insert(ageGroup)
	sceneGroup:insert(heightGroup)
	sceneGroup:insert(timeGroup)
	sceneGroup:insert(activityGroup)
	
	sceneGroup:insert(buttonCalculate)
end

	function loadSetting(fileName)
		local path = system.pathForFile(fileName, system.ResourceDirectory)
		local contents = ""
		local myTable = {}
		local file = io.open(path, "r")
		
		if (file) then
			contents = file:read("*a")
			myTable = json.decode(contents)
			io.close(file)
			return myTable
		end
		return nil	
	end

-- function scene:hide(event)
	-- local sceneGroup = self.view;
-- end

-- function scene:destroy(event)
	-- local sceneGroup = self.view;
-- end

-- scene:addEventListener("create", scene);
scene:addEventListener("show", scene)
-- scene:addEventListener("hide", scene);
-- scene:addEventListener("destroy", scene);
return scene;