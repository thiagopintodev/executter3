json.array!(@comments) do |comment|
  json.extract! comment, :post_id, :site_id, :text, :file, :likes_count, :replies_count, :remote_ip, :origin, :reason
  json.url comment_url(comment, format: :json)
end
