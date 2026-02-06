--[[ this line [ package.path = package.path .. ";../?.lua" ] is here just because osgui.lua is in directory above test,
     if it is in the same directory as main.lua then you can use just this

            require("ogui-lib")
]]

package.path = package.path .. ";../?.lua"
require("Ogui-lib")

local cardHold = Frame.new({0.5, 0.5, 0.5, 1})
cardHold:add(Text.new("insert card", 1, {0, 0, 0, 1}))

local card = Frame.new({0, 0, 1, 1})
card:add(Void.new(60, 25, nil)) -- Void object sets width and height (it's just a rectangle)

local isCard = false
local doorColor = {0.2, 0.2, 0.2, 1}

local function cardExtension()
    if card:isHovered() and love.mouse.isDown(1) then
        local mx, my = love.mouse.getPosition()

        card:draw(mx-5, my-5) -- IMPORTANT: if your function has :draw() in it it has to be in love.draw()

        if mx >= 300 and mx <= 500 and my >= 100 and my <= 500 then
            isCard = true
        end
    else
        if isCard then
            return true -- every extension returns its function value (here:false)
        end
        card:draw(0, 0)
    end
end

function love.load()
    love.window.setTitle("Interesting use cases")
end

function love.draw()
    -- door
    love.graphics.setColor(doorColor)
    love.graphics.rectangle("fill", 300, 100, 200, 400)

    if cardHold then -- if you're going to delete this object you should always give it an if statement
        cardHold:draw(350, 200) -- you can use objects as elements of the environment
    end

    if card:extend(cardExtension) then
        doorColor = {0, 0, 1, 1}
        if cardHold and cardHold:destroy() then cardHold = nil end
    end
end