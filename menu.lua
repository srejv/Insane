Menu = class("Menu")
function Menu:initialize():include(Branchy)
    self.items = {}
end

function Menu:addSubMenu()
end

function Menu:addItem()
end

MenuItem = class("MenuItem")
function MenuItem:initialize(title)
  self.title = title or "DERP"
end