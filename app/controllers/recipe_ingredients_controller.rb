class RecipeIngredientsController < ApplicationController
  before_filter :find_recipe
  before_filter :require_user, :except => [:index]

  # GET /recipe_ingredients
  # GET /recipe_ingredients.xml
  # GET /recipe_ingredients.json
  def index
    @recipe_ingredients = @recipe.ingredients

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipe_ingredients }
      format.json { render :json => @recipe_ingredients.to_json(:only => :id, :methods => [:how_much,:ingredient_name]) }
    end
  end

  # GET /recipe_ingredients/1
  # GET /recipe_ingredients/1.xml
  # GET /recipe_ingredients/1.json
  def show
    @recipe_ingredient = @recipe.ingredients.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe_ingredient }
      format.json { render :json => @recipe_ingredient.to_json(:only => :id, :methods => [:how_much,:ingredient_name]) }
    end
  end

  # GET /recipe_ingredients/new
  # GET /recipe_ingredients/new.xml
  def new
    @recipe_ingredient = RecipeIngredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe_ingredient }
    end
  end

  # GET /recipe_ingredients/1/edit
  def edit
    @recipe_ingredient = @recipe.ingredients.find(params[:id])
  end

  # POST /recipe_ingredients
  # POST /recipe_ingredients.xml
  # POST /recipe_ingredients.json
  def create
    @recipe_ingredient = @recipe.ingredients.new(params[:recipe_ingredient])

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to([@recipe,@recipe_ingredient], :notice => 'Recipe ingredient was successfully created.') }
        format.xml  { render :xml => @recipe_ingredient, :status => :created, :location => [@recipe,@recipe_ingredient] }
        format.json { render :json => @recipe_ingredient.to_json(:only => :id, :methods => [:how_much,:ingredient_name]), :status => :created, :location => [@recipe,@recipe_ingredient] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe_ingredient.errors, :status => :unprocessable_entity }
        format.json { render :json => @recipe_ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipe_ingredients/1
  # PUT /recipe_ingredients/1.xml
  # PUT /recipe_ingredients/1.json
  def update
    @recipe_ingredient = @recipe.ingredients.find(params[:id])

    respond_to do |format|
      if @recipe_ingredient.update_attributes(params[:recipe_ingredient])
        format.html { redirect_to([@recipe,@recipe_ingredient], :notice => 'Recipe ingredient was successfully updated.') }
        format.xml  { head :ok }
        format.json { render :json => @recipe_ingredient.to_json(:only => :id, :methods => [:how_much,:ingredient_name]), :status => :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe_ingredient.errors, :status => :unprocessable_entity }
        format.json { render :json => @recipe_ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1
  # DELETE /recipe_ingredients/1.xml
  # DELETE /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient = @recipe.ingredients.find(params[:id])
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(recipe_recipe_ingredients_url(@recipe)) }
      format.xml  { head :ok }
      format.json { render :json => @recipe_ingredient, :status => :ok }
    end
  end

  protected
    def find_recipe
      @recipe = Recipe.find_by_slug(params[:recipe_id])
    end
end
