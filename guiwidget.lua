--[[
  Class GUIWidget
  
  Base widget class for gui.
--]]


--[[
  Constructor
  params:
  id = id of the widget
--]]
GUIWidget = class("GUIWidget")
function GUIWidget:initialize(id)
  self.container = {}
  self.parent = nil
  self.id = id
  self.pos = { x = 0, y = 0 }
  self.size = { width = 0, height = 0 }
  self.movable = false
  self.line = { width = 1, color = { r = 255, g = 255, b = 255, a = 255 } }
  self.background = { }
  self.background.color = { r = 255, g = 255, b = 255, a = 255 }
  self.visible = false
  self.selected = false
end

function GUIWidget:setVisible(visible)
  self.visible = visible
end

function GUIWidget:setSize(width, height)
  self.size.width = width
  self.size.height = height
end

function GUIWidget:setLine(size, r, g, b, a)
  self.line.width = size
  self.line.color.r = r
  self.line.color.g = g
  self.line.color.b = b
  self.line.color.a = a
end

function GUIWidget:setBackground(r,g,b,a)
  self.background.color.r = r
  self.background.color.g = g
  self.background.color.b = b
  self.background.color.a = a
end

function GUIWidget:getPosition()
  if self.parent then
    local x, y = self.parent:getPosition()
    x = x + self.pos.x
    y = y + self.pos.y
    
    return x,y
  else 
    return self.pos.x,self.pos.y
  end
end

function GUIWidget:setPosition(x, y)
  self.pos.x, self.pos.y = x, y
end

function GUIWidget:setSize(width, height)
  self.size.width, self.size.height = width, height
end

function GUIWidget:addWidget(widget)
  widget.parent = self
  self.container[widget.id] = widget
end

function GUIWidget:removeWidget(id)
  if self.container[id] then
    for i,v in pairs(self.container[id].container) do
      v:removeWidget(i, v)
    end
  
    self.container[id] = nil
    
    return true
  end
  
  for i,v in pairs(self.container) do
      if v:removeWidget(i) then
        return true
      end
  end
  
  return false
end

function GUIWidget:draw()
  if self.visible then
    love.graphics.setColor(self.background.r, self.background.g, self.background.b, self.background.a)
    love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.width, self.size.height)
    
    love.graphics.setColor(self.line.color.r, self.line.color.g, self.line.color.b, self.line.color.a)
    love.graphics.rectangle("line", self.pos.x, self.pos.y, self.size.width, self.size.height)
  end
  
  for i,v in pairs(self.container) do
    v:draw()
  end
end

function GUIWidget:update(dt)
  for i,v in pairs(self.container) do
    v:draw(dt)
  end
end

function GUIWidget:keypressed(key, unicode)
  for i,v in pairs(self.container) do
    v:keypressed(key, unicode)
  end
end

function GUIWidget:keyreleased(key, unicode)
  for i,v in pairs(self.container) do
    v:keyreleased(key, unicode)
  end
end

function GUIWidget:mousepressed(x, y, btn)
  for i,v in pairs(self.container) do
    v:mousepressed(x, y, btn)
  end
end

function GUIWidget:mousereleased(x, y, btn)
  for i,v in pairs(self.container) do
    v:mousereleased(x, y, btn)
  end
end