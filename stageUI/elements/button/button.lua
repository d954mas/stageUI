local Actor = require "stageUI.elements.actor"

local Button = Actor:subclass('Button')

function Button:initialize(root,style,cb,nodes)
  Actor.initialize(self,root,style,"default_button_style",nodes)
  self.cb=cb
end


	function Button:clicked()
		if(self.cb) then self.cb() end
	end

	function Button:update_view()
		local img=nil
		if(self.status=="pressed") then img=self.style.down
		elseif(self.status=="over") then img=self.style.over end
		
		if(img==nil)then img=self.style.up end
		
		gui.play_flipbook(self.root_node, img)
	end
return Button
