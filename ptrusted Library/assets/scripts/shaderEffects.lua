function loadShaderEffects()
    DefaultShader = love.graphics.getShader() -- save the default shader, to be used later 

    ShaderEffects = {} -- table contains all made shaders
    -- --------------------------------------------------------------------------------------------------------------------------------------------
            -- ------------------------------------------------------------
            -- shader number 1, hide the area around player's touching position
            ShaderEffects[1] = {}
            ShaderEffects[1].theScript = love.graphics.newShader [[
                uniform number time;
                uniform vec2 pos;
                vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
                {
                    float distanceToPos = length(abs(pixel_coords-pos)); // calculate the distance between player's touching position and fragment's coordinate.
                    float radius_ = (120.0+abs(sin(time*2.0)*20.0));  // the sin calculation added a grow and shrink animation.

                    if( distanceToPos > radius_) { // if the distance from touching position is above 120, it will be turn grey.
                        return vec4(cos(2.0*time),sin(2.0*time),cos(time+10.0),1.0);
                    } else { // otherwise, it will be colored normally.
                        return color * texture2D(texture,texture_coords);
                    }
                }
            ]]
            ShaderEffects[1].update = function () -- sending the parameter value to shader code, called every frame
                ShaderEffects[CurrentShaderEffect].theScript:send("time",GlobalTimeSpan)
            end

            -- ------------------------------------------------------------
            -- shader number 2, gives a glitch effect
            ShaderEffects[2] = {}
            ShaderEffects[2].theScript = love.graphics.newShader [[
                uniform vec2 randomValue;
                vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
                {
                    // it returns the fragment of neighbours and added a random color based on random value given every frame.
                    return color * texture2D(texture,vec2(texture_coords.x+randomValue.x,texture_coords.y+randomValue.y)) *
                        vec4(randomValue.x,randomValue.y,randomValue.x,abs(randomValue.y));
                }
            ]]
            ShaderEffects[2].update = function () -- sending the parameter value of random integer to shader code, called every frame
                local x,y = math.random(-1,1),math.random(-1,1)
                ShaderEffects[CurrentShaderEffect].theScript:send("randomValue",{x,y})
            end

    -- --------------------------------------------------------------------------------------------------------------------------------------------

    CurrentShaderEffect = 0
    -- -----------------------------------------------------------------
end