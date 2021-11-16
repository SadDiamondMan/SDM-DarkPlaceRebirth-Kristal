local ModButton, super = Class(Object)

function ModButton:init(name, width, height, mod)
    super:init(self, 0, 0, width, height)

    self.name = name
    self.mod = mod
    self.id = mod and mod.id or name

    self.subtitle = mod and mod.subtitle

    self.icon = mod and mod.icon or {Assets.getTexture("kristal/mod_icon")}
    self.icon_delay = mod and mod.iconDelay or 0.25
    self.icon_frame = 1

    self.selected = false

    -- temporary
    self.font = Assets.getFont("main")
    self.subfont = Assets.getFont("main", 16)
end

function ModButton:setName(name)
    self.name = name
end

function ModButton:setSubtitle(subtitle)
    self.subtitle = subtitle
end

function ModButton:onSelect()
    self.selected = true
    if self.preview_script and self.preview_script.onSelect then
        self.preview_script:onSelect(self)
    end
end

function ModButton:onDeselect()
    self.selected = false
    if self.preview_script and self.preview_script.onDeselect then
        self.preview_script:onDeselect(self)
    end
end

function ModButton:getDrawColor()
    local r, g, b, a = super:getDrawColor(self)
    if not self.selected then
        return r * 0.6, g * 0.6, b * 0.7, a
    else
        return r, g, b, a
    end
end

function ModButton:getHeartPos()
    return 29, self.height / 2
end

function ModButton:getIconPos()
    return self.width + 8, 0
end

function ModButton:drawCoolRectangle(x, y, w, h)
    -- Make sure the line is a single pixel wide
    love.graphics.setLineWidth(1)
    love.graphics.setLineStyle("rough")
    -- Set the color
    love.graphics.setColor(self:getDrawColor())
    -- Draw the rectangles
    love.graphics.rectangle("line", x, y, w + 1, h + 1)
    -- Increase the width and height by one instead of two to produce the broken effect
    love.graphics.rectangle("line", x - 1, y - 1, w + 2, h + 2)
    love.graphics.rectangle("line", x - 2, y - 2, w + 5, h + 5)
    -- Here too
    love.graphics.rectangle("line", x - 3, y - 3, w + 6, h + 6)
end

function ModButton:update(dt)
    if self.selected then
        self.icon_frame = self.icon_frame + (dt / math.max(1/60, self.icon_delay))
        if math.floor(self.icon_frame) > #self.icon then
            self.icon_frame = 1
        end
    else
        self.icon_frame = 1
    end

    super:update(self, dt)
end

function ModButton:draw()
    -- Get the position for the mod icon
    local ix, iy = self:getIconPos()

    -- Draw the transparent backgrounds
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle("fill", 0, 0, self.width, self.height)
    -- Draw the icon background
    love.graphics.rectangle("fill", ix, iy, self.height, self.height)

    -- Draw the rectangle outlines
    self:drawCoolRectangle(0, 0, self.width, self.height)
    self:drawCoolRectangle(ix, iy, self.height, self.height)

    -- Draw text inside the button rectangle
    Draw.pushScissor()
    Draw.scissor(0, 0, self.width, self.height)
    local subh = self.subtitle and self.subfont:getHeight() or 0
    -- Make name position higher if we have a subtitle
    local name_y = math.floor((self.height/2 - self.font:getHeight()/2) / 2) * 2 - (subh/2)
    love.graphics.setFont(self.font)
    -- Draw the name shadow
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(self.name, 50 + 2, name_y + 2)
    -- Draw the name
    love.graphics.setColor(self:getDrawColor())
    love.graphics.print(self.name, 50, name_y)
    if self.subtitle then
        love.graphics.setFont(self.subfont)
        -- Draw the subtitle shadow
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(self.subtitle, 50 + 2, name_y + self.font:getHeight() + 2)
        -- Draw the subtitle
        love.graphics.setColor(self:getDrawColor())
        love.graphics.print(self.subtitle, 50, name_y + self.font:getHeight())
    end
    Draw.popScissor()

    -- Draw icon
    local icon = self.icon[math.floor(self.icon_frame)]
    if icon then
        local x, y = ix + self.height/2 - icon:getWidth(), iy + self.height/2 - icon:getHeight()
        -- Draw the icon shadow
        love.graphics.setColor(0, 0, 0)
        love.graphics.draw(icon, x + 2, y + 2, 0, 2, 2)
        -- Draw the icon
        love.graphics.setColor(self:getDrawColor())
        love.graphics.draw(icon, x, y, 0, 2, 2)
    end
end

return ModButton