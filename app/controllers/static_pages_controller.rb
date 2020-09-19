class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build 
      @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts: Posts.all
      @feed_items = current_user.feed.paginate(page: params[:page]).search(params[:search])
    end 
  end

  def help
  end
  
  def about
  end
  
  def contact
  end 
  
end
