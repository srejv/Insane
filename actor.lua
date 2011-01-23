Actor = Class("Actor"):include(Stateful)
function Actor:initialize()
  self.waypoints = { }
end


function Actor:setPosition()
end

function Actor:draw()
end

function Actor:update(dt)
end

function Actor:keypressed(key, unicode)
end

function Actor:keyreleased(key, unicode)
end

function Actor:mousepressed(x, y, btn)
end

function Actor:mousereleased(x, y, btn)
end