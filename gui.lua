GUI = class("GUI")
function GUI:initialize()
  self.container = { }
  self.size.width = 800
  self.size.height = 600
end

function GUI:draw()
  for i,v in pairs(self.container) do
    v:draw()
  end
  
end

function GUI:update(dt)
  for i,v in pairs(self.container) do
    v:update(dt)
  end
end

function GUI:keypressed(key, unicode)
  for i,v in pairs(self.container) do
    v:keypressed(key, unicode)
  end
end

function GUI:keyreleased(key, unicode)
  for i,v in pairs(self.container) do
    v:keyreleased(key, unicode)
  end
end

function GUI:mousereleased(x, y, btn)
  for i,v in pairs(self.container) do
    v:mousereleased(x, y, btn)
  end
end

function GUI:mousepressed(x, y, btn)
  for i,v in pairs(self.container) do
    v:mousepressed(x, y, btn)
  end
end