json.extract! @post, :site_id, :verb, :text, :comments_count #, :created_at, :updated_at

json.site do |json|
  json.(@post.site, :id, :link)
  #json.url author_url(@article.author)
end

json.comments @post.comments do |json, comment|
  #json.partial! comment
  json.(comment, :id, :text, :site_id)
  json.site do |json|
    json.(comment.site, :id, :link)
    #json.url author_url(@article.author)
  end
end