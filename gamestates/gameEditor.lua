GameEditor = {}



fonMusic = love.audio.newSource("Assets/the_spirit.mp3")



math.random(os.time())

local width,height = love.graphics.getWidth(),love.graphics.getHeight()

GAMEII = false;

local map = Map:new(width,height,32,32);

local unitsViews = UnitsViews:new(5);

local heroes = Heroes:new(unitsViews,map);

local process = Process:new(map,heroes);

local ii = II:new(heroes,map);


local function Play ()

heroes.FlagGame = true;
fonMusic:setLooping(true)
fonMusic:play();
end

local function Exit()
  if heroes.FlagGame then
GameLoser = true;
Gamestate.switch(GameOver);
end
end

local function NextXod ()
  if not GAMEII and heroes.FlagGame then

for i,v in ipairs(heroes.mas) do
   v.xodX,v.xodY,v.xod,v.attack = true,true,true,true;
end

 GAMEII = true;
 end
end



local butGame = Buttons:new(unitsViews.mas[unitsViews.count].x + love.graphics.getWidth() * 0.15, map.lines * map.sizeH- map.sizeH/2,"Play","Assets/GameFont.ttf",40,Play,1,17)
local butExit = Buttons:new(unitsViews.mas[unitsViews.count].x + love.graphics.getWidth() * 0.24, map.lines * map.sizeH- map.sizeH/2,"Capitulate","Assets/GameFont.ttf",40,Exit,1,17)
local butII = Buttons:new(unitsViews.mas[unitsViews.count].x + love.graphics.getWidth() * 0.41, map.lines * map.sizeH - map.sizeH/2,"Next move","Assets/GameFont.ttf",40,NextXod,1,17)


local playImg = {
  image =  love.graphics.newImage("Assets/play.png"),
  x = width * 0.35,
  y = -height * 0.9
}




--обновление игры
function GameEditor:update(dt)

if GameWin or GameLoser then
fonMusic:stop();
end

butGame:update(dt);

butExit:update(dt);

butII:update(dt);

process:update(dt);

ii:update(dt);

heroes:update(dt);

if love.keyboard.isDown("r") then
love.event.quit("restart")
end

if playImg and heroes.FlagGame then
playImg.y = playImg.y + 700*dt;
if playImg.y > height * 1.5 then
playImg = nil
end
end

end




--отрисовка игры
function GameEditor:draw()
map:draw();

unitsViews:draw();

heroes:draw();

butGame:draw();

butExit:draw();

butII:draw();

process:draw();

ii:draw();

if playImg ~= nil then
love.graphics.setColor(255, 255, 255, 255)
love.graphics.draw(playImg.image,playImg.x ,playImg.y, 0, 0.5, 0.5)
end

end



function GameEditor:mousepressed (x, y, button, isTouch)


heroes:mousepressed(x,y);

unitsViews:mousepressed(x,y);

process:mousepressed(x,y);

butGame:mousepressed(x,y)

butExit:mousepressed(x,y)

butII:mousepressed(x,y);

ii:mousepressed(x,y);



end


function GameEditor:mousereleased(x, y, button, isTouch)

butGame:mousereleased(x,y);

butExit:mousereleased(x,y);

process:mousereleased(x,y);

butII:mousereleased(x,y);

end


return GameEditor
