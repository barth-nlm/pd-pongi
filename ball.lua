Ball = {}

function Ball:load()
  self.width = 20
  self.height = 20
  self.speed = 200
  self.x = windowSize.width / 2 - self.width / 2
  self.y = windowSize.height / 2 - self.height / 2
  self.xVel = -self.speed
  self.yVel = 0
end

function Ball:update(dt)
  self:move(dt)
  self:collide()
end

function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end



function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end

function Ball:collide()
  if checkCollision(self, Player) then
    local middleBall = self.y + self.height / 2
    local middlePlayer = Player.y + Player.height / 2
    local collisionPosition = middleBall - middlePlayer
    self.xVel = self.speed
    self.yVel = collisionPosition * 5
  end
  
  if checkCollision(self, AI) then
    local middleBall = self.y + self.height / 2
    local middleAI = AI.y + AI.height / 2
    local collisionPosition = middleBall - middleAI
    self.xVel = -self.speed
    self.yVel = collisionPosition * 5
  end

  self:checkXBoundaries()
  self:checkYBoundaries()
end

function Ball:checkXBoundaries()
  if self.x < 0 then
    self.x = windowSize.width / 2 - self.width / 2
    self.y = windowSize.height / 2 - self.height / 2
    self.xVel = self.speed
    self.yVel = 0
  end
  if self.x + self.width > windowSize.width then
    self.x = windowSize.width / 2 - self.width / 2
    self.y = windowSize.height / 2 - self.height / 2
    self.xVel = -self.speed
    self.yVel = 0
  end
end

function Ball:checkYBoundaries()
  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y + self.height > windowSize.height then
    self.y = windowSize.height - self.height
    self.yVel = -self.yVel
  end
end