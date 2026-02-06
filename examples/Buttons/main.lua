--[[ this line [ package.path = package.path .. ";../?.lua" ] is here just because osgui.lua is in directory above test,
     if it is in the same directory as main.lua then you can use just this

            require("ogui-lib")
]]

package.path = package.path .. ";../?.lua"
require("Ogui-lib")

local bg = {0, 0, 0, 1}

local button = Frame.new({1, 0, 1, 1}) -- yes you can make a button from our simple form
button:add(Text.new("simple button", 2, {1, 1, 1, 1,})) -- give our button a text

function love.load()
    love.window.setTitle("Buttons")
end

function love.draw()
    love.graphics.setBackgroundColor(bg)
    button:draw(0,0)
end

function love.update(dt)
    button:extend(function () -- you can extend the normal form by giving it a function!
        if button:isHovered() and love.mouse.isDown(1) then
            bg = {1, 1, 1, 1}
    	end
    end)
end
