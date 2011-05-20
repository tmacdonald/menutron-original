class RecipesController < ApplicationController
  before_filter :require_user, :except => [:index]

  # GET /recipes
  # GET /recipes.json
  # GET /recipes.xml
  def index
    @recipes = Recipe.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
      format.json { render :json => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
      format.json { render :json => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find_by_slug(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
        format.json { render :json => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
        format.json { render :json => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find_by_slug(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok } 
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
        format.json { render :json => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find_by_slug(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
