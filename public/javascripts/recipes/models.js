$(function(){
  var RecipeDirection = Backbone.Model.extend({
    sync: function(method, model, options) {
     
      var response;

      if (method === 'create') {
        response = create_new_direction(model, options);
      } else if (method == 'update') {
      }
    }
  });

  var RecipeDirections = Backbone.Collection.extend({
    model: RecipeDirection,

    localStorage: new RecipeDirectionStore()
  });

  var RecipeDirectionView = Backbone.View.extend({
    tagName: "div"
  });
})();
