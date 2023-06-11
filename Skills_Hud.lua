

local panelName = "tcSkills"
local tcSkillPanel = setupUI([[
OutlineLabel < Label
  height: 12
  background-color: #00000044
  opacity: 0.89
  text-auto-resize: true
  font: verdana-11px-rounded
  anchors.right: parent.right
  $first:
    anchors.top: parent.top
  $!first:
    anchors.top: prev.bottom

Panel
  id: skillPanel
  height: 50
  width: 50
  anchors.right: parent.right
  anchors.bottom: parent.bottom
  margin-bottom: 45
  margin-right: 15
]], modules.game_interface.getMapPanel())

local skills = {
  { name = "Fist", data = {}, id = 0, enabled = true, highlight = 'white' },
  { name = "Club", data = {}, id = 1, enabled = true },
  { name = "Sword", data = {}, id = 2, enabled = false },
  { name = "Axe", data = {}, id = 3, enabled = false },
  { name = "Distance", data = {}, id = 4, enabled = true },
  { name = "Shielding", data = {}, id = 5, enabled = true },
  { name = "Fishing", data = {}, id = 6, enabled = true },
  { name = "Crit Chance", data = {}, id = 7, enabled = false },
  { name = "Crit Damage", data = {}, id = 8, enabled = false },
  { name = "Life Leech Chance", data = {}, id = 9, enabled = false },
  { name = "Life Leech Amount", data = {}, id = 10, enabled = false },
  { name = "Mana Leech Chance", data = {}, id = 11, enabled = false },
  { name = "Mana Leech Amount", enabled = true , data = {}, id = 12, enabled = false },
  { name = "Level",  data = {}, id = 13, enabled = true, color = '#aba71e', highlight = 'orange' },
  { name = "Magic Level", data = {}, id = 14, enabled = true , color = '#4fc3f7', highlight = 'green'},
  { name = "Stamina", data = {}, id = 15, enabled = true },
}

local firstSkill, lastSkill = 1, 13
local levelSkill = 14
local magicSkill = 15
local stamSkill = 16

function calcStamina()
  local stam = stamina()
  local hours = math.floor(stam / 60)
  local minutes = stam % 60
  if minutes < 10 then
    minutes = '0' .. minutes
  end
  local percent = math.floor(100 * stam / (42 * 60))
  return hours.. ':'.. minutes, ' ('..percent..'%)'
end

function checkStamina()
  local skill = skills[stamSkill]
  if skill and skill.enabled then
    local label = tcSkillPanel[stamSkill] or UI.createWidget("OutlineLabel", tcSkillPanel)
    label:setId(stamSkill)
    local sta, per = calcStamina()
    label:setColoredText({
      '~ '..skill.name..': ', (skill.color or 'white'),
      sta,(skill.highlight or 'green'),
      per, (skill.color or 'white'),
    })
  end
end

function checkMagicLevel()
  local skill = skills[magicSkill]
  if skill.enabled then
    local label = tcSkillPanel[magicSkill] or UI.createWidget("OutlineLabel", tcSkillPanel)
    label:setId(magicSkill)

    label:setColoredText({
      '~ '..skill.name..': ', (skill.color or 'white'),
      player:getMagicLevel(),(skill.highlight or 'green'),
      ' ('..player:getMagicLevelPercent().. '%)', (skill.color or 'white'),
    })
  end
end

function checkSkill(num)
  local skill = skills[num]
  if skill and skill.enabled and skill.id then
    local label = tcSkillPanel[skill.id] or UI.createWidget("OutlineLabel", tcSkillPanel)
      label:setId(skill.id)

    local t = {
      '~ '..skill.name..': ', (skill.color or 'white'),
      player:getSkillLevel(skill.id), (skill.highlight or 'green'),
      ' ('..player:getSkillLevelPercent(skill.id).. '%)', (skill.color or 'white'),
    }
    label:setColoredText(t)
  end
end


function checkLevel()
  local skill = skills[levelSkill]
  if skill.enabled then
    local label = tcSkillPanel[levelSkill] or UI.createWidget("OutlineLabel", tcSkillPanel)
    label:setId(levelSkill)

    label:setColoredText({
      '~ '..skill.name..': ', (skill.color or 'white'),
      level(), (skill.highlight or 'green'),
      ' ('.. player:getLevelPercent().. '%)', (skill.color or 'white'),
    })
  end
end

function checkAll()
  checkLevel()
  checkMagicLevel()
  for i = firstSkill, lastSkill do
    checkSkill(i, true)
  end
  checkStamina()
  tcSkillPanel:setHeight((tcSkillPanel:getChildCount()*13))
end

local checkSkills = macro(2000, 'Check Skills', function()
  checkAll()
end)

checkAll()