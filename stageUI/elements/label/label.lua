local Actor = require "stageUI.elements.actor"

local Label = Actor:subclass('Label')

 	function Label:initialize(root_name,style)
		Actor.initialize(self,root_name.."/label",style,"default_label_style")
 	end

	function Label:set_text(text)
		print(self.root_node)
		gui.set_text(self.root_node, text)
	end

	function Label:style_changed()
		gui.set_font(self.root_node, self.style.font)
		gui.set_scale(self.root_node, vmath.vector3(1 * self.style.font_scale))
	end
return Label
