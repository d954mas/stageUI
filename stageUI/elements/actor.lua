local class = require 'stageUI.utils.middleclass'


--[[
actor can be initialised with root_node_id or with table which contains all nodes.Table need when gui node copy in runtime
actor can be visible/invisible(in defold this name enable)
actor can be enabled/disabled (disable actor not handle input.Style can customise disabled actors)
actor can act every frame
actor can be added/removed from stage
actor can be hit(return true if point inside actor)
actor can change style(the main idea that stage changing style)
--]]
local Actor = class("Actor")
function Actor:initialize(root_id,style_id,default_style_name,nodes)
	print("init actor")
	assert(root_id,"root can't be nil")
	assert(style_id,"style_id can't be nil")
	assert(default_style_name,"default_style_name can't be nil")
	self.default_style_name=default_style_name
	self:set_style_id(style_id)
	local root_type=type(root)
	self.root_id=root_id
	if(nodes~=nil)then
		print("init with table")
		self:init_with_table(nodes)
	else
		self:init_with_string()
	end
	self.stage=nil
	self.enable=true
	self.status=nil--can be nil/over/pressed
	self.style=nil
end


function Actor:init_with_string()
	self.root_node=gui.get_node(self.root_id .."/root")
end

function Actor:init_with_table(nodes)
	self.root_node=nodes[self.root_id .."/root"]
end

--Updates the actor based on time. Typically this is called each frame by Stage#act(dt) Now not used
--can be used for animation
function Actor:act(dt)
end

function Actor:change_status(status)
	if(self.status~=status) then
		self.status=status
		if(self.style_id~="no_style")then self:update_view() end
	end
end


	function Actor:hit(x,y)
		if(gui.is_enabled(self.root_node)) then
			return gui.pick_node(self.root_node, x, y)
		else
			return false
		end
	end

	function Actor:clicked()
		print("clicked")
	end

	function Actor:set_style_id(style_id)
		self.style_id=(style_id=="default") and self.default_style_name or style_id
		if(self.stage) then
			self.stage:update_actor_style(self)
		end
	end
  --only stage need use it
	function Actor:change_style(newstyle)
		self.style=newstyle
		if(self.style_id~="no_style")then
			self:update_view()
		end
	end

	function Actor:update_view()
		assert(nil,"need override this in child")
	end

	function Actor:delete()
		gui.delete_node(self.root_node)
	end

	function Actor:set_visibility(visibility)
		gui.set_enabled(self.root_node, visibility)
	end

	function Actor:added_to_stage(stage)
		self.stage=stage
	end

	function Actor:remove_from_stage()
		self.stage=nil
	end

  --[[it will be awesome if all ui can be created dynamic
	contains a lot of probmlem. The main problem for me is layers.
	function actor:create_dynamic()
		assert(nil,"create_node_dynamic not implemented")
	end--]]

return Actor
