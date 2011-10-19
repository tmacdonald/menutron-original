var Recipe = Backbone.Model.extend({
  initialize: function() {
    this.directions = new RecipeDirections(null, {recipe: this});
    this.directions.url = '/recipes/' + this.get('slug') + '/directions';
    //this.directions.bind('reset', function(data) { console.log(data); });
    this.directions.fetch();

    this.ingredients = new RecipeIngredients(null, {recipe: this});
    this.ingredients.url = '/recipes/' + this.get('slug') + '/ingredients';
    this.ingredients.fetch();
  },

  url: function() {
    return '/recipes/' + (this.isNew() ? '' : this.get('slug'));
  },

  toJSON: function() {
    return {'recipe': _.clone(this.attributes)};
  }
});

var RecipeDirection = Backbone.Model.extend({
  initialize: function() {
    this.recipe = this.collection.recipe;
  },

  url: function() {
    return '/recipes/' + this.recipe.get('slug') + '/directions/' + (this.isNew() ? '' : this.id);
  },

  toJSON: function() {
    return {'recipe_direction': _.clone(this.attributes)};
  }
});

var RecipeDirections = Backbone.Collection.extend({
  model: RecipeDirection,

  initialize: function(models, options) {
    this.recipe = options.recipe;
  }
});

var RecipeIngredient = Backbone.Model.extend({
  initialize: function() {
    this.recipe = this.collection.recipe;
  },

  url: function() {
    return '/recipes/' + this.recipe.get('slug') + '/ingredients/' + (this.isNew() ? '' : this.id);
  },

  toJSON: function() {
    return {'recipe_ingredient': _.clone(this.attributes)};
  }
});

var RecipeIngredients = Backbone.Collection.extend({
  model: RecipeIngredient,

  initialize: function(models, options) {
    this.recipe = options.recipe;
  }
});

$(function(){
  var EditRecipeView = Backbone.View.extend({
    template: $('#edit_recipe_template').html(),

    el: $('#app #recipe'),

    events: {
      "click #save": "save"
    },

    initialize: function() {
      this.model.bind('error', this.error, this);
    },

    render: function() {
      $(this.el).html(Mustache.to_html(this.template, this.model.toJSON().recipe));
    },

    save: function() {
      this.model.save({
        name: $(this.el).find('#name').val(),
        description: $(this.el).find('#description').val(),
        servings: $(this.el).find('#servings').val()
      });
    },

    error: function(model, resp, options) {
      console.log(resp);
    }
  });

  var DirectionsView = Backbone.View.extend({
    el: $('#app #directions'),

    initialize: function() {
      this.directions = this.options.directions;

      this.directions.bind('add',   this.addOne, this);
      this.directions.bind('reset', this.addAll, this);
      this.directions.bind('all',   this.render, this);
    },

    addOne: function(direction) {
      var view = new DirectionView({model: direction});
      $(this.el).append(view.render().el);
    },

    addAll: function() {
      this.directions.each(this.addOne, this);
    },

    render: function() {
    }
  });

  var IngredientsView = Backbone.View.extend({
    el: $('#app #ingredients'),

    initialize: function() {
      this.ingredients = this.options.ingredients;

      this.ingredients.bind('add',    this.addOne, this);
      this.ingredients.bind('reset',  this.addAll, this);
      this.ingredients.bind('all',    this.render, this);
    },

    addOne: function(ingredient) {
      var view = new IngredientView({model: ingredient});
      $(this.el).append(view.render().el);
    },

    addAll: function() {
      this.ingredients.each(this.addOne, this);
    },

    render: function() {
    }
  });

  var NewDirectionView = Backbone.View.extend({
    template: $('#new_direction_template').html(),

    el: $('#app #new_direction'),

    events: {
      "click .save"   : "save",
      "click .cancel" : "cancel"
    },

    initialize: function() {
      this.directions = this.options.directions;
      this.render();
    },

    render: function() {
      $(this.el).html(Mustache.to_html(this.template));
      return this;
    },

    save: function() {
      this.directions.create({text: $(this.el).find('.text').val()});
      $(this.el).find('.text').val('');
    },

    cancel: function() {
      $(this.el).find('.text').val('');
    }
  });

  var NewIngredientView = Backbone.View.extend({
    template: $('#new_ingredient_template').html(),

    el: $('#app #new_ingredient'),

    events: {
      "click .save"   : "save",
      "click .cancel" : "cancel"
    },

    initialize: function() {
      this.ingredients = this.options.ingredients;
      this.render();
    },

    render: function() {
      $(this.el).html(Mustache.to_html(this.template));
      return this;
    },

    save: function() {
      var ingredient = {
        how_much: $(this.el).find('.how_much').val(),
        ingredient_name: $(this.el).find('.ingredient_name').val(),
        preparation: $(this.el).find('.preparation').val()
      };

      this.ingredients.create(ingredient);
    },

    cancel: function() {
    }
  });

  var DirectionView = Backbone.View.extend({
    template: $('#direction_template').html(),

    className: 'direction',

    events: {
      "click .edit_link"            : "edit",
      "click .delete_link"          : "destroy",
      "click .edit .save"           : "save",
      "click .edit .cancel"         : "cancel"
    },

    initialize: function() {
      this.model.bind('change',   this.render, this);
      this.model.bind('destroy',  this.remove, this);

      this.editing = false;
    },

    render: function() {
      $(this.el).html(Mustache.to_html(this.template, this.model.toJSON().recipe_direction));

      $(this.el).find('.view').toggle(!this.editing);
      $(this.el).find('.edit').toggle(this.editing);

      return this;
    },

    remove: function() {
      $(this.el).remove();
    },

    edit: function() {
      this.editing = true;
      this.render();
    },

    destroy: function() {
      this.model.destroy();
    },

    save: function() {
      this.model.save({
        text: $(this.el).find('.edit .text').val()
      });
      this.editing = false;
      this.render();
    },

    cancel: function() {
      this.editing = false;
      this.render();
    }
  });

  var IngredientView = Backbone.View.extend({
    template: $('#ingredient_template').html(),

    className: 'ingredient',

    events: {
      "click .edit_link"            : "edit",
      "click .delete_link"          : "destroy",
      "click .edit .save"           : "save",
      "click .edit .cancel"         : "cancel"
    },

    initialize: function() {
      this.model.bind('change',   this.render, this);
      this.model.bind('destroy',  this.remove, this);

      this.editing = false;
    },

    render: function() {
      $(this.el).html(Mustache.to_html(this.template, this.model.toJSON().recipe_ingredient));

      $(this.el).find('.view').toggle(!this.editing);
      $(this.el).find('.edit').toggle(this.editing);

      return this;
    },

    remove: function() {
      $(this.el).remove();
    },

    edit: function() {
      this.editing = true;
      this.render();
    },

    destroy: function() {
      this.model.destroy();
    },

    save: function() {
      var ingredient = {
        how_much: $(this.el).find('.edit .how_much').val(),
        ingredient_name: $(this.el).find('.edit .ingredient_name').val(),
        preparation: $(this.el).find('.edit .preparation').val()
      };
      this.model.save(ingredient);
      this.editing = false;
      this.render();
    },

    cancel: function() {
      this.editing = false;
      this.render();
    }
  });

  var editRecipeView = new EditRecipeView({model: recipe});
  editRecipeView.render();

  var newDirectionView = new NewDirectionView({directions: recipe.directions});
  newDirectionView.render();

  var directionsView = new DirectionsView({directions: recipe.directions});
  directionsView.render();

  var newIngredientView = new NewIngredientView({ingredients: recipe.ingredients});
  newIngredientView.render();

  var ingredientsView = new IngredientsView({ingredients: recipe.ingredients});
  ingredientsView.render();

  //recipe.directions.create({text: "this is a test"});
});


