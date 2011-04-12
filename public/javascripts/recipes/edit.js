$(document).ready( function() {

  var new_direction_template = $("#new_direction_template").html();
  var new_ingredient_template = $("#new_ingredient_template").html();

  function add_direction( text, order ) {
    var direction_count = $("#directions .direction").length;

    var params = {
      i: direction_count,
      text: text,
      order: order
    };

    $("#directions").append( Mustache.to_html( new_direction_template, params ) );
  }

  function add_ingredient( how_much, ingredient_name, preparation ) {
    var ingredient_count = $("#ingredients .ingredient").length;

    var params = {
      i: ingredient_count,
      how_much: how_much,
      ingredient_name: ingredient_name,
      preparation: preparation
    };

    $("#ingredients").append( Mustache.to_html( new_ingredient_template, params ) );
  }

});
