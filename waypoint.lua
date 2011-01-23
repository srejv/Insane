Waypoint = Class("Waypoint")
function Waypoint:initialize(aboslute, x, y, speed)
  self.absolute = absolute
  self.start = { x = 0, y = 0 }
  self.current = { x = 0, y = 0 }
  self.target = {}
  self.target.x = x
  self.target.y = y
  if not speed then
    self.speed = 32
  else
    self.speed = speed
  end
  self.time = 0
  self.done = false
  self.direction = "up" -- "up", "down", "left", "right"
end

function Waypoint:reset()
  self.done = false
  self.current.x = self.start.x
  self.current.y = self.start.y
  self.time = 0
end

function Waypoint:setStart(x, y)
  self.start.x = x
  self.start.y = y
  
  self.current.x = x
  self.current.y = y
  
  if self.start.x < self.target.x then
    self.direction = "right"
  elseif self.start.x > self.target.x then
    self.direction = "left"
  elseif self.start.y < self.target.y then
    self.direction = "down"
  elseif self.start.y > self.target.y then
    self.direction = "up"
  end
end

function Waypoint:update(dt)
  self.time = self.time + dt
  if self.absolute then
    if self.direction == "up" then
      self.current.y = self.start.y + math.min(self.target.y - self.start.y, self.time * self.speed)
    elseif self.direction == "down" then
      self.current.y = self.start.y - math.max(self.target.y - self.start.y, self.time * self.speed)
    elseif self.direction == "right" then
      self.current.x = self.start.x + math.min(self.target.x - self.start.x, self.time * self.speed)
    elseif self.direction == "left" then
      self.current.x = self.start.x - math.max(self.target.x - self.start.x, self.time * self.speed)
    end
  else
    if self.direction == "up" then
      self.current.y = self.start.y + math.min(self.target.y - self.start.y, self.time * self.speed)
    elseif self.direction == "down" then
      self.current.y = self.start.y - math.max(self.target.y - self.start.y, self.time * self.speed)
    elseif self.direction == "right" then
      self.current.x = self.start.x + math.min(self.target.x - self.start.x, self.time * self.speed)
    elseif self.direction == "left" then
      self.current.x = self.start.x - math.max(self.target.x - self.start.x, self.time * self.speed)
    end
  end
end

function Waypoint:getCurrent()
  return self.current.x, self.current.y
end