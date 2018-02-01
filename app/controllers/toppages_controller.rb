class ToppagesController < ApplicationController
  def root
    if sign_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed
    end
  end
end
