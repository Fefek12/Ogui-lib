--[[ this line [ package.path = package.path .. ";../?.lua" ] is here just because Ogui.lua is in directory above test,
     if it is in the same directory as main.lua then you can use just this

            require("Ogui-lib")
]]

package.path = package.path .. ";../?.lua"
require("Ogui-lib")

local gui = Ogui.new({0, 0, 0, 1}) -- basic form that automatically scales
gui:add(Text.new("This is simple text", 2, {1, 1, 1, 1})) -- you can insert any object here not only the Text
gui:add(Text.new("You can choose any color or scale and it will be scaled correctly!", 1, {1, 1, 1, 1}))

local text = Text.new("If you don't want to use text with the form object you don't have to!", 1, {0, 0, 0, 1})

function love.load()
    love.window.setTitle("Creating simple GUI")
end

function love.draw()
    love.graphics.setBackgroundColor({1, 1, 1, 1})

    gui:draw(0,0) -- use this to draw gui to the screen on x:0 and y:0
    text:draw(150,300) -- same applies for the text x:150, y:300
end