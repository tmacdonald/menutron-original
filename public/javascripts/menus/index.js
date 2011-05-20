$(function() {

  var recipeTemplate = $('#recipe_template').html();

  window.Recipe = Backbone.Model.extend ( {
    url: function() { 
      return this.id ? "/recipes/" + this.slug : "/recipes";
    }
  });

  window.RecipeCollection = Backbone.Collection.extend ( {
    model: Recipe,
    url: function() {
      return "/recipes";
    }
  });

  window.Recipes = new RecipeCollection;

  window.RecipeView = Backbone.View.extend ( {
    tagName: 'tr',
    
    events: {
    },

    initialize: function() {
    },

    render: function() {
      var recipe = this.model.toJSON();
      $(this.el).html( Mustache.to_html( recipeTemplate, recipe ) );
      return this;
    }
  });

  window.AppView = Backbone.View.extend ( {
    el: $("#app"),

    events: {
    },

    initialize: function() {
      _.bindAll( this, 'addOne', 'addAll' );

      Recipes.bind( 'add', this.addOne );
      Recipes.bind( 'refresh', this.addAll );
      Recipes.bind( 'all', this.render );

      Recipes.fetch();
    },
  
    addOne: function( recipe ) {
      var view = new RecipeView( { model: recipe } );
      this.$("#recipe_table").append( view.render().el );
    },

    addAll: function() {
      Recipes.each( this.addOne );
    },
  });

  window.App = new AppView;

  window.MyController = Backbone.Controller.extend( {
    routes: {
      "say/:something": "say"
    },

    say: function( something ) {
      console.log( something );
    }
  });

  window.myController = new MyController;

  Backbone.history.start();

});
