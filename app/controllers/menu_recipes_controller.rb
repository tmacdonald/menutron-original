class MenuRecipesController < ApplicationController
  before_filter :find_menu
  before_filter :require_user

  # GET /menu_recipes
  # GET /menu_recipes.xml
  # GET /menu_recipes.json
  def index
    @menu_recipes = MenuRecipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_recipes }
      format.json { render :json => @menu_recipes }
    end
  end

  # GET /menu_recipes/1
  # GET /menu_recipes/1.xml
  # GET /menu_recipes/1.json
  def show
    @menu_recipe = MenuRecipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_recipe }
      format.json { render :json => @menu_recipe }
    end
  end

  # GET /menu_recipes/new
  # GET /menu_recipes/new.xml
  # GET /menu_recipes/new.json
  def new
    @menu_recipe = MenuRecipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_recipe }
      format.json { render :json => @menu_recipe }
    end
  end

  # GET /menu_recipes/1/edit
  def edit
    @menu_recipe = MenuRecipe.find(params[:id])
  end

  # POST /menu_recipes
  # POST /menu_recipes.xml
  # POST /menu_recipes.json
  def create
    @menu_recipe = MenuRecipe.new(params[:menu_recipe])

    respond_to do |format|
      if @menu_recipe.save
        format.html { redirect_to([@menu,@menu_recipe], :notice => 'Menu recipe was successfully created.') }
        format.xml  { render :xml => @menu_recipe, :status => :created, :location => [@menu,@menu_recipe] }
        format.json { render :json => @menu_recipe, :status => :created, :location => [@menu,@menu_recipe] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_recipe.errors, :status => :unprocessable_entity }
        format.json { render :json => @menu_recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_recipes/1
  # PUT /menu_recipes/1.xml
  # PUT /menu_recipes/1.json
  def update
    @menu_recipe = MenuRecipe.find(params[:id])

    respond_to do |format|
      if @menu_recipe.update_attributes(params[:menu_recipe])
        format.html { redirect_to([@menu,@menu_recipe], :notice => 'Menu recipe was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_recipes/1
  # DELETE /menu_recipes/1.xml
  # DELETE /menu_recipes/1.json
  def destroy
    @menu_recipe = MenuRecipe.find(params[:id])
    @menu_recipe.destroy

    respond_to do |format|
      format.html { redirect_to(menu_menu_recipes_url(@menu)) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end

  protected
    def find_menu
      @menu = Menu.find(params[:menu_id])
    end
end
