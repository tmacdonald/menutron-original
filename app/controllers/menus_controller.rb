class MenusController < ApplicationController
  before_filter :require_user

  # GET /menus
  # GET /menus.xml
  # GET /menus.json
  def index
    @menus = current_user.menus

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menus }
      format.json { render :json => @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.xml
  # GET /menus/1.json
  def show
    if (params[:id] == "newest")
      @menu = current_user.menus.includes_all.newest.first 
    else
      @menu = current_user.menus.includes_all.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu }
      format.json { render :json => @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.xml
  def new
    @menu = Menu.new
    1.times.each do
      @menu.meals.build
      @menu.recipes.build
      @menu.ingredients.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = current_user.menus.includes_all.find(params[:id])
    1.times.each do
      meal = @menu.meals.build
      @menu.recipes.build
      @menu.ingredients.build 
    end
  end

  # POST /menus
  # POST /menus.xml
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])
    @menu.user = current_user

    respond_to do |format|
      if @menu.save
        format.html { redirect_to(@menu, :notice => 'Menu was successfully created.') }
        format.xml  { render :xml => @menu, :status => :created, :location => @menu }
        format.json { render :json => @menu, :status => :created, :location => @menu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
        format.json { render :json => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.xml
  # PUT /menus/1.json
  def update
    @menu = current_user.menus.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to(@menu, :notice => 'Menu was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
        format.json { render :json => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.xml
  # DELETE /menus/1.json
  def destroy
    @menu = current_user.menus.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to(menus_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end

end
