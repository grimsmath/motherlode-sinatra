json.array!(@categories) do |category|
  json.extract! category, :name, :parent
  json.url category_url(category, format: :json)
end
