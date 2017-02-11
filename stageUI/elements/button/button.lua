local Actor = require "stageUI.elements.actor"

local Button = Actor:subclass('Button')

function Button:initialize(root_name,style,cb)
  Actor.initialize(self,root_name.."/background",style,"default_button_style")
	self.cb=cb
end

	function Button:clicked()
		if(self.cb) then self.cb() end
	end

	function Button:style_changed()
		local img=self.style.normal
		if(self.status=="pressed") then img=self.style.pressed
		elseif(self.status=="over") then img=self.style.over end
		gui.play_flipbook(self.root_node, img)
	end
return Button
