GameOver = {}


local function Exit ()
  love.event.quit();
end




local butExit  = Buttons:new(love.graphics.getWidth()/2.3,love.graphics.getHeight()/2,"Exit","Assets/MenuFont.ttf",40,Exit,1,17)




function GameOver:draw()
love.graphics.setColor(255, 255, 255, 255)
if GameLoser then
love.graphics.print("You Loser",love.graphics.getWidth()/2.3,love.graphics.getHeight()/2.5)
elseif GameWin then
love.graphics.print("You Win",love.graphics.getWidth()/2.3,love.graphics.getHeight()/2.5)
end

butExit:draw();
end


function GameOver:update(dt)
butExit:update(dt);
end


function GameOver:mousepressed(x, y, button, isTouch)
butExit:mousepressed(x,y);
end


function GameOver:mousereleased(x, y, button, isTouch)
butExit:mousereleased(x,y);
end












return GameOver
