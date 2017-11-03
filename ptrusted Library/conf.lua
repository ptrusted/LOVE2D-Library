function love.conf(t)
    t.window.title = "Game Title"
    t.window.fullscreen = false
    t.window.fullscreentype = "exclusive"
    t.window.width = 480
    t.window.height = 800
    t.console = true
    t.modules.physics = false
    t.modules.touch = true
    love.filesystem.setIdentity("Game_Save_File")
end