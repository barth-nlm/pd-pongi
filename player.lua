Player = {}

function Player:load()
  self.width = 20
  self.height = 100
  self.speed = 500
  self.x = 40
  self.y = windowSize.height / 2 - self.height / 2
end

function Player:update(dt)
  self:checkBoundaries()
  self:move(dt)
end

function Player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end



function Player:checkBoundaries()
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > windowSize.height then
    self.y = windowSize.height - self.height
  end
end

function Player:move(dt)
  if love.keyboard.isDown("w") then 
    self.y = self.y - self.speed * dt
  end
  if love.keyboard.isDown("s") then 
    self.y = self.y + self.speed * dt
  end
end

