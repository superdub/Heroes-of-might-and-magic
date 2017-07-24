
Map = {}


function Map:new(w,h,sizeW,sizeH)
local public = {}

--размеры поля
public.w = w;
public.h = h;

--размеры клетки
public.sizeW = sizeW;
public.sizeH = sizeH;

--массив клеток
public.mas = {}

--поле строк и столбцов
public.rows = public.w / public.sizeW;
public.lines = public.h/ public.sizeH -1;



--заполнение массива
for i=1,public.rows do
  for j=1,public.lines do
      local rect = { }
      rect.x = -public.sizeW + i*public.sizeW;
      rect.y = -public.sizeH + j*public.sizeH;
      table.insert(public.mas,rect);
  end
end



function public:draw()
-- отрисовка фона поля(игрок,ИИ)
love.graphics.setColor(100, 255, 100, 200);
love.graphics.rectangle("fill", 0, 0, self.rows * self.sizeW * 0.5 , love.graphics.getHeight());
love.graphics.setColor(100, 100, 255, 200);
love.graphics.rectangle("fill", self.rows * self.sizeW * 0.5, 0, self.rows * self.sizeW * 0.5, love.graphics.getHeight());

-- отрисовка клеток
for i,v in ipairs(self.mas) do
  love.graphics.setColor(255, 255, 255, 255);
  love.graphics.rectangle("line",v.x,v.y, self.sizeW, self.sizeH)
end

end




setmetatable(public,self);
self.__index = self;
return public
end












return Map
