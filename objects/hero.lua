
Heroes = {}

Hero = {}



function Hero:new(w,h,mas,pole)
local public = {}

--ширина и высота
public.w = w;
public.h = h;

--сторона юнита
public.player = 0;


public.damage = 0;
public.dist = 0;
public.health = 0;
public.control = false;
public.xod = true;
public.attack = true;
public.xodX = true;
public.xodY = true;
public.attackII = false;
public.defenseII = false;

--координаты
public.x = x;
public.y = y;

public.circleXod = {r = 0,x = nil,y = nil}
public.circleAttack = {r = 0,x = nil,y = nil}

public.countXod = 0 ;

--массив поля
public.pole = pole;

--цветова палитра
for k,v in pairs(mas) do
  if v.click then
  public.color = v.color;
  public.ChangeColor = {v.color[1],v.color[2],v.color[3],255}
  public.dist = v.dist;
  public.health = v.health;
  public.damage = v.attack;
  public.circleXod.r = public.dist/2
  public.circleAttack = 64/2;
   if public.circleXod.r >0 and public.circleXod.r < 170 then
       public.countXod = 1;
    elseif public.circleXod.r >170 and public.circleXod.r < 240 then
      public.countXod = 2;
    elseif  public.circleXod.r >240 and public.circleXod.r < 310 then
      public.countXod = 3;
    elseif public.circleXod.r >310 and public.circleXod.r < 370 then
      public.countXod = 4;
    elseif public.circleXod.r >370 and public.circleXod.r < 440 then
      public.countXod = 5;
    elseif public.circleXod.r >440 and public.circleXod.r < 510 then
      public.countXod = 6;
    elseif public.circleXod.r >510 and public.circleXod.r < 600 then
      public.countXod = 7;
   end
  end
end


function public:mousepressed(x,y,mas)


if y < love.graphics.getHeight()*0.92 then




for i,v in ipairs(mas) do
if x > v.x  and x < v.x + self.w and y > v.y and y < v.y + self.h   then
  self.x = v.x;
  self.y = v.y;
  self.circleXod.x = v.x
  self.circleXod.y = v.y;
  if self.x < self.pole.rows * self.pole.sizeW * 0.5 then
  self.player = true;
  else
  self.player = false;
  end

end
end
end
end

function public:draw()
  if self.x and self.y then
    if self.control  then
      love.graphics.setColor(255, 255, 255, 100)
      love.graphics.circle("fill", self.x + self.w/2, self.y + self.h/2 , self.circleXod.r)
  love.graphics.setColor(self.color[1], self.color[2], self.color[3],255)
    else
  love.graphics.setColor(self.color[1], self.color[2], self.color[3],200)
end
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)

   if self.attack and not self.player then
      love.graphics.setColor(0, 255, 0, 50)
      love.graphics.circle("fill", self.x + self.w/2, self.y + self.h/2, 96/2)
   end

end
end

function public:update(dt)
  for i,v in ipairs(self.mas) do
      if v.health < 0 then
       table.remove(self.mas, i)
      end
  end
end


setmetatable(public,self);
self.__index = self;
return public
end




function Heroes:new(unitsViews,pole)
local public = {}

public.w = pole.sizeW;
public.h = pole.sizeH;
public.unitsViews = unitsViews;
public.pole = pole;
public.mas = {}
public.FlagGame = false


function public:mousepressed(x,y)
  if not self.FlagGame then
  local hero = Hero:new(self.w,self.h,self.unitsViews.mas,self.pole);
  hero:mousepressed(x,y,self.pole.mas);
   for i,v in ipairs(self.mas) do
      for k,g in pairs(self.unitsViews.mas) do
        if v.x == hero.x and v.y == hero.y then
          if g.click  then
            if g.color == v.color then
           table.remove(self.mas, i)
            else
              for i=1,#self.mas do
                local child = self.mas[i];
                if child ~= nil then
                if child.x == hero.x and child.y == hero.y then
                  table.remove(self.mas, i)
                end
              end
              end

            end
         end
        end
      end
   end
  table.insert(self.mas,hero)
  for i,v in pairs(self.mas) do
     if v.player == 0 then
        table.remove(self.mas, i)
     end
  end
end
end


function public:draw ()
  for i,v in pairs(self.mas) do
  v:draw();
  end
end

function public:update (dt)

end




setmetatable(public,self);
self.__index = self;
return public
end


return Heroes
