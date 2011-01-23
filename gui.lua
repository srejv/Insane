GUI = class("GUI")
function GUI:initialize()
  self.container = GUIWidget:new("master")
  self.size = { width = 800, height = 600 }
end

function GUI:addWidget(widget)
  self.container:addWidget(widget)
end

function GUI:removeWidget(id)
  self.container:removeWidget(id)
end

function GUI:draw()
  love.graphics.print("GUI Active", 0, 584)
  self.container:draw()
end

function GUI:update(dt)
  self.container:update(dt)
end

function GUI:keypressed(key, unicode)
  self.container:keypressed(key, unicode)
end

function GUI:keyreleased(key, unicode)
  self.container:keyreleased(key, unicode)
end

function GUI:mousereleased(x, y, btn)
  self.container:mousereleased(x, y, btn)
end

function GUI:mousepressed(x, y, btn)
  self.container:mousepressed(x, y, btn)
end