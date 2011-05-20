class MenuController < ApplicationController
  before_filter :require_user 

  # GET /menu
  def newest 
    @menu = current_user.menus.newest
  end

  # Get /index
  def index
  end
end
