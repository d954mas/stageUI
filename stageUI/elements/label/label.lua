local Actor = require "stageUI.elements.actor"

local Label = Actor:subclass('Label')

 	function Label:initialize(root,style,nodes)
		Actor.initialize(self,root,style,"default_label_style",nodes)
 	end

	function Label:set_text(text)
		gui.set_text(self.root_node, text)
	end

	function Label:update_view()
		gui.set_color(self.root_node,self.style.font_color)
		gui.set_font(self.root_node, self.style.font)
		gui.set_scale(self.root_node, vmath.vector3(1 * self.style.font_scale))
	end

return Label
