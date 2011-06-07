class MenuController < ApplicationController
  before_filter :require_user 

  # GET /menu
  def newest 
    @menu = current_user.menus.newest.first
  end

  # Get /index
  def index
    @menu = current_user.menus.newest.first
  end
end
