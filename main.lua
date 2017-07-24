
Buttons =               require "lib/Buttons"
Gamestate   =         require "lib/gamestate"
Map =                   require "objects.map"
Heroes =               require "objects.hero"
Process =       require "objects/processGame"
II =                     require "objects/II"
UnitsViews =      require "objects/unitsView"
GameOver =      require "gamestates/gameOver"
GameEditor =  require "gamestates/gameEditor"
Menu =              require "gamestates/menu"


function love.load()
  math.randomseed(os.time())
  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end
