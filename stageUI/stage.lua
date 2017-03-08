lume = require "stageUI.utils.lume"
local touch_hash = hash("touch")
local M={}
--actor have'n get style before added to stage

local M = {}
M.__index = M

 	function M.new(styles)
		assert(styles,"styles can not be nil")
		local self = setmetatable({},M)
		self.styles=styles
		self.actors={}
		return self
 	end

	function M:add(actor)
		table.insert(self.actors,actor)
		actor:added_to_stage(stage)
		--actor have style
		self:update_actor_style(actor)
	end

	function M:update_actor_style(actor)
			assert(actor.stage~=self,"stage can change style if actor added to same stage")
		if(actor.style_id~=nil) then
			local actor_style=self.styles[actor.style_id]
			if(actor_style) then actor:change_style(actor_style)
	 		else print("no style:" .. actor.style_id .. " in styles" ) end
		end
	end

	function M:remove(actor)
		lume.remove(self.actors, actor)
		actor:remove_from_stage()
	end

	function M:act(dt)
		for i,actor in ipairs(self.actors) do
			actor.act(dt)
		end
	end

	function M:on_input(action_id, action)
			local hit_happened=false
			for i,actor in ipairs(self.actors) do
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

return M
