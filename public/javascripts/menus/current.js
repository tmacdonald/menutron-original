window.Menu = Backbone.Model.extend({});

$(function(){

  $("#menu").append( Mustache.to_html( $("#menu_template").html(), menu ) );
 
  for ( var i = 0; len = menu.recipes.length, i < len; i++ ) {
    $("#menu").append( Mustache.to_html( $("#recipe_template").html(), menu.recipes[i] ) );
  }
 
  /*
  $.ajax({
    url: "/menus/current.json",
    success: menu_success
  });

  function menu_success( data ) {
    console.log( data.name );
    console.log( data.recipes );
    console.log( data.ingredients );
  }
  */
});
