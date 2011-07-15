var Recipe = Backbone.Model.extend({
	
});

var RecipeCollection = Backbone.Collection.extend({
	model: Recipe
});

var RecipeView = Backbone.View.extend({
  tagName: 'li',

	render: function() {
    var template = $('#recipe_template').html();
		var context = _.extend( this.model.toJSON(), { cid: this.model.cid } );
		$(this.el).attr( 'id', this.model.id ).html( Mustache.to_html( template, context ) );
		return this;
	}
});
var recipes = new RecipeCollection();

var MenuRecipe = Backbone.Model.extend({
});

var MenuRecipes = Backbone.Collection.extend({
  model: MenuRecipe
});

var MenuRecipeView = Backbone.View.extend({
  tagName: "li",

  render: function() {
    var template = $('#menu_recipe_template').html();
    var context = _.extend( this.model.toJSON(), { cid: this.model.cid } );
    $(this.el).html( Mustache.to_html( template, context ) ).attr( 'id', this.model.id );
    return this;
  } 

});

var MenuIngredient = Backbone.Model.extend({
});

var MenuIngredients = Backbone.Collection.extend({
  model: MenuIngredient
});

var Menu = Backbone.Model.extend({
  initialize: function( attrs ) {
    this.recipes = new MenuRecipes;
    this.recipes.url = '/menus/' + this.id + '/recipes';
    this.recipes.reset( attrs.recipes );

    this.ingredients = new MenuIngredients;
    this.ingredients.url = '/menus/' + this.id + '/ingredients';
    this.ingredients.reset( attrs.ingredients );
  }
});
var menu = null;

var MenuView = Backbone.View.extend({
  el: $('#menu'),

  initialize: function( attrs ) {
    _.bindAll( this, 'addOneRecipe', 'addAllRecipes', 'render' );

    this.model.recipes.bind( 'add', this.addOneRecipe );
    this.model.recipes.bind( 'reset', this.addAllRecipes );
    this.model.recipes.bind( 'all', this.render );
    this.addAllRecipes();

    //attrs.menu.ingredients.bind( 'add', this.addOneIngredient );
    //attrs.menu.ingredients.bind( 'reset', this.addAllIngredients );
    //attrs.menu.ingredients.bind( 'all', this.render );
  },

  addOneRecipe: function( recipe ) {
    var view = new MenuRecipeView( { model: recipe } );
    $('#menu_recipes').append( view.render().el );
  },

  addAllRecipes: function( ) {
    this.model.recipes.each( this.addOneRecipe );
  }
});

var AppView = Backbone.View.extend({
  el: $('#app'),

  initialize: function() {
    _.bindAll( this, 'addOne', 'addAll', 'render' );
  
    recipes.bind( 'add', this.addOne );
    recipes.bind( 'reset', this.addAll );
    recipes.bind( 'all', this.render );   
  },

  render: function() {
    console.log( "AppView::render" );
  }, 

  addOne: function( recipe ) {
    var view = new RecipeView( { model: recipe } );
    $("#recipes").append( view.render().el );
  },

  addAll: function() {
    recipes.each( this.addOne );
  }
});

window.App = new AppView();
