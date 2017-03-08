local M = {}
M.__index = M

M.Stage=require("stageUI.stage")
M.Label=require("stageUI.elements.label.label")
M.Button=require("stageUI.elements.button.button")
M.Text_button=require("stageUI.elements.text_button.text_button")

return M
