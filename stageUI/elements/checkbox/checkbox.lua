local Actor = require "stageUI.elements.actor"

local Checkbox = Actor:subclass('Checkbox')

function Checkbox:initialize(root,style,cb,nodes)
  Actor.initialize(self,root,style,"default_checkbox_style",nodes)
  self.cb=cb
  self.checked=false
end


function Checkbox:clicked()
	self.checked=not self.checked
	if(self.cb) then self.cb(self.checked) end
	self:update_view()
end

function Checkbox:update_view()
	local img=self.style.unchecked
	if(self.checked) then img=self.style.checked end
	gui.play_flipbook(self.root_node, img)
end
return Checkbox
