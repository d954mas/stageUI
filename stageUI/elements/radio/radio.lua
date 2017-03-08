local Checkbox = require "stageUI.elements.checkbox.checkbox"

local Radio = Checkbox:subclass('Checkbox')

function Radio:initialize(root,style,cb,nodes)
  Checkbox.initialize(self,root,style,nodes)
  self.default_style_name="default_radio_style"
   self:set_style_id(style)
end


function Radio:clicked()
	self.checked=not self.checked
	if(self.radio_group) then
		self.radio_group:change(self)
	else
		self:update_view()
	end
	if(self.cb) then self.cb(self.checked) end
	
end

return Radio
