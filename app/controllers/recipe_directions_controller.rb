class RecipeDirectionsController < ApplicationController
  # GET /recipe_directions
  # GET /recipe_directions.xml
  def index
    @recipe_directions = RecipeDirection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipe_directions }
    end
  end

  # GET /recipe_directions/1
  # GET /recipe_directions/1.xml
  def show
    @recipe_direction = RecipeDirection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe_direction }
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
  def create
    @recipe_direction = RecipeDirection.new(params[:recipe_direction])

    respond_to do |format|
      if @recipe_direction.save
        format.html { redirect_to(@recipe_direction, :notice => 'Recipe direction was successfully created.') }
        format.xml  { render :xml => @recipe_direction, :status => :created, :location => @recipe_direction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe_direction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipe_directions/1
  # PUT /recipe_directions/1.xml
  def update
    @recipe_direction = RecipeDirection.find(params[:id])

    respond_to do |format|
      if @recipe_direction.update_attributes(params[:recipe_direction])
        format.html { redirect_to(@recipe_direction, :notice => 'Recipe direction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe_direction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_directions/1
  # DELETE /recipe_directions/1.xml
  def destroy
    @recipe_direction = RecipeDirection.find(params[:id])
    @recipe_direction.destroy

    respond_to do |format|
      format.html { redirect_to(recipe_directions_url) }
      format.xml  { head :ok }
    end
  end
end
