ResourceMap = class("ResourceMap")
function ResourceMap:initialized()
  self._map = {}
end

function ResourceMap:add(id, resource)
  if not self._map[id] then
    self._map[id] = resource
  end
end

function ResourceMap:remove(id)
  if self._map[id] then
    self._map[id] = nil
  end
end

function ResourceMap:get(id)
  if self._map[id] then
    return self._map[id]
  end
end

function ResourceMap:getAllEntries()
  return self._map
end