--local anim = require 'anim8'
require("anim8")
local player = {
     imagem,
     animation,
     posX = 100,
    direcao = true
}
player.__index = player
--[[local imagem, animation, stop, imagem1
local posX = 100
local direcao = true]]
function player.load()
    player.imagem = love.graphics.newImage("imagens/player_run.png")
    local g = player.newGrid(world ,99, 98, player.imagem:getWidth(), player.imagem:getHeight())
    player.animation = player.newAnimation(g('1-10', 1),0.1)
    
    --[[imagem1 = love.graphics.newImage("imagens/player_stop.png")
    local h = anim.newGrid(99,98,imagem1:getWidth(),imagem1:getHeight())
    stop = anim.newAnimation(h('1-11', 1),0.1)]]
    
    
end

function player:update( dt )
    if love.keyboard.isDown('left') then
        player.posX = player.posX - 150 * dt
        player.direcao = false
        player.animation:update(dt)
    elseif love.keyboard.isDown('right') then
        player.posX = player.posX + 150 * dt
        player.direcao = true
        player.animation:update(dt)
    end   
end

function player:draw()
    love.graphics.setBackgroundColor(255,255,255,255)
    if direcao then
        player.animation:draw(player.imagem, player.posX, 50, 0, -0.5, 0.5, 49.5, 0 )
    elseif not direcao then
        player.animation:draw(player.imagem, player.posX, 50, 0, 0.5, 0.5, 49.5, 0 )
    end
end