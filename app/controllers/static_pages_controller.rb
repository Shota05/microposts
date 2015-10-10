class StaticPagesController < ApplicationController
  
  def home
    @micropost = current_user.microposts.build if logged_in?
    @followings =  current_user.following_relationships.count
    @followers = current_user.follower_relationships.count
  end

end
