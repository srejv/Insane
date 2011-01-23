GUIInput = class("GUIInput", GUIWidget)

function GUIInput:initialize(id)
  super.initialize(self, id)
  self.text = ""
  self.caret = 1
  self.length = 32
  self.print = ""
  self.textColor = { r = 0, g = 0, b = 0, a = 255 }
end

function GUIInput:draw()
  
  --super.draw(self)
  
  local x,y = self:getPosition()
  love.graphics.print("Input drawing " .. x .. " " .. y .. " " .. self.size.width .. " " .. self.size.height, 0, 568)
  
  if self.visible then
    
    love.graphics.setColor(255, 255, 255, 128)
    love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.width, self.size.height)
    
    love.graphics.setColor(128, 128, 128, 128)
    love.graphics.rectangle("line", self.pos.x, self.pos.y, self.size.width, self.size.height)
    
    love.graphics.setColor(self.textColor.r, self.textColor.g, self.textColor.b, self.textColor.a)
    
    if #self.text > self.length then      
      local str = self.text:sub(-self.length)
      love.graphics.print(str, x, y)
    else 
      love.graphics.print(self.print, x, y)
    end
    
    love.graphics.setColor(255,255,255,255)
  end
  
  if self.selected then
    love.graphics.print("Selected " .. self.caret, 0, 552)
  end
end

function GUIInput:keypressed(key, unicode)
  if self.selected then
  
    if key == "backspace" then
      if #self.text > 0 and self.caret == #self.text + 1 then
        self.text = self.text:sub(1, -2)
        self.caret = self.caret - 1
      elseif #self.text > 0 and self.caret > 1 then
        self.text = self.text:sub(1, self.caret - 2) .. self.text:sub(self.caret)
        self.caret = self.caret - 1
      end
      
      
    elseif key == "delete" then
      if #self.text > 0 and self.caret ~= #self.text then
        self.text = self.text:sub(1, self.caret) .. self.text:sub(self.caret + 2)
      end
    elseif key == "left" then
      self.caret = self.caret - 1
      if self.caret < 1 then
        self.caret = 1
      end
    elseif key == "right" then
      self.caret = self.caret + 1
      if self.caret > #self.text + 1 then
        self.caret = #self.text + 1
      end
    elseif key == "lshift" or key == "rshift" or key == "rctrl" or key == "lctrl" then
    elseif unicode then
      self.text = self.text .. string.char(unicode)
      self.caret = self.caret + 1
      
    end
    
    self.print = self.text:sub(1, self.caret - 1) .. "|" .. self.text:sub(self.caret)
  end
end

function GUIInput:mousepressed(x,y,btn)
  local gx,gy = self:getPosition()
  
  if x > gx and
     x < gx + self.size.width and
     y > gy and
     y < gy + self.size.height then
    self.selected = true
  else
    self.selected = false
  end
  
  
end