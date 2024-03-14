PlayerAI = Class{}

function PlayerAI:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = 100
end

function PlayerAI:update (dt)
    local distance = math.abs(ball.y - self.y)
    if distance < self.speed *dt then
        self.y = ball.y
    elseif ball.y < self.y then
        self.y = self.y - self.speed *dt
    else
        self.y = self.y + self.speed *dt 
    end
    --clamping
    self.y = math.min(self.y, VIRTUAL_HEIGHT - self.height)
    self.y = math.max(self.y,0)
end


function PlayerAI:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end