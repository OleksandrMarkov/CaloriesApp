local composer = require("composer")
local scene = composer.newScene()

-- function scene:create(event)
	-- local sceneGroup = self.view;
-- end

function scene:show(event)
	local sceneGroup = self.view;
	local widget = require("widget")
	
	-- Weight
	-----------------------------------------------------------------
	--
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
	
	-- Age
	-----------------------------------------------------------------
	--
	local ageGroup = display.newGroup()
	ageGroup.y = 200
	 
	circle2 = display.newCircle(ageGroup, display.contentCenterX, 10, 40) -- y = topY - 15, radius = 50
	circle2:setFillColor(1)
	 
	rectangle2 = display.newRoundedRect(ageGroup, display.contentCenterX, 30, w, 70, 10 ) -- y = topY - 110, height = 100, radius = 15
	rectangle2:setFillColor(1) 
	 
	display.newText(ageGroup, "Укажите возраст:", display.contentCenterX, 15, "SuezOne-Regular", 15) -- size = 15

	local myAge = display.newText({
		parent = ageGroup,
		fontSize = 25,
		text = age,
		x = display.contentCenterX,
		y = -5,
		font = "Obelix Pro", -- native.systemFont
	})

	myAge: setFillColor(19 / 255, 3 / 255, 56 / 255)

	-- local optionSlider = {
		-- frames = {
		-- { x = 0, y = 0, width = 15, height = 45},
		-- { x = 16, y = 0, width = 130, height = 45},
		-- { x = 332, y = 0, width = 15, height = 45},
		-- { x = 153, y = 0, width = 15, height = 45},
		-- { x = 353, y = 0, width = 47, height = 47},
		-- },
		-- sheetContentWidth = 400,
		-- sheetContentHeight = 45
	-- }

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
		top = 20,
		left = 61,
		width = 200,
		height = 47,
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
		radius = 5,
		width = 25, height = 25,
		left = 20, top = 20,
		fontSize = 40,
		fillColor = {default = {76 / 255}, over = {150/255} },
		labelColor = {default = {1}, over = {0} },
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
		radius = 5,
		width = 25, height = 25,
		left = 275, top = 20,
		fontSize = 40,
		fillColor = {default = {76 / 255}, over = {150/255} },
		labelColor = {default = {1}, over = {0} },
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
	heightGroup.y = 100
	 
	circle3 = display.newCircle(heightGroup, display.contentCenterX, 10, 40) -- y = topY - 15, radius = 50
	circle3:setFillColor(1)
	 
	rectangle3 = display.newRoundedRect(heightGroup, display.contentCenterX, 30, w, 70, 10 ) -- y = topY - 110, height = 100, radius = 15
	rectangle3:setFillColor(1) 
	 
	display.newText(heightGroup, "Укажите рост в см:", display.contentCenterX, 15, "SuezOne-Regular", 15) -- size = 15

	local myHeight = display.newText({
		parent = heightGroup,
		fontSize = 25,
		text = height,
		x = display.contentCenterX,
		y = -5,
		font = "Obelix Pro", -- native.systemFont
	})

	myHeight: setFillColor(19 / 255, 3 / 255, 56 / 255)

	-- local optionSlider = {
		-- frames = {
		-- { x = 0, y = 0, width = 15, height = 45},
		-- { x = 16, y = 0, width = 130, height = 45},
		-- { x = 332, y = 0, width = 15, height = 45},
		-- { x = 153, y = 0, width = 15, height = 45},
		-- { x = 353, y = 0, width = 47, height = 47},
		-- },
		-- sheetContentWidth = 400,
		-- sheetContentHeight = 45
	-- }

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
		top = 20,
		left = 61,
		width = 200,
		height = 47,
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
		radius = 5,
		width = 25, height = 25,
		left = 20, top = 20,
		fontSize = 40,
		fillColor = {default = {76 / 255}, over = {150/255} },
		labelColor = {default = {1}, over = {0} },
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
		radius = 5,
		width = 25, height = 25,
		left = 275, top = 20,
		fontSize = 40,
		fillColor = {default = {76 / 255}, over = {150/255} },
		labelColor = {default = {1}, over = {0} },
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
	timeGroup.y = 300
	 
	circle4 = display.newCircle(timeGroup, display.contentCenterX, 10, 40) -- y = topY - 15, radius = 50
	circle4:setFillColor(1)
	 
	rectangle4 = display.newRoundedRect(timeGroup, display.contentCenterX, 30, w, 70, 10 ) -- y = topY - 110, height = 100, radius = 15
	rectangle4:setFillColor(1) 
	 
	display.newText(timeGroup, "Укажите время в минутах:", display.contentCenterX, 15, "SuezOne-Regular", 15) -- size = 15

	local myTime = display.newText({
		parent = timeGroup,
		fontSize = 25,
		text = currentTime,
		x = display.contentCenterX,
		y = -5,
		font = "Obelix Pro", -- native.systemFont
	})

	myTime: setFillColor(19 / 255, 3 / 255, 56 / 255)

	-- local optionSlider = {
		-- frames = {
		-- { x = 0, y = 0, width = 15, height = 45},
		-- { x = 16, y = 0, width = 130, height = 45},
		-- { x = 332, y = 0, width = 15, height = 45},
		-- { x = 153, y = 0, width = 15, height = 45},
		-- { x = 353, y = 0, width = 47, height = 47},
		-- },
		-- sheetContentWidth = 400,
		-- sheetContentHeight = 45
	-- }

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
		top = 20,
		left = 61,
		width = 200,
		height = 47,
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
		radius = 5,
		width = 25, height = 25,
		left = 20, top = 20,
		fontSize = 40,
		fillColor = {default = {76 / 255}, over = {150/255} },
		labelColor = {default = {1}, over = {0} },
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
		radius = 5,
		width = 25, height = 25,
		left = 275, top = 20,
		fontSize = 40,
		fillColor = {default = {76 / 255}, over = {150/255} },
		labelColor = {default = {1}, over = {0} },
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
	sex = "Мужской"
	local sexGroup = display.newGroup()
	display.newRoundedRect(sexGroup, display.contentCenterX, 420, w, 100, 10):setFillColor(244/255)
	display.newText(sexGroup, "Укажите пол", 90, 400, "Obelix Pro", 16)

	sexSelect = display.newText(sexGroup, sex, 90, 420, "Obelix Pro", 14)
	sexSelect:setFillColor(0.4)

	maleOn = display.newImage(sexGroup, "img/male_active.png", 200, 415)
	maleOff = display.newImage(sexGroup, "img/male.png", 200, 415)
	femaleOn = display.newImage(sexGroup, "img/female_active.png", 270, 415)
	femaleOff = display.newImage(sexGroup, "img/female.png", 270, 415)

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
	
	--sexGroup:insert(maleOn)
	--sexGroup:insert(maleOff)
	--sexGroup:insert(femaleOn)
	--sexGroup:insert(femaleOff)
	--sexGroup:insert(sex)
	
	-- adding all objects to sceneGroup
	sceneGroup:insert(weightGroup)
	sceneGroup:insert(sexGroup)
	sceneGroup:insert(ageGroup)
	sceneGroup:insert(heightGroup)
	sceneGroup:insert(timeGroup)
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