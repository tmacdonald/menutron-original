var Recipe = Backbone.Model.extend({
	
});

var RecipeCollection = Backbone.Collection.extend({
	model: Recipe
});

var RecipeView = Backbone.View.extend({
  tagName: 'li',

	render: function() {
		var template ='<div id="recipe_{{cid}}"><span class="name">{{name}}</span></div>';
		var context = _.extend( this.model.toJSON(), { cid: this.model.cid } );
		$(this.el).html( Mustache.to_html( template, context ) );
		return this;
	}
});
var recipes = new RecipeCollection();

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

var MenuRecipe = Backbone.Model.extend({
});

var MenuRecipes = Backbone.Collection.extend({
  model: MenuRecipe
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

window.App = new AppView();

/*
var AppRouter = Backbone.Router.extend({
	initialize: function( params ) {
    this.model = new AppModel();
    this.view = new AppView( { model: this.model } );
    params.append_at.append( this.view.render().el );
	}
});
*/
