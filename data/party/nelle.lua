local character, super = Class(PartyMember, "nelle")

function character:init()
    super.init(self)

    self.name = "Nelle"

    self:setActor("kris") -- Placeholder
    self:setLightActor("kris_lw") -- Placeholder
    self:setDarkTransitionActor("kris_dark_transition") -- Placeholder

    self.love = 1
    self.level = self.love
    self.title = "Dark Mage\nHas unnatural\nmagical abilities."

    self.soul_priority = 1
    self.soul_color = {1, 1, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "N-Action"

    self:addSpell("heal_prayer") -- Placeholder

    self.health = 130

    self.stats = {
        health = 130,
        attack = 3,
        defense = 2,
        magic = 5
    }

    self.max_stats = {}

    self.weapon_icon = "ui/menu/equip/wand"

    self:setWeapon("beginners_wand")
    self:setArmor(1, "amber_card") -- Placeholder
    self:setArmor(2, "amber_card") -- Placeholder

    self.lw_weapon_default = "light/pencil" -- Placeholder
    self.lw_armor_default = "light/bandage" -- Placeholder

    self.color = {22/255, 0, 40/255}
    self.dmg_color = {22/255, 0, 40/255} -- Placeholder
    self.attack_bar_color = {22/255, 0, 40/255} -- Placeholder
    self.attack_box_color = {0, 0, 40/255} -- Placeholder
    self.xact_color = {22/255, 0, 40/255} -- Placeholder

    self.icon_color = {22/255, 0, 40/255}

    self.menu_icon = "party/kris/head" -- Placeholder
    self.head_icons = "party/kris/icon" -- Placeholder
    self.name_sprite = "party/nelle/name"

    self.attack_sprite = "effects/attack/cut" -- Placeholder
    self.attack_sound = "laz_c" -- Placeholder
    self.attack_pitch = 1

    self.battle_offset = {0, 0}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = {
        "It's not time\nto go yet...!",
        "We gotta\ntry again..."
    }
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:onLevelUpLVLib(level)
    self:increaseStat("health", 10)
    self:increaseStat("attack", 1)
    self:increaseStat("defense", 1)
    self:increaseStat("magic", 2)
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/shy")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Notmuchtosay", x, y, 0, 0.7, 1)
        love.graphics.print("Yes", x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/cool")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Original", x, y)
        love.graphics.print("No", x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        return true
    end
end

return character