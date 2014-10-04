json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :level, :source
  json.url event_url(event, format: :json)
end
