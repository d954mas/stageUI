local M = {}
M.__index = M

M.Stage=require("stageUI.stage")
M.Label=require("stageUI.elements.label.label")
M.Button=require("stageUI.elements.button.button")
M.Text_button=require("stageUI.elements.text_button.text_button")
M.Checkbox=require("stageUI.elements.checkbox.checkbox")
M.Radio=require("stageUI.elements.radio.radio")
M.Radio_group=require("stageUI.elements.radio.radio_group")
return M
