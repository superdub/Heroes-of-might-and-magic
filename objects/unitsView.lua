UnitsViews = {}

unitsView = {}

function unitsView:new(x,color,attack,health,dist)
local public = {}


public.x = x;
public.y = love.graphics.getHeight() * 0.95;

public.w = love.graphics.getWidth() * 0.1;
public.h = love.graphics.getHeight()/7;

--2 главные составляющие UnitsViews
public.color = color;
public.click = false;


--for unit
public.attack = attack;
public.health = health;
public.dist = dist;


function public:draw()
  --отрисовка views
love.graphics.setColor(self.color[1], self.color[2], self.color[3],200);
love.graphics.rectangle("fill",self.x, self.y, self.w, self.h);

--сам update(движение)
if self.click and self.y >  love.graphics.getHeight() * 0.94  then
 self.y = self.y - 20;
elseif not self.click and self.y < love.graphics.getHeight() * 0.95 then
 self.y = self.y + 20;
end

end




function public:mousepressed(x,y,objects)
if x < self.x + self.w and x > self.x and y < self.y + self.h and y > self.y then
 self.click = true;
   for i,v in pairs(objects) do
      if v.color ~= self.color then
      v.click = false;
      end
   end
end
end



setmetatable(public,self);
self.__index = self;
return public
end




function UnitsViews:new(count)
local public = {}
math.random(os.time())
public.mas = {};
public.count = count;
public.dist = love.graphics.getWidth()/public.count;
  print("unitsViews\n")
for i=1,public.count do
  local colorC = math.random(1,100)/10
  local colorA = math.random(1,100)/10
  local colorB = math.random(1,100)/10
  local health = math.random(50,100);
  local dist = math.random(100,500);
  local attack = math.random(50,100);
  public.mas[i] = unitsView:new( - love.graphics.getWidth() * 0.1 + i *  love.graphics.getWidth() * 0.1 ,{255 / colorA * 3,255 / colorC,255 / (colorB*5)},attack,health,dist )
  print("number: "..i," attack: "..attack," health: "..health," dist: "..dist)
end

public.mas[1].click = true;

function public:draw()
  for i,v in pairs(self.mas) do
    v:draw();
  end
end


function public:mousepressed(x,y)
  for i,v in pairs(self.mas) do
    v:mousepressed(x,y,self.mas);
  end
end



setmetatable(public,self);
self.__index = self;
return public
end




return UnitsViews
