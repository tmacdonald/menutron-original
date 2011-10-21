class RecipeDirectionsController < ApplicationController
  before_filter :find_recipe
  before_filter :require_user, :except => [:index]

  # GET /recipe_directions
  # GET /recipe_directions.xml
  # GET /recipe_directions.json
  def index
    @recipe_directions = @recipe.directions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipe_directions }
      format.json { render :json => @recipe_directions }
    end
  end

  # GET /recipe_directions/1
  # GET /recipe_directions/1.xml
  # GET /recipe_directions/1.json
  def show
    @recipe_direction = @recipe.directions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe_direction }
      format.json { render :json => @recipe_direction }
    end
  end

  # GET /recipe_directions/new
  # GET /recipe_directions/new.xml
  def new
    @recipe_direction = RecipeDirection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe_direction }
    end
  end

  # GET /recipe_directions/1/edit
  def edit
    @recipe_direction = RecipeDirection.find(params[:id])
  end

  # POST /recipe_directions
  # POST /recipe_directions.xml
  # POST /recipe_directions.json
  def create
    @recipe_direction = @recipe.directions.new(params[:recipe_direction])

    respond_to do |format|
      if @recipe_direction.save
        format.html { redirect_to([@recipe,@recipe_direction], :notice => 'Recipe direction was successfully created.') }
        format.xml  { render :xml => @recipe_direction, :status => :created, :location => [@recipe, @recipe_direction] }
        format.json { render :json => @recipe_direction, :status => :created, :location => [@recipe, @recipe_direction] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe_direction.errors, :status => :unprocessable_entity }
        format.json { render :json => @recipe_direction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipe_directions/1
  # PUT /recipe_directions/1.xml
  # PUT /recipe_directions/1.json
  def update
    @recipe_direction = @recipe.directions.find(params[:id])

    respond_to do |format|
      if @recipe_direction.update_attributes(params[:recipe_direction])
        format.html { redirect_to([@recipe,@recipe_direction], :notice => 'Recipe direction was successfully updated.') }
        format.xml  { head :ok }
        format.json { render :json => @recipe_direction, :status => :ok, :location => [@recipe, @recipe_direction] }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe_direction.errors, :status => :unprocessable_entity }
        format.json { render :json => @recipe_direction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_directions/1
  # DELETE /recipe_directions/1.xml
  # DELETE /recipe_directions/1.json
  def destroy
    @recipe_direction = @recipe.directions.find(params[:id])
    @recipe_direction.destroy

    respond_to do |format|
      format.html { redirect_to(recipe_recipe_directions_url(@recipe)) }
      format.xml  { head :ok }
      format.json { render :json => @recipe_direction, :status => :ok }
    end
  end

  protected
    def find_recipe
      @recipe = Recipe.find_by_slug(params[:recipe_id])
    end
end
