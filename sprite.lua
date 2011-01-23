Sprite = class("Sprite")
function Sprite:initialize(imageId)
  self.pos = { x = 0, y = 0 }
  self.image = imageId
  self.quad = nil
  self.rotation = 0
  self.scale = { x = 1, y = 1 }
  self.center = { x = 0, y = 0 }
  self.width = 0
  self.height = 0
  self.tint = { r = 255, g = 255, b = 255, a = 255 }
end

function Sprite:collisionDetectRect(x1,y1,w1,h1)
  local x2 = self.pos.x
  local y2 = self.pos.y
  local h2 = self.size.height
  local w2 = self.size.width
  
  if (y2 >= y1 and y1 + h1 >= y2) or (y2 + h2 >= y1 and y1 + h1 >= y2 + h2) or (y1 >= y2 and y2 + h2 >= y1) or (y1 + h1 >= y2 and y2 + h2 >= y1 + h1) then
    if x2 >= x1 and x1 + w1 >= x2 then 
      return true
    end
    if x2 + w2 >= x1 and x1 + w1 >= x2 + w2 then
      return true
    end
    if x1 >= x2 and x2 + w2 >= x1 then
      return true
    end
    if x1 + w1 >= x2 and x2 + w2 >= x1 + w1 then
      return true
    end
  end
  return false
end

function Sprite:collisionDetectPoint(x,y)
  if x >= self.pos.x and x <= self.pos.x + self.size.width and y >= self.pos.y and y <= self.pos.y + self.size.height then
    return true
  end
  
  return false
end

function Sprite:setTint(r,g,b,a)
  self.tint.r = r
  self.tint.g = g
  self.tint.b = b
  self.tint.a = a
end

function Sprite:setImage(w, h)
  local img = images:get(self.image)
  self.width = img:getWidth()
  self.height = img:getHeight()
  self.quad = love.graphics.newQuad(0, 0, self.width, self.height, self.width, self.height)
end

function Sprite:draw()
  local img = images:get(self.image)
  love.graphics.setColor(self.tint.r, self.tint.g, self.tint.b, self.tint.a)
  love.graphics.drawq(img, self.quad, math.floor(self.pos.x + self.center.x), math.floor(self.pos.y + self.center.y), self.rotation, self.scale.x, self.scale.y)
  love.graphics.setColor(255,255,255,255)
end

function Sprite:setPosition(x, y)
  self.pos.x = x
  self.pos.y = y
end

function Sprite:setCenter(x, y)
  self.center.x = x
  self.center.y = y
end

function Sprite:setRotation(angle)
  self.rotation = angle
end

function Sprite:setScale(x, y)
  self.scale.x = x
  self.scale.y = y
end

function Sprite:resize(width, height)

  -- We don't want to divide by zero hehu
  if self.width > 0 and self.height > 0 then
    self.scale.x = width / self.width
    self.scale.y = height / self.height
  end
end

-- Relative movement
function Sprite:Scale(x, y)
  self.scale.x = self.scale.x + x
  self.scale.y = self.scale.y + y
end

function Sprite:Rotate(angle) -- radians
  self.rotation = self.rotation + angle
end

function Sprite:move(x, y)
  self.pos.x = self.pos.x + x
  self.pos.y = self.pos.y + y
end

function Sprite:destroy()
  self.image = nil
  self.quad = nil
  self.pos = nil
  self.image = nil
  self.quad = nil
  self.rotation = nil
  self.scale = nil
  self.center = nil
  self.width = nil
  self.height = nil
  self.tint = nil
end