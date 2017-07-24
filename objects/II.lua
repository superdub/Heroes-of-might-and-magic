II = {}



function II:new(heroes,pole)
local public = {}

public.heroes = heroes;
public.pole = pole;

function public:update(dt)
if GAMEII then


--экстренный выход
if love.keyboard.isDown("z") then
GAMEII = false;
end

--устранение бага
for i,v in ipairs(self.heroes.mas) do
      if not v.player then
          for j,g in ipairs(self.heroes.mas) do
             if g.player then
                if v.x == g.x and v.y == g.y then
                  if v.attack then
                  g.health = g.health - v.damage;
                  end
                  if v.xodX then
                  v.x = v.x + v.w;
                elseif v.xodY then
                  v.y = v.y + v.h;
                else
                    g.health = g.health - v.damage;
                end
                end
             end
          end
      end
end




--проверка на удаление
for i,v in ipairs(self.heroes.mas) do
     if v.health < 0 then
        table.remove(self.heroes.mas, i);
     end
end



--создание полей для ии
for i,v in ipairs(self.heroes.mas) do
     if  v.player then
       v.zoneII = false;
     end
end





--обнаружение противника
 for i,v in ipairs(self.heroes.mas) do
       if not v.player then
             -- бег по своим
           for j,g in ipairs(self.heroes.mas) do
              --цикл по всем
                 if g.player then
                   --бег по противнику
                     local dist = math.sqrt(math.pow(g.x + g.w/2 - v.x + v.w/2,2) + math.pow(g.y + g.h/2 - v.y + v.h/2,2));
                         --проверка на зону атаки
                         if dist < v.w * 2.5 then
                             g.zoneII = true;
                         end
                end
           end
       end
 end



 --атака по противнику
 for i,v in ipairs(self.heroes.mas) do
     if not v.player then
        --бег по своим
         for j,g in ipairs(self.heroes.mas) do
           --бег по врагам
              if g.player then
                   if g.zoneII and v.attack and g.x ~= nil and g.health > 0  then
                      g.health = g.health - v.damage;
                      v.attack = false;
                   end
              end
         end
     end
 end





--движение
    for i,v in ipairs(self.heroes.mas) do
        if not v.player then
            --бег по своим
             for j,g in ipairs(self.heroes.mas) do
                --бег оп врагам
                if g.player then
                local dists = {}
                 for f,d in ipairs(self.heroes.mas) do
                    if d.player then
                         local dist =  math.sqrt(math.pow(v.x + v.w/2 - (d.x + d.w/2),2) + math.pow(v.y + v.h - (d.y + d.h/2),2));
                         table.insert(dists,dist);
                    end
                 end
                     local max = 100000000;
                     local indexMax;
                   for i=1,#dists do
                      if dists[i] < max then
                         max = dists[i];
                         indexMax = i;
                      end
                   end

                if g.player and math.sqrt(math.pow(v.x + v.w/2 - (g.x + g.w/2),2) + math.pow(v.y + v.h - (g.y + g.h/2),2))  == max  then
                  table.remove(dists, indexMax);
                  if v.x > g.x and v.x < g.x + g.w and v.y > g.y and v.y < g.y + g.h and v.x > 0 or v.x > love.graphics.getWidth() and v.y< 0 and v.y < love.graphics.getHeight() then else

                    v.attackII = true;
                    g.defenseII = true;
                    if g.x < v.x and v.xodX  then
                        v.x = v.x - v.w * v.countXod;
                        v.xodX = false;
                    elseif g.x > v.x and v.xodX then
                           v.x = v.x + v.w * v.countXod;
                           v.xodX = false;
                    end
                  end
                     if g.y == v.y then
                        v.y = v.y + v.h;
                     end
                     if g.x == v.x then
                        v.x = v.x + v.w;
                     end
                    if g.y < v.y and v.xodY then
                      v.y = v.y - v.h * v.countXod;
                      v.xodY = false;
                    elseif g.y > v.y and v.xodY then
                      v.y = v.y + v.h * v.countXod;
                      v.xodY = false;
                    end
                end
             end
        end
    end
end



--конец хода
for i,v in ipairs(self.heroes.mas) do
    if not v.player then
        if not v.xodX and v.xodY or not v.xodX and v.xodY and not v.attack or not v.xodX or not v.xodY then
          GAMEII = false;
        end
    end
end


end
end

function public:draw()
if GAMEII then

end
end

function public:mousepressed(x,y)
if GAMEII then

end
end

setmetatable(public,self);
self.__index = self;
return public
end







return II
