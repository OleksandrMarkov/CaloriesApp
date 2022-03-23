local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")

local json = require("json")

function scene:create(event)
	local sceneGroup = self.view
	
	display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight): setFillColor(37 / 255, 39 / 255, 46 / 255, 0.7)
	
	display.newRoundedRect(sceneGroup, display.contentCenterX, 240, blocksWidth + 5, 420, 15):setFillColor(244/255) -- y,w,h; r =15
	
	local okButton = widget.newButton{
		shape = 'roundedRect', 
		radius = littleButtonRadius,
		width = blocksWidth + 5, height = 50,
		left = 10, top = 400,
		fillColor = {default = {0.2}, over = {0, 149/255, 59/255} },
		labelColor = {default = {whiteColor}, over = {whiteColor} },
		label = "Готово",
		fontSize = valueFontSize,
		
		onPress = function(event)
			composer.hideOverlay("fade", 400)
		end
	}
	sceneGroup:insert(okButton)
	
	function calculate()
		local formula
		if (sex == maleText) then
			formula = (10 * weight + 6.25 * height - 5 * age + 5)
		elseif (sex == femaleText) then
			formula = (10 * weight + 6.25 * height - 5 * age - 161)
		end
		
		v = formula * activity_factor / 24
		res = math.round(v * currentTime / 60)
		return res
	end	
	
	display.newText(sceneGroup, "Результат", display.contentCenterX, 80, "Obelix Pro", 28)
	display.newImage(sceneGroup, "img/apple.png", 39, 80)
	
	calories = calculate()
	display.newText({
		parent = sceneGroup,
		text = activity_name,
		x = display.contentCenterX,
		y = 130,
		fontSize = valueFontSize,
		width = 420,
		align = "center"
	})
	
	display.newText(sceneGroup, "Время:", display.contentCenterX, 180, native.systemFont, valueFontSize)
	display.newText(sceneGroup, currentTime.." мин.", display.contentCenterX, 220, native.systemFont, valueFontSize)
	display.newText(sceneGroup, "Сожгли калорий:", display.contentCenterX, 260, native.systemFont, valueFontSize)
	display.newText(sceneGroup, calories, display.contentCenterX, 300, native.systemFont, 30):setFillColor(0, 165/255, 80/255)
	
	function saveSettings(t, fileName)
		local path = system.pathForFile(fileName, system.ResourceDirectory)
		local file = io.open(path, "w")
		if (file) then
			local contents = json.encode(t)
			file:write(contents)
			io.close(file)
			return true
		else
			return false
		end
	end
	
	settings = {}
 	settings.weight = weight 
	settings.height = height 
	settings.age = age 
	settings.sex = sex
	settings.time = currentTime
	settings.activity_index = activity_index
	settings.activity_name = activity_name
	settings.activity_factor = activity_factor
	
	saveSettings(settings, "settings.json")
	
	
end

scene:addEventListener("create", scene)
return scene	