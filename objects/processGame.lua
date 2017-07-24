Process = {}




function Process:new(pole,heroes)
local public = {}
public.pole = pole;
public.heroes = heroes;

function public:update(dt)

 --проверка на удаление
 for i,v in ipairs(self.heroes.mas) do
     if v.health < 0 then
       table.remove(self.heroes.mas,i);
     end
 end


  if heroes.FlagGame or  GAMEII then



      --проверка на победу
  local countPlayers,countEnemies = 0,0;
  local countAttack  = 0;
  for i,v in ipairs(self.heroes.mas) do
     if v.attack == false then
       countAttack = countAttack + 1 ;
     end
    if v.player then
     countPlayers = countPlayers + 1;
   elseif not v.player then
      countEnemies = countEnemies + 1;
   end
    end

  if countEnemies == 0 then
   print("Win"); Gamestate.switch(GameOver);
   GameWin = true;
   fonMusic:stop();
 elseif countPlayers == 0 then
  print("Loser"); Gamestate.switch(GameOver);
  GameLoser = true;
  fonMusic:stop();
  end
  countPlayers = 0;
  countEnemies = 0;
end



end



function public:mousepressed(x,y,button,isTouch)

if heroes.FlagGame and not GAMEII then



--светлеет по выбору(клику)
for i,v in ipairs(self.heroes.mas) do
  if x > v.x  and x < v.x + v.w and y > v.y and y < v.y + v.h and v.player then
   v.control = true;
   v.color = v.ChangeColor;
   for j,g in ipairs(self.heroes.mas) do
     if j ~= i then
      g.control = false;
     end
   end
  end
end



--    ход юнита
for k,v in pairs(self.heroes.mas) do
  if v .player then
if x > v.x  and x < v.x + v.w and y > v.y and y < v.y + v.h  then else
if  v.control == true and v.player == true and v.xod == true   then
  local flagEnemy = false;
  for i,v in ipairs(self.heroes.mas) do
     if v.player == false and x > v.x  and x < v.x + v.w and y > v.y and y < v.y + v.h then
       flagEnemy = true;
     end
  end
  for j,g in ipairs(self.pole.mas) do
             if x > g.x  and x < g.x + v.w and y > g.y and y < g.y + v.h and not flagEnemy then
               if math.sqrt(math.pow(x - (v.x + v.w/2),2) + math.pow(y - (v.y + v.h/2),2)) <= v.dist/2 then
                    if v.player == false and x > v.x  and x < v.x + v.w and y > v.y and y < v.y + v.h then else
                  v.x = g.x;
                  v.y = g.y;
                  v.xod = false;
                end
            end
          end
         end
      end
   end
end
end

--вывод в консль
print("\n")
for i,v in ipairs(self.heroes.mas) do
  if math.sqrt(math.pow(x - (v.x + v.w/2),2) + math.pow(y - (v.y + v.h/2),2)) <= v.w then
print("number: "..i," damage: "..v.damage," health: "..v.health," dist: "..v.dist)
end
end




--  атака юнита
for i,v in ipairs(self.heroes.mas) do
  if v.player then
  local flagEnemy = false;
  local enemyX,enemyY;
  local indexAttack;
  local indexEnemy;
  for f,d in ipairs(self.heroes.mas) do
     if d.player == false and x > d.x  and x < d.x + d.w and y > d.y and y < d.y + d.h then
       flagEnemy = true;
       enemyX = d.x;
       enemyY = d.y;
       indexEnemy = f;
     end
  end
   if flagEnemy then
     local dist = math.sqrt(math.pow(v.x + v.w/2 - enemyX + v.w/2,2) + math.pow(v.y + v.h/2 - enemyY + v.h/2,2));
     if dist < 96 then
         indexAttack = i;
     end
      for j,g in ipairs(self.heroes.mas) do
         if g.control and j == indexAttack and g.attack then
           self.heroes.mas[indexEnemy].health = self.heroes.mas[indexEnemy].health -  self.heroes.mas[indexAttack].damage;
           self.heroes.mas[j].attack = false;
         end
      end
   end
end
end



end
end


function public:mousereleased(x,y)



end

function public:draw()




end




setmetatable(public,self);
self.__index = self;
return public
end





return Process
