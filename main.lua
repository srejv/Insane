function love.load()
  require("ext/middleclass.init")
  require("guiwidget.lua")
  require("guilabel.lua")
  require("guiinput.lua")
  require("gui.lua")
  require("resourcemap.lua")
  require("sprite.lua")
  
  
  gui = GUI:new()
  local input = GUIInput:new("input")
  input:setVisible(true)
  input:setSize(256, 16)
  input:setPosition(100, 200)
  input:setBackground(255, 255, 255, 128)
  gui:addWidget(input)
  
  images = ResourceMap:new()
  sprites = ResourceMap:new()
  music = ResourceMap:new()
  sfx = ResourceMap:new()
end

function love.update(dt)
end

function love.draw()
  love.graphics.setLineStyle("rough")
  love.graphics.line(600,0,600,600)
  
  gui:draw()
  
end



function love.mousereleased(x, y, button)
end

function love.mousepressed(x, y, button)
  gui:mousepressed(x, y, button)
end

function love.keypressed(key, unicode)
  gui:keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
end

function love.focus(f)
end

function love.quit()
end

