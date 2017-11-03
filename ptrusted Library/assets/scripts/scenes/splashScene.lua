SplashScene = {}

    SplashScene.initialize = function()
    -- ------------------------------------------------------------------------
        -- use these codes to create a game object :
            -- SplashScene.gameObjects = {}
            -- SplashScene.gameObjects[1] = createGameObject(
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
            -- MainMenuScene.gameObjects[1].animator = createSpriteAnimator(SplashScene.gameObjects[1],0.05,false,AnimationImages,1,31,Sfx)
    -- ------------------------------------------------------------------------

        -- this is a LUA coroutine feature used to execute some sequenced operation.
        SplashScene.usingTimer = true
        SplashScene.sequenceExecution = coroutine.create(
            function ()
                print('ping !!!') -- operation 1
                coroutine.yield(2.5) -- delay in seconds
                changeScene(2) -- operation 2
            end
        )
    end

    -- ---------------------------------------------------------------------------- main functions

    SplashScene.draw = function()
        SplashScene.setBackground()
        SplashScene.drawImages()
    end

    SplashScene.update = function()
    end

    SplashScene.listenerKeyPressed = function (key)
    end

    SplashScene.listenerMousePressed = function (x, y, button, istouch )
    end

    SplashScene.listenerMouseMoved = function (x, y, button, istouch )
    end

    SplashScene.listenerMouseReleased = function (x, y, button, istouch )
    end

    SplashScene.listenerTouchPressed = function (id, x, y, dx, dy, pressure)
    end

    SplashScene.listenerTouchReleased = function (id, x, y, dx, dy, pressure)
    end

    SplashScene.listenerTouchMoved = function (id, x, y, dx, dy, pressure)
    end

    -- ---------------------------------------------------------------------------- other functions

    SplashScene.setBackground = function()
        love.graphics.setBackgroundColor( 255, 255, 255 )
    end

    SplashScene.drawImages = function ()
        if SplashScene.gameObjects then
            for a,b in ipairs(SplashScene.gameObjects) do
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