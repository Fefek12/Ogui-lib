--[[ this line [ package.path = package.path .. ";../?.lua" ] is here just because osgui.lua is in directory above test,
     if it is in the same directory as main.lua then you can use just this

            require("ogui-lib")
]]

package.path = package.path .. ";../?.lua"
require("Ogui-lib")

local function hover()
    local mx, my = love.mouse.getPosition()

    local m = math.sqrt((mx - x) ^ 2 + (my - y) ^ 2)

    local ui = Frame.new({0.2, 0.2, 0.2, 1})
    ui:add(Text.new("BALL", 3, {1, 1, 1, 1}))
    ui:add(Text.new("just a white ball", 1, {1, 1, 1, 1}))

    if m < r then
        ui:draw(mx, my)
        return
    end

    if ui:destroy() then ui = nil end
end

function love.load()
    x = love.graphics.getWidth() / 2
    y = love.graphics.getHeight() / 2
    r = 100
    BallColor = {1,1,1,1}
    btn = Frame.new({1, 0, 0, 1})
    btn:add(Text.new("just a button!", 2, {0, 0, 0, 1}))
end

function love.update(dt)
    if btn:isHovered() then
        love.graphics.setBackgroundColor({0, 0, 1, 1})
    else
        love.graphics.setBackgroundColor({0,0,0,1})
    end
    btn:extend(function ()
        print(btn:isHovered())
    end)
end

function love.draw()
    love.graphics.setColor(BallColor)
    love.graphics.circle("fill", x, y, r)
    btn:draw(0, 0)
    hover()
end
