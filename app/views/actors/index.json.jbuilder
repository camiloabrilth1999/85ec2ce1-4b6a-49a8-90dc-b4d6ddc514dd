json.array! @actors do |actor|  
  json.id actor.id
  json.login actor.login
  json.avatar_url actor.avatar_url
end

