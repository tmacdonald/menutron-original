$(function() {

  var recipe_template = $("#recipe_template").html();
  var menu_recipe_template = $("#menu_recipe_template").html();
  var menu_ingredient_template = $("#menu_ingredient_template").html();

  var render_recipes = function() {
    for ( var i = 0; i < recipes.length; i++ ) {
      $('#recipes').append( Mustache.to_html( recipe_template, recipes[i] ) );
    }
    $('#recipes li').draggable( {
      helper: "clone"
    });
  };
  render_recipes();

  var render_menu_recipes = function() {
    $('#menu_recipes').html('');
    for ( var i = 0; i < menu.recipes.length; i++ ) {
      $('#menu_recipes').append( Mustache.to_html( menu_recipe_template, menu.recipes[i] ) );
    }
    $('#menu_recipes li').draggable( {
      helper: "clone"
    });
  };
  render_menu_recipes();

  function render_menu_ingredients()
  {
    for ( var i = 0; i < menu.ingredients.length; i++ ) {
      $('#menu_ingredients').append( Mustache.to_html( menu_ingredient_template, menu.ingredients[i] ) );
    }
  }

  $('#dropzone').droppable( {
    accept: "#recipes li",
    hoverClass: "ui-state-hover",
    drop: function( event, ui ) {
      
      $.ajax( {
        url: "/menus/" + menu.id + "/recipes.json",
        type: "POST",
        data: [
          { name: "menu_recipe[recipe_id]", value: ui.draggable.attr('id') },
          { name: "menu_recipe[menu_id]", value: menu.id }
        ],
        success: function( data ) { 
          menu.recipes.push( data );
          render_menu_recipes();
        }
      });
    }
  });

  $('#recipes').droppable( {
    accept: "#menu_recipes li",
    drop: function( event, ui ) {

      $.ajax( {
        url: "/menus/" + menu.id + "/recipes/" + ui.draggable.attr('id') + ".json",
        type: "POST",
        data: [
          { name: "_method", value: "delete" }
        ],
        success: function( data ) {
          console.log( "Successfully deleted recipe with id " + ui.draggable.attr('id') );
          $(ui.draggable).remove();
        }
      });
    }
  });
});
