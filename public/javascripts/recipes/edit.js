$(document).ready( function() {

  $('.destroy').hide();

  /*
  var new_direction_template = $("#new_direction_template").html();
  var new_ingredient_template = $("#new_ingredient_template").html();

  function add_direction( text ) {
    var direction_count = $("#directions .direction").length;

    var params = {
      i: direction_count,
      text: text,
      order: direction_count
    };

    $("#directions").append( Mustache.to_html( new_direction_template, params ) );
  }

  function add_ingredient( how_much, ingredient_name, preparation ) {
    var ingredient_count = $("#ingredients .ingredient").length;

    var params = {
      i: ingredient_count,
      how_much: how_much,
      ingredient_name: ingredient_name,
      preparation: preparation,
      order: ingredient_count
    };

    $("#ingredients").append( Mustache.to_html( new_ingredient_template, params ) );
  }

  $("#add_ingredient").click( onclick_add_ingredient );
  $("#add_direction").click( onclick_add_direction );

  function onclick_add_ingredient( e ) {
    add_ingredient( $("#how_much").val(), $("#ingredient_name").val(), $("#preparation").val() );
    $("#ingredient_form :input").val( "" );
    $("#how_much").focus();

    e.preventDefault();
    return false;
  }

  function onclick_add_direction( e ) {
    add_direction( $("#text").val() );
    $("#direction_form :input").val( "" );
    $("#text").focus();

    e.preventDefault();
    return false;
  }
  */

});
