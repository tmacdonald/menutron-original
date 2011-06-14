$(function() {

  _.templateSettings = {
    evaluate    : /<\?([\s\S]+?)\?>/g,
    interpolate : /<\?=([\s\S]+?)\?>/g
  };

  var recipe_template = _.template( $('#recipe_template').html() );
  var menu_template = _.template( $('#menu_template').html() );

  $.ajax({
    url: '/recipes.json',
    data: { page: 1 },
    success: recipe_fetch_success
  });

  function recipe_fetch_success( data ) {
    for ( var i = 0; i < data.length; i++ ) {
      $("#recipes").append( recipe_template( data[i] ) );
    }
  }

  $.ajax({
    url: '/menu/newest.json',
    data: {},
    success: menu_fetch_success
  });

  function menu_fetch_success( data ) {
    $('#menu').html( menu_template( data ) );
  }

});
