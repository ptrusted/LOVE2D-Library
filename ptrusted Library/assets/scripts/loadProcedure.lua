
function loadImages ( ... )
    -- load all your images here.

    -- use this code to load a single image : ImageTitle = love.graphics.newImage("assets/sprites/title.png")
    -- use this code to load animation images (all your images should be named 1.png, 2.png, etc...) : ImagesSplash = loadSpritesAnimImages('assets/sprites/splash/%d.png',1,31)
    
end

function loadSounds ( ... )
    -- load all your sounds here.

	-- use these codes to load a big sized sound :
        -- BgSoundMainMenu = love.audio.newSource('assets/sounds/main menu.mp3','stream')
        -- BgSoundMainMenu:setLooping(true)
        -- BgSoundMainMenu:setVolume(0.8)
    -- use these codes to load a small sized sound such as Sfx :
        -- SfxSelect = love.audio.newSource('assets/sounds/select.mp3','static')
        -- SfxSelect:setLooping(false)
        -- SfxSelect:setVolume(0.4)
end

function loadFonts ( ... )
    -- load all your fonts here.

    -- use this code to load a font : Font1 = love.graphics.newFont("assets/fonts/fontName.ttf",18)
end

function createGlobalVariables ()
    -- put all your scenes here.
    Scenes = {SplashScene, MainMenuScene}
    CounterSelectedScene = 1
    
    CounterTimer = 0
    GlobalTimeSpan = 0
    -- this variable based on your game resolution.
    ScreenScaleFactor = love.graphics.getHeight()/800

    -- these lines are optional, needed a further tweaking to use.
    -- Highscore = {}
    -- for i=1,2 do
    --     Highscore[i] = 0
    -- end

    -- loadSavedVariables()
end

-- ---------------------------------------------------------------------------- other functions

function loadSavedVariables ()
    -- if the file doesn't exist, we should create it first
    local exist = love.filesystem.exists('data.txt')
    --print(love.filesystem.getSaveDirectory() .. '/progress.txt')
    if exist then
        -- read it all the way and pass it to proper global variables
        local extractedData = extractDataFromFile ('data.txt','#_99_#') 
        compareExtractedDataWithGlobalVariable(Highscore,extractedData)
    else
        -- create file
        saveProgress()
    end
end

function loadSpritesAnimImages (nameFormat,startIndex,finishIndex)
    local theImages = {}
	for i=startIndex,finishIndex do
		theImages[i] = love.graphics.newImage(string.format(nameFormat,i))
	end

    return theImages
end

function saveProgress ()
    local FileToSave = love.filesystem.newFile('data.txt') 
    FileToSave:open('w')

    local dataToSave = ''
    for a,b in ipairs(Highscore) do
        dataToSave = dataToSave .. b .. '#_99_#'
    end

    FileToSave:write(dataToSave)
    FileToSave:close()
end

function extractDataFromFile (fileName,parser)
    local savedData = love.filesystem.read(fileName) -- we got the data
    local extractedData = {} -- this is where we store the extracted data
    local dataCounter = 1
    local startIndex,endIndex = string.find(savedData,parser) -- startIndex is where we begin the search until the parser found
    local tempIndex = 1 -- extra variable needed
    while startIndex do
        extractedData[dataCounter] = string.sub(savedData,tempIndex,startIndex-1)
        dataCounter = dataCounter + 1
        tempIndex = endIndex + 1
        startIndex,endIndex = string.find(savedData,parser,tempIndex)
    end
    
    return extractedData
end

function compareExtractedDataWithGlobalVariable (globalVariable,extractedData)
    if #globalVariable == #extractedData then
        for i=1,#globalVariable do
            globalVariable[i] = tonumber(extractedData[i])
        end
        return true
    else
        for i=1,#globalVariable do
            globalVariable[i] = 0
        end
        return false
    end
end