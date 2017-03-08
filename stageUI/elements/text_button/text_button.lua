local Button = require "stageUI.elements.button.button"

local Text_button = Button:subclass('Text_button')

function Text_button:initialize(root,style,cb,nodes)
  Button.initialize(self,root,style,cb,nodes)
  self.default_style_name="default_text_button_style"
    self:set_style_id(style)
end

function Text_button:init_with_string()
	Button.init_with_string(self)
	self.text_node=gui.get_node(self.root_id .. "/text")
end

function Text_button:init_with_table(nodes)
	Button.init_with_table(self,nodes)
	self.text_node=nodes[self.root_id .. "/text"]
end

function Text_button:set_text(text)
	gui.set_text(self.text_node, text)
end

function Text_button:update_view()
	Button.update_view(self)
	gui.set_font(self.text_node, self.style.font)
	gui.set_scale(self.text_node, vmath.vector3(1 * self.style.font_scale))
end

return Text_button
