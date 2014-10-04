json.array!(@facts) do |fact|
  json.extract! fact, :id, :name, :data, :event
  json.url fact_url(fact, format: :json)
end
