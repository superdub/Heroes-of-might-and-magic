Menu = {}


--выход
local function Exit ()
love.event.quit();
end

local function Play ()
  Gamestate.switch(GameEditor);
end


GameLoser = false;
GameWin = false;


--создание экземпляров Buttons
local playBut = Buttons:new(love.graphics.getWidth()/2.3,love.graphics.getHeight()/2.5,"Play","Assets/MenuFont.ttf",40,Play,1,17)
local exitBut = Buttons:new(love.graphics.getWidth()/2.3,love.graphics.getHeight()/2,"Exit","Assets/MenuFont.ttf",40,Exit,1,17)

function Menu:draw()
  playBut:draw()
  exitBut:draw()
end



function Menu:update(dt)
  playBut:update(dt)
  exitBut:update(dt)
end



function Menu:mousepressed(x, y, button, isTouch)
  playBut:mousepressed(x,y)
  exitBut:mousepressed(x,y)
end



function Menu:mousereleased(x, y, button, isTouch)
  playBut:mousereleased(x,y)
  exitBut:mousereleased(x,y)
end


return Menu
