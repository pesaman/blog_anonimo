

#este post recibe la peticion de cuando se crea un psot se agrega 
# y se ve en la lista con su id te manda al erb all_post
get '/post_all' do
   @all_post = Post.all
   erb :all_post    
end

get '/list_post/:id' do
   # @post_list = PostTag.where(post_id: params[:id])
   # p @post_list
   @post = Post.find(params[:id])
   @post_list = @post.tags
   erb :list_post    
end

get '/list_post_tags/:id' do
   # @post_list = PostTag.where(post_id: params[:id])
   # p @post_list
   @tagss = Tag.find(params[:id])
   @post_list_tags = @tagss.posts
   erb :list_post_tags    
end

post '/registrar_form_post' do
  
  title = params[:title]
  body  = params[:body] 
  tags = params[:tags]
  post = Post.new(title: title, body: body)
  if post.save
  tags.split(", ").each do |tag|
    tag_bd = Tag.find_by(name: tag)
    if tag_bd
       post.tags << tag_bd   
        
    else
        post.tags << Tag.create(name: tag)  
        
    end
    end 
       redirect to("/post_all")
  else
   redirect to("/registrar_form_post")
 end
end
