GUIInput = class("GUIInput", GUIWidget)

function GUIInput:initialize(id)
  super:initialize(self, id)
  self.text = ""
  self.caret = 1
  self.length = 32
  self.print = ""
end

function GUIInput:draw()
  super:draw()
  
  local x,y = self:getPosition()
  
  if self.visible then
    if #self.text > self.length then      
      local str = self.text:sub(-self.length)
      love.graphics.print(self.print, x, y)
      
    else 
      love.graphics.print(self.print, x, y)
    end
  end
end

function GUIInput:keypressed(key, unicode)
  if self.selected then
    if key == "backspace" then
      if #self.text > 0 and self.caret > 1 then
        self.text = self.text:sub(1, self.caret - 1) .. self.text:sub(self.caret + 1)
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
      if self.caret > #self.text then
        self.caret = #self.text
      end
    
    elseif u then
      self.text = self.text .. string.char(u)
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
     y > gy + self.size.width then
    self.selected = true
  else
    self.selected = false
  end
  
  
end