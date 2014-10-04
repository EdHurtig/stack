json.array!(@sources) do |source|
  json.extract! source, :id, :name, :address, :port, :kind, :token, :version
  json.url source_url(source, format: :json)
end
