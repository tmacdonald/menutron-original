class GroceriesController < ApplicationController
  # GET /menus/:menu_id/groceries
  # GET /menus/:menu_id/groceries.json
  # GET /menus/:menu_id/groceries.xml
  def index
    @menu = Menu.find(params[:menu_id])
    @groceries = @menu.groceries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @groceries.to_json(:only => :id, :methods => [:how_much,:ingredient_name]) }
      format.xml { render :xml => @groceries }
    end
  end

  # GET /groceries/1
  # GET /groceries/1.json
  # GET /groceries/1.xml
  def show
    @grocery = Grocery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @grocery.to_json(:only => :id, :methods => [:how_much, :ingredient_name]) }
      format.xml  { render :xml => @grocery }
    end
  end

  # GET /groceries/new
  # GET /groceries/new.xml
  def new
    @grocery = Grocery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grocery }
    end
  end

  # GET /groceries/1/edit
  def edit
    @grocery = Grocery.find(params[:id])
  end

  # POST /groceries
  # POST /groceries.json
  # POST /groceries.xml
  def create
    @grocery = Grocery.new(params[:grocery])

    respond_to do |format|
      if @grocery.save
        format.html { redirect_to(@grocery, :notice => 'Grocery was successfully created.') }
        format.json { render :json => :grocery => @grocery.to_json(:only => :id, :methods => [:how_much,:ingredient_name]), :status => :ok }
        format.xml  { render :xml => @grocery, :status => :created, :location => @grocery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @grocery.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @grocery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groceries/1
  # PUT /groceries/1.json
  # PUT /groceries/1.xml
  def update
    @grocery = Grocery.find(params[:id])

    respond_to do |format|
      if @grocery.update_attributes(params[:grocery])
        format.html { redirect_to(@grocery, :notice => 'Grocery was successfully updated.') }
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @grocery.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @grocery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groceries/1
  # DELETE /groceries/1.json
  # DELETE /groceries/1.xml
  def destroy
    @grocery = Grocery.find(params[:id])
    @grocery.destroy

    respond_to do |format|
      format.html { redirect_to(groceries_url) }
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
