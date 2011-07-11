$(function() {
 
  var recipe_template = $("#recipe_template").html();

  for ( var i = 0; i < recipes.length; i++ ) {
    $('#recipes').append( Mustache.to_html( recipe_template, recipes[i] ) );
  }
});
