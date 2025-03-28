local item, super = Class(HealItem, "banana")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Banana"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n100HP"
    -- Shop description
    self.shop = "Healthy\nsnack\nheals 100HP"
    -- Menu description
    self.description = "A shiny yellow banana, grown in the amazing\nCyber Fields. +100HP"

    -- Amount healed (HealItem variable)
    self.heal_amount = 100
    -- Amount this item heals for specific characters in the overworld (optional)
    self.world_heal_amounts = {
        ["susie"] = 40
    }

    -- Default shop price (sell price is halved)
    self.price = 100
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "Ew, what the hell is this?!",
        ralsei = "A nice healthy snack to start the day!",
        noelle = "U-uh, sure..?",
		dess = "OOOOOOH, BANANA",
		noel = "AHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHHAHAHAHAHAHAHAHAHAHAHAHAHA", -- I have no idea what was going trough my mind at this point in time but instead of changing it im going to leave it as is and write this long sentence because I am feeling a bit overwhelmed right now somehow and i want to procrastonate on adding the other reactions at the moment (the dess reactions charbomber made (in the desshere dlc(that charbomber made(not noel(i made noel)))))
		jamm = {
            jamm = "Gotta cut it up so I don't look gay...",
            brenda = "What?? Huh???",
            dess = "> implying there's something wrong with looking gay" -- /j please don't kill me Jamm
        },
        ["jamm+marcy"] = "It's good for you, Marcy!",
        ceroba = "Haven't had one of these in a while...",
        brenda = "Would be better if it was a bit more ripe.",
    }
end

return item