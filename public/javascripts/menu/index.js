$(function() {

  _.templateSettings = {
    evaluate    : /<\?([\s\S]+?)\?>/g,
    interpolate : /<\?=([\s\S]+?)\?>/g
  };

  var recipe_template = _.template( $('#recipe_template').html() );

  $.ajax({
    url: '/recipes.json',
    data: { page: 1 },
    success: function( data ) {
      for ( var i in data ) {
        $('#recipe_table').append( recipe_template( data[i] ) );
      }
    }
  });
});
