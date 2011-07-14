var Recipe = Backbone.Model.extend({
	
});

var RecipeCollection = Backbone.Collection.extend({
	model: Recipe
});

var RecipeView = Backbone.View.extend({
	render: function() {
		var template = '\
			<li id="recipe_{{ cid }}"><span class="name">{{name}}</span></li>';
		var context = _.extend( this.model.toJSON(), { cid: this.model.cid } );
		$(this.el).html( Mustache.to_html( template, context ) );
		return this;
	}
});

var AppModel = Backbone.Model.extend({
	initialize: function() {
		this.recipes = new RecipeCollection();
	}
});

var AppView = Backbone.View.extend({
});

var AppRouter = Backbone.Router.extend({
	initialize: function( params ) {
	}
});
