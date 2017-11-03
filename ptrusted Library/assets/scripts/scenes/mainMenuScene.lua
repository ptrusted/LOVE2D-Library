MainMenuScene = {}
    MainMenuScene.initialize = function ()
        -- ----------------------------------------------------- game objects
        -- use these codes to create a game object :
            -- MainMenuScene.gameObjects = {}
            -- MainMenuScene.gameObjects[1] = createGameObject(
            --     true,
            --     "name",
            --     YourImageObject,
            --     PositionX,
            --     PositionY,
            --     0,1,1,
            --     OffsetX,
            --     OffsetY
            -- )

        -- use these codes to create a sprite animation and assign it to game object :
            -- MainMenuScene.gameObjects[1].animation = false
            -- MainMenuScene.gameObjects[1].animator = createSpriteAnimator(MainMenuScene.gameObjects[1],0.05,false,AnimationImages,1,31,Sfx)
    end
    -- ---------------------------------------------------------------------------- main functions

    MainMenuScene.draw = function ()
        MainMenuScene.drawBackground()
        MainMenuScene.drawImages()
        MainMenuScene.drawUI()
    end

    MainMenuScene.update = function ()
        
    end

    MainMenuScene.listenerKeyPressed = function (key)
        if key == "escape" then
            love.event.quit()
        end
    end

    MainMenuScene.listenerMousePressed = function (x, y, button, istouch )
        
    end

    MainMenuScene.listenerMouseMoved = function (x, y, button, istouch )
    end

    MainMenuScene.listenerMouseReleased = function (x, y, button, istouch )
    end

    MainMenuScene.listenerTouchPressed = function (id, x, y, dx, dy, pressure)
        
    end

    MainMenuScene.listenerTouchReleased = function (id, x, y, dx, dy, pressure)

    end

    MainMenuScene.listenerTouchMoved = function (id, x, y, dx, dy, pressure)

    end

    -- ---------------------------------------------------------------------------- other functions

    MainMenuScene.drawBackground = function ()
        -- these line is just a demo.
        love.graphics.setColor( 255, 0, 241, 255)
        love.graphics.rectangle( "fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
        love.graphics.setColor( 255, 255, 255, 60)
        love.graphics.circle( "fill",
            love.graphics.getWidth()/2, love.graphics.getHeight()/2,
            math.abs(love.graphics.getWidth()/1.5*math.cos(10+love.timer.getTime()))
            )
        love.graphics.setColor( 218, 0, 205, 255)
        love.graphics.circle( "fill",
            love.graphics.getWidth()/2, love.graphics.getHeight()/2,
            math.abs(love.graphics.getWidth()/2*math.cos(2*love.timer.getTime()))
            )
        love.graphics.setColor( 238, 0, 223, 255)
        love.graphics.circle( "fill",
            love.graphics.getWidth()/2, love.graphics.getHeight()/2,
            math.abs(love.graphics.getWidth()/4*math.cos(love.timer.getTime()))
            )
        love.graphics.setColor( 255, 255, 255, 120)
        love.graphics.circle( "fill",
            0, 0,
            math.abs(love.graphics.getWidth()/2*math.cos(10+love.timer.getTime()))
            )
        love.graphics.circle( "fill",
            love.graphics.getWidth(), 0,
            math.abs(love.graphics.getWidth()/2*math.cos(love.timer.getTime()))
            )
        love.graphics.circle( "fill",
            0, love.graphics.getHeight(),
            math.abs(love.graphics.getWidth()/2*math.cos(love.timer.getTime()))
            )
        love.graphics.circle( "fill",
            love.graphics.getWidth(), love.graphics.getHeight(),
            math.abs(love.graphics.getWidth()/2*math.cos(10+love.timer.getTime()))
            )
    end

    MainMenuScene.drawImages = function ()
        love.graphics.setColor(255,255,255,255)
        if MainMenuScene.gameObjects then
            for a,b in ipairs(MainMenuScene.gameObjects) do
                if b.active then
                    love.graphics.draw(b.image, b.positionX ,b.positionY,b.rotation,b.scaleX,b.scaleY,b.offsetX,b.offsetY)
                    if b.animation and b.animator then
                        b.animator.updateAnimator()
                    end
                    if b.behaviour then
                        b.behaviour()
                    end
                end
            end
        end
    end

    MainMenuScene.drawUI = function ()
        -- these lines is just a demo.
        love.graphics.printf("Developed by ptrusted in 2017\n---------\nBig credits to LOVE2D.org, LUA.org", love.graphics.getWidth()/2, love.graphics.getHeight()/2, love.graphics.getWidth(),"center",0,1,1,love.graphics.getWidth()/2,100) -- text credit
    end