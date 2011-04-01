class MenuIngredientsController < ApplicationController
  before_filter :find_menu

  # GET /menu_ingredients
  # GET /menu_ingredients.xml
  # GET /menu_ingredients.json
  def index
    @menu_ingredients = MenuIngredient.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_ingredients }
      format.json { render :json => @menu_ingredients.to_json(:only => :id, :methods => [:how_much,:ingredient_name]) }
    end
  end

  # GET /menu_ingredients/1
  # GET /menu_ingredients/1.xml
  # GET /menu_ingredients/1.json
  def show
    @menu_ingredient = MenuIngredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_ingredient }
      format.json { render :json => @menu_ingredient.to_json(:only => :id, :methods => [:how_much,:ingredient_name]) }
    end
  end

  # GET /menu_ingredients/new
  # GET /menu_ingredients/new.xml
  def new
    @menu_ingredient = MenuIngredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_ingredient }
    end
  end

  # GET /menu_ingredients/1/edit
  def edit
    @menu_ingredient = MenuIngredient.find(params[:id])
  end

  # POST /menu_ingredients
  # POST /menu_ingredients.xml
  # POST /menu_ingredients.json
  def create
    @menu_ingredient = MenuIngredient.new(params[:menu_ingredient])

    respond_to do |format|
      if @menu_ingredient.save
        format.html { redirect_to(@menu_ingredient, :notice => 'Menu ingredient was successfully created.') }
        format.xml  { render :xml => @menu_ingredient, :status => :created, :location => @menu_ingredient }
        format.json { render :json => @menu_ingredient.to_json(:only => :id, :methods => [:how_much,:ingredient_name]), :status => :created, :location => @menu_ingredient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_ingredient.errors, :status => :unprocessable_entity }
        format.json { render :json => @menu_ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_ingredients/1
  # PUT /menu_ingredients/1.xml
  # PUT /menu_ingredients/1.json
  def update
    @menu_ingredient = MenuIngredient.find(params[:id])

    respond_to do |format|
      if @menu_ingredient.update_attributes(params[:menu_ingredient])
        format.html { redirect_to(@menu_ingredient, :notice => 'Menu ingredient was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_ingredient.errors, :status => :unprocessable_entity }
        format.json { render :xml => @menu_ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_ingredients/1
  # DELETE /menu_ingredients/1.xml
  # DELETE /menu_ingredients/1.json
  def destroy
    @menu_ingredient = MenuIngredient.find(params[:id])
    @menu_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(menu_ingredients_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end

  protected
    def find_menu
      @menu = Menu.find(params[:menu_id])
    end
end
