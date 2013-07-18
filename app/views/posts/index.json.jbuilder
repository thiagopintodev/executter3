json.array!(@posts) do |post|
  json.extract! post, :site_id, :verb, :text, :comments_count
  json.url post_url(post, format: :json)
end
