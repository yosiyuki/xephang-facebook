json.array!(@pages) do |page|
  json.extract! page, :id, :uid, :url, :name, :json
  json.url page_url(page, format: :json)
end
