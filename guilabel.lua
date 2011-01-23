GUILabel = class("GUILabel", GUIWidget)
function GUILabel:initialize(id, text)
  super.initialize(self, id)
  self.text = text
end

function GUILabel:draw()
  super.draw(self)
  
  love.graphics.print(text, self.pos.x, self.pos.y)
end