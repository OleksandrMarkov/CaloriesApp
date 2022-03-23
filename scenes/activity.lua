local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")
local data = require("scenes.data")

function scene:create(event)
	local sceneGroup = self.view
	
	display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight): setFillColor(37 / 255, 39 / 255, 46 / 255, 0.8)
	
	function onRowRender(event)
		local row = event.row
		local id = row.index
		
		row.activityText = display.newText(data[id].name, 24, 24, native.systemFont, 15)
		row.activityText.anchorX = 0
		if(data[id].category == 1) then
			row.activityText:setFillColor(1)
		else
			row.activityText:setFillColor(0)
		end
		row:insert(row.activityText)
		return true	
	end
	
	function onRowTouch(event)
		local row = event.row
		if(event.phase == "release") then
			activity_index = row.index
			activity_name = data[activity_index].name
			activity_factor = data[activity_index].factor
			activityText.text = activity_name
			composer.hideOverlay("fade", 400)
		end	
	end
	
	local activityList = widget.newTableView{
		top = 0, left = 40, width = 460, height = 1000, -- top = 70
		onRowRender = onRowRender, -- show the list
		onRowTouch = onRowTouch -- select an item
	}
	sceneGroup:insert(activityList)
	
	for i = 1, #data do
		if(data[i].category == 1) then isCategory = true
		else isCategory = false
		end
		if (isCategory == true) then
			rowColor = {default = {237/255, 103 / 255, 57 / 255}}
		else rowColor = {default = {1}}
		end
		
		activityList:insertRow{
			rowHeight = 50,
			isCategory = isCategory,
			rowColor= rowColor,
		}
	end
	
	if (activity_index > 1) then
		activityList:scrollToY({y = -(activity_index - 2)*50})
	end

	close = display.newImage(sceneGroup, "img/close.png", 295, 20) -- x 50, y 76
	close:addEventListener("touch", function(event)
		if(event.phase == "ended") then
			composer.hideOverlay("fade", 400)
		end
	end	
	)
	
end

scene:addEventListener("create", scene)
-- scene:addEventListener("hide", scene);
-- scene:addEventListener("destroy", scene);
return scene	