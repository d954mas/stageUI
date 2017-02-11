lume = require "stageUI.utils.lume"
local Object = require "stageUI.utils.object"
local touch_hash = hash("touch")
local M={}
--actor have'n get style before added to stage

local M = Object:extend(function(stage)
 	function stage:init(styles)
		assert(styles,"styles can not be nil")
		self.styles=styles
		self.actors={}
 	end

	function stage:add(actor)
		table.insert(self.actors,actor)
		actor:added_to_stage(stage)
		--actor have style
		self:update_actor_style(actor)
	end

	function stage:update_actor_style(actor)
			assert(actor.stage~=self,"stage can change style if actor added to same stage")
		if(actor.style_id~=nil) then
			local actor_style=self.styles[actor.style_id]
			if(actor_style) then actor:change_style(actor_style)
	 		else print("no style:" .. actor.style_id .. " in styles" ) end
		end
	end

	function stage:remove(actor)
		lume.remove(self.actors, actor)
		actor:remove_from_stage()
	end

	function stage:act(dt)
		for i,actor in ipairs(self.actors) do
			actor.act(dt)
		end
	end

	function stage:on_input(action_id, action)
			local hit_happened=false
			for i,actor in ipairs(self.actors) do
				print(actor.style_id)
				if(not hit_happened and actor:hit(action.x,action.y)) then
					hit_happened=true
					if(action.pressed) then actor:change_status("pressed")
					elseif (action.released and actor.status=="pressed") then
						actor:clicked()
						actor:change_status("over")
					elseif(actor.status~="pressed") then
						actor:change_status("over")
					end
				else
					actor:change_status(nil)
				end
			end
		end
end)

return M
