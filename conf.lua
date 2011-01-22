function love.conf(t)
    t.title             = "Dunno"
    --This defines the folder it is stored in.
    t.identity          = "output"
    t.author            = "S-Rave"
    t.version           = 070
    t.console           = false
    t.screen.width      = 800
    t.screen.height     = 600
    t.screen.fullscreen = false
    t.screen.vsync      = true
    t.modules.joystick  = true
    t.modules.audio     = true
    t.modules.keyboard  = true
    t.modules.event     = true
    t.modules.image     = true
    t.modules.graphics  = true
    t.modules.timer     = true
    t.modules.mouse     = true
    t.modules.sound     = true
    t.modules.physics   = false
end