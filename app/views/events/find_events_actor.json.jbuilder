json.array! @events do |event|  
  json.id event.id
  json.type event.event_type

  json.actor do
    json.id event.actor.id
    json.login event.actor.login
    json.avatar_url event.actor.avatar_url
  end

  json.repo do
    json.id event.repo.id
    json.name event.repo.name
    json.url event.repo.url
  end

  json.created_at event.created_at.strftime('%Y-%m-%d %H:%M:%S')
end

