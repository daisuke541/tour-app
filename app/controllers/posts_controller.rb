class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  
  def show
    @post = Post.find(params[:id])
    # @latitude = @post.latitude
    # @longitude = @post.longitude
    @address = @post.address
    @comment = Comment.new
    @user = User.find_by(id: @post.user_id)  
  end 
  
  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end 
  end 
  
  def destroy
    @post.destroy
    flash.now[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end 
  
  private
   def post_params
     params.require(:post).permit(:title, :content, :address, :latitude, :longitude, :picture)
   end 
   
   def correct_user
     @post = current_user.posts.find_by(id: params[:id])
     redirect_to root_url if @post.nil?
   end
end 
