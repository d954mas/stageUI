local M = {}
local Radio=require("stageUI.elements.radio.radio")
M.__index = M

 function M.new()
	local self = setmetatable({},M)
	self.styles=styles
	self.childs={}
	return self
 end

function M:add(child)
	assert(child:isInstanceOf(Radio),"child can only be instance of radio")
	table.insert(self.childs,child)
	child.radio_group=self
end

function M:change(child)
	for i,v in ipairs(self.childs) do
		if(v==child)then
			v.checked=true
		else
			v.checked=false
		end
		v:update_view()
	end 
end

return M
