json.array!(@nuggets) do |nugget|
  json.extract! nugget, :title, :category_id, :author_id, :content
  json.url nugget_url(nugget, format: :json)
end
