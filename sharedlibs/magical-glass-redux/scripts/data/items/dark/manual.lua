local item, super = Class("manual", true)

function item:getLightBattleText(user, target)
    if Game.battle.encounter.onManualUse then
        return Game.battle.encounter:onManualUse(self, user)
    end
    return "* "..user.chara:getNameOrYou().." read the "..self:getUseName()..".[wait:10]\n* But nothing happened."
end

return item