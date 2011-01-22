function love.load()
  require("ext/middleclass.init")
  require("guiwidget.lua")
  require("guilabel.lua")
  require("guiinput.lua")
  require("gui.lua")
end

function love.update(dt)
end

function love.draw()
  love.graphics.setLineStyle("rough")
  love.graphics.line(600,0,600,600)
  
  
  
  
end



function love.mousereleased(x, y, button)
end

function love.mousepressed(x, y, button)
end

function love.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
end

function love.focus(f)
end

function love.quit()
end

