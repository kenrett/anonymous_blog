get '/posts' do
  # Look in app/views/index.erb
  erb :posts_index
end


post '/created_post' do
  @post = Post.create(:title => params[:title], :body => params[:body])
  tags = params[:tags].split(/[^\w]/).reject(&:empty?).map do |tag|
    Tag.find_or_create_by_description(tag)
  end


  tags.each do |tag|
    @post.tags << tag unless @post.tags.include?(tag)
  end

  if @post.valid?
    erb :created_post
  else
    @errors = @post.errors
    erb :index
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post_show
end
