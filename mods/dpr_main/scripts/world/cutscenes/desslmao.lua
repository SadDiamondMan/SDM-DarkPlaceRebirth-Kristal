return {
	dessbegin = function(cutscene)
		local dess = cutscene:getCharacter("dess")
		local susie = cutscene:getCharacter("susie")
		local noel_here
		if cutscene:getCharacter("noel") then
			noel_here = 1
		end

		cutscene:showNametag("Dess Holiday?")
		if #Game.party == 1 then
			cutscene:textTagged("* Yooo hey it's great to see you again", "condescending", "dess")
		else
			cutscene:textTagged("* Yooo hey it's great to see you guys again", "condescending", "dess")
		end
		cutscene:setSpeaker("dess")
		cutscene:textTagged("* its me,[wait:5] dess,[wait:5] from hit kristal mod dark place", "heckyeah", "dess")
        if susie then
            cutscene:setSpeaker("susie")
			cutscene:textTagged("[speed:0.5]* ...", "neutral_side", "susie")
			cutscene:textTagged("* I have literally never seen you before in my life.", "annoyed", "susie")
		elseif cutscene:getCharacter("hero") then
			cutscene:setSpeaker("hero")
            cutscene:textTagged("* Uh,[wait:5] am I supposed to know you?")
		else
			cutscene:textTagged("[speed:0.5]* ...", "heckyeah", "dess")
			cutscene:textTagged("* hey why are you looking at me like that", "eyebrow", "dess")
        end
		cutscene:setSpeaker("dess")
		cutscene:textTagged("* aw c'mon don't tell me you guys forgot about me", "neutral", "dess")
		local remembered = false
		if cutscene:getCharacter("noel") then
			cutscene:setSpeaker("noel")
			cutscene:textTagged("* I remember you[wait:1][react:1]", "neutral", "noel",
			{
				reactions={
					{"'re [color:red]Dessimation\nRoutes[color:reset].", "right", "bottom", "neutral", "noel"}
				}
			})
			remembered = true
		end
		if remembered then
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* ayyy finally someone remembers me", "condescending", "dess")
			cutscene:textTagged("* anyways", "calm_b", "dess")
		end
		cutscene:textTagged("* I've been training in the hyperbolic time chamber for 20 years", "condescending", "dess")
		cutscene:textTagged("* got a whole entire attack point out of it", "heckyeah", "dess")
		cutscene:textTagged("* you could call me pretty strong now", "challenging", "dess")
		cutscene:textTagged("* a side effect tho is that i lost all of my character development", "genuine", "dess")
		cutscene:textTagged("* cause this is a reboot babyyyyy", "challenging", "dess")
		if susie then
            cutscene:setSpeaker("susie")
			cutscene:textTagged("[speed:0.5]* ...", "nervous_side", "susie")
			cutscene:textTagged("* I have no idea what anything you just said meant.", "nervous", "susie")
			cutscene:setSpeaker("dess")
		end
		cutscene:textTagged("* Oh yeah can I join your team btw", "neutral", "dess")

		cutscene:hideNametag()
		cutscene:textTagged("* (Can she join your team btw?)")
		local can_she_join_your_team_btw = cutscene:choicer({"Yes", "No"})

		cutscene:setSpeaker("dess")
		if can_she_join_your_team_btw == 1 then
			cutscene:textTagged("* sick", "condescending")
		else
			cutscene:textTagged("* Uhhh I don't care im joining anyways", "condescending")
		end
		cutscene:hideNametag()

		Game.world.music:stop()
		local fan = Music("fanfare", 1, 0.9, false)

		local leader = cutscene:getCharacter(Game.party[1].id)

		cutscene:detachFollowers()
		leader:slideTo(leader.x-50, leader.y, 2, "out-cubic")

		cutscene:walkTo("dess", dess.x - 50, dess.y + 10, 11, "left")
		cutscene:setSpeaker()
		cutscene:text("[noskip][voice:none][speed:0.1]* (Dess joined the party!)[wait:70]\n\n[speed:1](Unfortunately)", {auto = true})
		fan:remove()
		Game.world.music:resume()

		cutscene:setSpeaker("dess")
		cutscene:textTagged("* Ok follow me guys", "heckyeah", "dess")
		if susie then
            cutscene:setSpeaker("susie")
			susie:setSprite("shock_right")
			cutscene:textTagged("* Wh-", "shock", "susie")
			susie:setSprite("exasperated_right")
			cutscene:textTagged("* THAT'S NOT HOW THIS WORKS!", "teeth_b", "susie")
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* uhhhh idc", "condescending", "dess")
			cutscene:textTagged("* just be happy i didnt smack the party leader with my bat this time", "condescending", "dess")
			cutscene:setSpeaker("susie")
			cutscene:textTagged("* I-", "teeth", "susie")
			cutscene:hideNametag()
			susie:setSprite("walk_unhappy/right_1")
			susie:shake(5)
			Assets.stopAndPlaySound("wing")
			cutscene:wait(1)
			cutscene:setSpeaker("susie")
			cutscene:textTagged("* Ughhh,[wait:5] do I have much of a choice?", "annoyed", "susie")
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* mmmmnope", "smug", "dess")
			cutscene:textTagged("* hey if it makes you feel any better", "calm", "dess")
			cutscene:textTagged("* i'll MAYBE give the leader's position back at the end of this", "condescending", "dess")
			cutscene:textTagged("* MAYBE", "calm_b", "dess")
			cutscene:setSpeaker("susie")
			cutscene:textTagged("* ...[wait:10] Fine,[wait:5] lead the way.", "annoyed_down", "susie")
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* awesome sauce", "challenging", "dess")
		elseif cutscene:getCharacter("hero") then
			cutscene:setSpeaker("hero")
            cutscene:textTagged("* Wait what.")
		end
		cutscene:hideNametag()
		cutscene:wait(cutscene:fadeOut(1))
		cutscene:wait(1)

		-- Wooo party setup time
		Game:addPartyMember("dess", 1)
		if #Game.party == 4 then
			Game.world:spawnFollower(Game.party[4].id)
			Game:addFollower(Game.party[4].id)
			Game:removePartyMember(Game.party[4].id)
		end
		for i, v in ipairs(Game.world.followers) do
			if i ~= 3 then
				v:setActor(Game.party[i+1]:getActor())
			end
		end
		local fullparty = false
		if #Game.world.followers == 3 then
			fullparty = true
		end
		Game.world.player:setActor(Game.party[1]:getActor())
		dess:remove()
		leader = Game.world.player
		cutscene:wait(cutscene:slideTo(leader, 300, 750, 0.1))
		leader:setFacing("up")
		cutscene:attachCamera()
		cutscene:wait(cutscene:attachFollowers())
		for i, v in ipairs(Game.world.followers) do
			v.x = 300
			v.y = 750 + (i*50)
			v:setFacing("up")
		end
		cutscene:interpolateFollowers()
		cutscene:wait(0.5)

		cutscene:wait(cutscene:fadeIn(1))

		if fullparty then
			--[[if susie then
				-- I'll write dialogue for this later
			else
				cutscene:setSpeaker("dess")
				cutscene:textTagged("* oh yeah btw you can only have 3 party members at once", "heckyeah", "dess")
				cutscene:textTagged("* they had to nerf that shit", "heckyeah", "dess")
				cutscene:textTagged("* smth about it being too overpowered", "heckyeah", "dess")
				cutscene:textTagged("* anyways lets go", "heckyeah", "dess")
			end]]
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* oh yeah btw you can only have 3 party members at once", "neutral", "dess")
			cutscene:textTagged("* they had to nerf that shit from last time", "angry", "dess")
			cutscene:textTagged("* smth about it being too overpowered", "neutral_b", "dess")
			cutscene:textTagged("* anyways lets go", "heckyeah", "dess")
		else
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* ok lets go", "heckyeah", "dess")
		end
		cutscene:hideNametag()

        --Kristal.callEvent("completeAchievement", "starstruck") -- Uncomment this when we've added achievements
		Game:setFlag("gotDess", true)
		Game:unlockPartyMember("dess")

		local susie_party = Game:getPartyMember("susie")
        if cutscene:getCharacter("susie") then
            susie_party:addOpinion("dess", -10)
        end
  end,

	dessgetoverhere = function(cutscene, event)
		if Game:getFlag("gotDess") then
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* Hey I can do a crazy impression watch this", "condescending", "dess")
			cutscene:textTagged("* Look at meeee I'm FRISK from UNDERTALE lmao", "calm", "dess")

            if cutscene:getCharacter("susie") then
                cutscene:setSpeaker("susie")
                cutscene:textTagged("[speed:0.5]* ...", "nervous_side", "susie")
                cutscene:textTagged("* (Who the hell is THAT?)", "nervous", "susie")
            end
			cutscene:hideNametag()
			Game:setFlag("dessThingy", true)
			event:remove()
		else
			local leader = Game.world.player
			
			cutscene:showNametag("???")
			cutscene:textTagged("* Hey fucker you need to come talk to me first", "neutral", "dess")
			
			cutscene:hideNametag()
            leader.y = leader.y + 12
		end
	end,

	dessboss = function(cutscene)
		local boss = cutscene:getCharacter("ufoofdoom", 1)

		local susie = cutscene:getCharacter("susie")
		local leader = Game.world.player

		cutscene:detachFollowers()
		cutscene:detachCamera()

        for i,party in ipairs (Game.world.followers) do
            cutscene:walkTo(cutscene:getCharacter(party.actor.id), leader.x, leader.y+20*i, 1, "up")
        end

        if susie then
            cutscene:setSpeaker("susie")
            cutscene:textTagged("* Ugh,[wait:10] alright,[wait:5] is this the last one?!", "angry", "susie")

            cutscene:setSpeaker("dess")
            cutscene:textTagged("* Yep", "neutral", "dess")

            cutscene:setSpeaker("susie")
            cutscene:textTagged("* Alright...[wait:10] let's finally get outta here.", "annoyed_down", "susie")
        else
            cutscene:setSpeaker("dess")
            cutscene:textTagged("* This area is very well designed i'm so glad i have it all to myself", "condescending", "dess")
        end
		cutscene:hideNametag()

		cutscene:wait(1)
		boss:shake(8, 0)
		Assets.stopAndPlaySound("wing")
		cutscene:wait(2)

        if susie then
            cutscene:setSpeaker("susie")
            cutscene:textTagged("* Did you just see that??", "surprise_frown", "susie")
            cutscene:textTagged("* Why did it just shake?", "shy_b", "susie")
            cutscene:setSpeaker("dess")
            cutscene:textTagged("* That's normal, all the other ones shake if you hit them", "neutral", "dess")
        else
            cutscene:setSpeaker("dess")
            cutscene:textTagged("* ...", "kind", "dess")
        end

		boss:shake(8, 0)
		Assets.stopAndPlaySound("wing")

        if susie then
            cutscene:setSpeaker("susie")
            cutscene:textTagged("* But...[wait:10] we didn't hit it!", "shock_down", "susie")
        else
            cutscene:textTagged("* ...", "neutral", "dess")
        end

		boss:shake(16, 0)
		Assets.stopAndPlaySound("wing")

		cutscene:setSpeaker("dess")
        if susie then
            cutscene:textTagged("* Yo wait you're right!", "wtf_b")
        else
            cutscene:textTagged("* Oh shit!", "wtf_b")
        end
		boss:shake(8, 0)
		Assets.stopAndPlaySound("wing")

		cutscene:showNametag("???")
		cutscene:textTagged("* Hee...")
		boss:shake(16, 0)
		Assets.stopAndPlaySound("wing")
		cutscene:textTagged("* Uheeheehee!!")
		cutscene:hideNametag()

		boss:fadeTo(0, 0.1, function() boss:fadeTo(1, 0.05) end)
		cutscene:panTo(boss.x, boss.y+256, 2)
		boss:slideTo(boss.x, boss.y+256, 2, "in-out-quint")

		cutscene:wait(0.8)

        for i,party in ipairs (Game.world.followers) do
            cutscene:look(cutscene:getCharacter(party.actor.id), "down")
        end
        cutscene:look(leader, "down")
        
		cutscene:wait(1.2)
		cutscene:showNametag("???")
		cutscene:textTagged("* I'm sorry![wait:10]\n* I simply couldn't contain myself!")
		cutscene:textTagged("* Uheehee!")
		cutscene:hideNametag()

        if susie then
            cutscene:setSpeaker("susie")
            cutscene:textTagged("* Who the hell are you?!", "angry", "susie")
        end

		boss:fadeTo(0.2, 0.05)
		cutscene:wait(1)
		boss:setActor("susie")
		cutscene:look(boss, "up")
		boss:fadeTo(1, 0.05)
		cutscene:wait(1)
        cutscene:showNametag("???")
        if susie then
            cutscene:textTagged("[face:susie_bangs/smile_b][voice:susie]* I'm you!")

            cutscene:setSpeaker("susie")
            cutscene:textTagged("* Wha-?![wait:10] What the hell??", "surprise_frown", "susie")
        else
            cutscene:textTagged("[face:susie_bangs/smile_b][voice:susie]* LOOK at me![wait:10] I'm the Angry Dino Girl!")
        end

		cutscene:hideNametag()

		boss:fadeTo(0.2, 0.05)
		cutscene:wait(1)
		boss:setActor("kris")
		cutscene:look(boss, "up")
		boss:fadeTo(1, 0.05)
		cutscene:wait(1)
		cutscene:showNametag("???")

        if susie then
            cutscene:textTagged("* SUSIE LOOK![wait:5]\n* IT'S ME[wait:5] [color:yellow]KRIS[color:reset]!")
        else
            cutscene:textTagged("* AND NOW I'm the blue one!")
        end
		cutscene:textTagged("* Uheeheehee!")
		cutscene:hideNametag()

		boss:fadeTo(0.2, 0.05)
		cutscene:wait(1)
		boss:setActor("ufoofdoom")
		boss:fadeTo(1, 0.05)
		cutscene:setSpeaker("dess")
		cutscene:textTagged("* Whatever can we fight now", "condescending", "dess")

		cutscene:setSpeaker(boss)
		cutscene:textTagged("* ...OH![wait:10] I see!")
		cutscene:textTagged("* ...Uheehee!")
		cutscene:textTagged("* You're even worse than me! Uhee!")

        if susie then
            cutscene:setSpeaker("susie")
            cutscene:textTagged("* Uhh,[wait:10] what do they mean by that?", "nervous", "susie")

			cutscene:setSpeaker(boss)
            cutscene:textTagged("* Uheehee![wait:10] You're much better!")
        end
		cutscene:setSpeaker(boss)
		cutscene:textTagged("* It's too easy to be who you want to be!")
		cutscene:textTagged("* I know that is not the real Dess Holiday!")

        if susie then
            cutscene:textTagged("* Huh???", "surprise_frown", "susie")

            cutscene:setSpeaker(boss)
            cutscene:textTagged("* Don't act all surprised!")
            cutscene:textTagged("* I know that you aren't the real Susie either!")

            cutscene:setSpeaker("susie")
            cutscene:textTagged("* ...???", "suspicious")
            cutscene:textTagged("* Uh.", "suspicious")
            cutscene:textTagged("* Alright,[wait:5] let's smash this guy into a pulp.", "teeth_smile")

            cutscene:textTagged("* Agreed", "neutral", "dess")
        else
            cutscene:textTagged("* Whatever,[wait:5]I wanna smash you already", "neutral", "dess")
        end

		cutscene:showNametag("???")
		cutscene:textTagged("* Suit yourself![wait:5] Uheehee!")

		cutscene:hideNametag()
		cutscene:attachCamera(1)
		cutscene:startEncounter("mimicboss", true, boss)

		Game:setFlag("mimicBossDone", true)
		Game:setFlag("mimic_defeated", true)
		boss:remove()
		cutscene:attachFollowers(5)
		cutscene:wait(1)

		cutscene:setSpeaker("dess")
		cutscene:textTagged("* well that was fun", "condescending", "dess")
		cutscene:textTagged("* so whaddaya say we all go and smoke a ciggie outside a 7-11?", "genuine", "dess")
		if susie then
			cutscene:setSpeaker("susie")
			cutscene:textTagged("* What the hell is a 7-11?", "nervous_side", "susie")
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* damn that's not what you said last time", "eyebrow", "dess")
			cutscene:setSpeaker("susie")
			cutscene:textTagged("* Why do you keep acting like I'm supposed to know you?", "suspicious", "susie")
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* uhhh because you are?", "condescending", "dess")
			cutscene:textTagged("* damn this really IS a reboot", "neutral_b", "dess")
			cutscene:textTagged("* ok tell you what,[wait:5] I'll give the leader spot back", "genuine_b", "dess")
			cutscene:textTagged("* IF and only IF", "calm_b", "dess")
			cutscene:textTagged("* you promise to by me a Mug:tm: Root Beer when this is all over", "condescending", "dess")
			cutscene:setSpeaker("susie")
			cutscene:textTagged("* ...[wait:10] Fine.", "suspicious", "susie")
			cutscene:textTagged("* You are the single weirdest person I've ever met.", "annoyed", "susie")
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* i'll take that as a compliment", "heckyeah", "dess")
		else
			cutscene:textTagged("[speed:0.5]* ...", "genuine", "dess")
			cutscene:textTagged("* dang no takers then?", "neutral_b", "dess")
			cutscene:textTagged("* oh well more ciggies for me then", "condescending", "dess")
		end
		cutscene:hideNametag()

		local susie_party = Game:getPartyMember("susie")
        if susie then
            susie_party:addOpinion("dess", -10)
        end

		if Game:getPartyMember("dess").kills >= 9 then
			cutscene:wait(3)
			cutscene:setSpeaker("dess")
			cutscene:textTagged("* Hey actually wait", "genuine", "dess")
			cutscene:textTagged("* wouldn't it be cool if like...", "kind", "dess")
			cutscene:textTagged("* All of the sensless murder we've been doing like...", "condescending", "dess")
			cutscene:textTagged("* Allowed us to actually kill people normally?", "kind", "dess")
			cutscene:showNametag("Dess", {top = true})
			cutscene:textTagged("* That'd be a cool reference to hit Deltarune fangame made by RynoGG know as Deltatraveler where in the section 2 obliteration route you can actually kill the animals and people if you clear out all the enemies in the first few rooms", "condescending", "dess", {top = true})
			if susie then
                cutscene:setSpeaker("susie")
                cutscene:textTagged("* ...", "neutral_side", "susie")
                cutscene:textTagged("* Oooookay then...", "neutral", "susie")
			end
			Assets.playSound("ominous")
			Game:setFlag("can_kill", true)
		end
		cutscene:setSpeaker("dess")
		if #Game.world.followers == 3 then
			cutscene:textTagged("* anyways imma be chillin in the diner if you guys need me", "kind", "dess")
			cutscene:hideNametag()
			cutscene:wait(cutscene:fadeOut(1))
			cutscene:wait(1)

			-- Party setup 2: Desslectric boogaloo
			local newparty = Game.world.followers[3].actor.id
			Game:addPartyMember(newparty)
			Game:removePartyMember("dess")
			Game.world:removeFollower(newparty)
			cutscene:getCharacter(newparty):remove()
			cutscene:wait(0.5)
			for i, v in ipairs(Game.world.followers) do
				v:setActor(Game.party[i+1]:getActor())
			end
			Game.world.player:setActor(Game.party[1]:getActor())
			cutscene:interpolateFollowers()
			cutscene:wait(0.5)

			cutscene:wait(cutscene:fadeIn(1))
		else
			cutscene:textTagged("* ok time to stop leading", "genuine", "dess")
			cutscene:hideNametag()
			cutscene:hideNametag()

			cutscene:wait(cutscene:fadeOut(1))
			cutscene:wait(1)
			Game:movePartyMember("dess", 2)
			for i, v in ipairs(Game.world.followers) do
				v:setActor(Game.party[i+1]:getActor())
			end
			Game.world.player:setActor(Game.party[1]:getActor())
			cutscene:interpolateFollowers()
			cutscene:wait(0.5)

			cutscene:wait(cutscene:fadeIn(1))
		end
		cutscene:setSpeaker()
		cutscene:text("* (Dess is no longer leading the party!)")
	end,
}
