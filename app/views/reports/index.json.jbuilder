json.array!(@reports) do |report|
  json.extract! report, :id, :name, :handler
  json.url report_url(report, format: :json)
end
