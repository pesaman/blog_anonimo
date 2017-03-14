get '/update_post/:id' do
   @edit_post = Post.find(params[:id])
   @edit_tags = @edit_post.tags

   erb :update_post   
end

get '/delete_post/:id' do
  id = params[:id]
  buscar = Post.find_by(id: id)
  buscar.tags.delete
  Post.delete(id)
  redirect to '/post_all'
end


post '/update_form/:id' do
  title = params[:title]
  body  = params[:body]
  tags  = params[:tags]
  post = Post.find(params[:id])
  post.update(title: title, body: body)

  tags.each do |old_tag, new_tag|
    unless old_tag == new_tag
      # Disassociate tag
      removed_tag = Tag.find_by(name: old_tag)
      post.tags.delete(removed_tag)
      # Asossiate tag
      tag = Tag.find_by(name: new_tag)
      if tag
        post.tags << tag
      else
        created_tag = Tag.create(name: new_tag)
        post.tags << created_tag
      end
    end
  end
  redirect to('/post_all')
end

