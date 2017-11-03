-- ############
-- # ptrusted #
-- ############

require "assets/scripts/animator"
require "assets/scripts/objectCreation"
require "assets/scripts/loadProcedure"
require "assets/scripts/shaderEffects"

-- all your scene scripts should be required here
require "assets/scripts/scenes/splashScene"
require "assets/scripts/scenes/mainMenuScene"


-- ---------------------------------------------------------------------------- main functions

function love.load ()
    loadImages()
    loadSounds()
    loadFonts()
    createGlobalVariables()
    loadShaderEffects()
    initializeScene(1)
end

function love.draw ()
    shaderEffectSwitcher()
    Scenes[CounterSelectedScene].draw()
end

function love.update (dt)
    Scenes[CounterSelectedScene].update()
    globalTimeSpan(dt)
    timerCountDown()
end

function love.keypressed (key)
    Scenes[CounterSelectedScene].listenerKeyPressed(key)
end

function love.mousepressed (x, y, button, istouch )
    Scenes[CounterSelectedScene].listenerMousePressed(x, y, button, istouch )
end

function love.mousemoved ( x, y, dx, dy, istouch )
    Scenes[CounterSelectedScene].listenerMouseMoved(x, y, button, istouch )
end

function love.mousereleased (x, y, button, istouch)
    Scenes[CounterSelectedScene].listenerMouseReleased(x, y, button, istouch )
end

function love.touchpressed (id, x, y, dx, dy, pressure)
    Scenes[CounterSelectedScene].listenerTouchPressed(id, x, y, dx, dy, pressure)
end

function love.touchreleased (id, x, y, dx, dy, pressure)
    Scenes[CounterSelectedScene].listenerTouchReleased(id, x, y, dx, dy, pressure)
end

function love.touchmoved (id, x, y, dx, dy, pressure)
    Scenes[CounterSelectedScene].listenerTouchMoved(id, x, y, dx, dy, pressure)
end

-- ---------------------------------------------------------------------------- other functions

function initializeScene (index)
    if index==0 then
        Scenes[CounterSelectedScene].initialize() -- bug solved
    else
        for i=1,#Scenes do
            Scenes[i].initialize() -- bug solved
        end
    end
end

function changeScene (index)
    CounterSelectedScene = index
    initializeScene(0) -- bug solved
end

function shaderEffectSwitcher ()
    if CurrentShaderEffect > 0 then
        love.graphics.setShader(ShaderEffects[CurrentShaderEffect].theScript)
        if not ShaderEffects[CurrentShaderEffect].update == false then
            ShaderEffects[CurrentShaderEffect].update()
        end
    else
        love.graphics.setShader(DefaultShader)
    end
end

function globalTimeSpan (dt)
    GlobalTimeSpan = GlobalTimeSpan + dt
end

function timerCountDown ()
    if Scenes[CounterSelectedScene].usingTimer and Scenes[CounterSelectedScene].usingTimer ~= nil then
        if CounterTimer ~= nil then
            if CounterTimer<0 then
                local status,newTimerCounterValue = coroutine.resume(Scenes[CounterSelectedScene].sequenceExecution)
                if status then
                    CounterTimer = newTimerCounterValue
                else
                    CounterTimer = 0
                end
            else
                CounterTimer = CounterTimer - love.timer.getDelta()
            end
        else
            CounterTimer = 0
        end
    end
end