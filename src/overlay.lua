local overlay = {}

function overlay.setLoading(val)
    overlay.loading = val
end

function overlay:init()
    self.quit_frames = {
        love.graphics.newImage("assets/sprites/ui/quit_0.png"),
        love.graphics.newImage("assets/sprites/ui/quit_1.png"),
        love.graphics.newImage("assets/sprites/ui/quit_2.png"),
        love.graphics.newImage("assets/sprites/ui/quit_3.png"),
        love.graphics.newImage("assets/sprites/ui/quit_4.png"),
    }
    self.load_frames = {
        love.graphics.newImage("assets/sprites/ui/loading_0.png"),
        love.graphics.newImage("assets/sprites/ui/loading_1.png"),
        love.graphics.newImage("assets/sprites/ui/loading_2.png"),
        love.graphics.newImage("assets/sprites/ui/loading_3.png"),
        love.graphics.newImage("assets/sprites/ui/loading_4.png"),
    }

    self.quit_alpha = 0
    self.load_alpha = 0

    self.quit_timer = 0
    self.load_timer = 0

    self.loading = false

    self.quit_release = false
end

function overlay:update(dt)
    if self.loading then
        if self.load_alpha < 1 then
            self.load_alpha = math.min(1, self.load_alpha + dt / 0.25)
        end
        self.load_timer = self.load_timer + dt
    else
        if self.load_alpha > 0 then
            self.load_alpha = math.max(0, self.load_alpha - dt / 0.25)
        end
        self.load_timer = 0
    end

    if love.keyboard.isDown("escape") and not self.quit_release then
        if self.quit_alpha < 1 then
            self.quit_alpha = math.min(1, self.quit_alpha + dt / 0.75)
        end
        self.quit_timer = self.quit_timer + dt
        if self.quit_timer > 1.2 then
            if MOD ~= nil then
                kristal.states.switch(kristal.states.loading)
                self.quit_release = true
            else
                love.event.quit()
            end
        end
    else
        if self.quit_alpha > 0 then
            self.quit_alpha = math.max(0, self.quit_alpha - dt / 0.25)
        end
    end

    if self.quit_release and not love.keyboard.isDown("escape") then
        self.quit_release = false
    end
end

function overlay:draw()
    -- Draw the quit text
    love.graphics.push()
    love.graphics.scale(2)
    love.graphics.setColor(1, 1, 1, self.quit_alpha)
    local quit_frame = (math.floor(self.quit_timer / 0.25) % #self.quit_frames) + 1
    love.graphics.draw(self.quit_frames[quit_frame])
    love.graphics.pop()

    -- Draw the load text
    love.graphics.push()
    love.graphics.translate(0, love.graphics.getHeight())
    love.graphics.scale(2)
    love.graphics.setColor(1, 1, 1, self.load_alpha)
    local load_frame = (math.floor(self.load_timer / 0.25) % #self.load_frames) + 1
    local load_texture = self.load_frames[load_frame]
    love.graphics.draw(load_texture, 0, -load_texture:getHeight())
    love.graphics.pop()

    -- Reset the color
    love.graphics.setColor(1, 1, 1, 1)
end

return overlay