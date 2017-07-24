Buttons = {}


function Buttons:new(x,y,text,font,size,func,height,width)
local public = {}

public.x = x ;
public.y = y;
public.text = text;
public.func = func;
public.click = false;
public.navodka = false;
public.height = height;
public.font = font;
public.size = size;
public.width = width;


function public:draw()
if public.navodka then
love.graphics.setColor(255, 255, 255, 255)
else love.graphics.setColor(255, 255, 255, 100)
end
if self.font ~= nil then
love.graphics.setFont(love.graphics.newFont(self.font, self.size))
end
love.graphics.print(public.text, public.x, public.y,0,public.height,public.height)
end

function public:update(dt)
local x,y = love.mouse.getPosition()
if x < public.x + #self.text*public.width*public.height and x > public.x and y < public.y + public.height*self.size and y > public.y then
public.navodka = true
else
public.navodka = false;
end
end

function public:mousepressed(x,y)
 if x < public.x + #self.text*public.width*public.height and x > public.x and y < public.y + public.height*self.size and y > public.y then
   if self.func ~= nil then
 public.func();
 end
 self.click = true;
 end
end

function public:mousereleased(x,y)
self.click = false;
end

setmetatable(public,self);
self.__index = self;
return public
end







return Buttons
