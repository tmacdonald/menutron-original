$(document).ready( function() {

  //$('.destroy').hide();
  $('.direction.new').hide();

  function generate_direction_template() {
    var $template = $('<div></div>');
    $template.html( $('.direction:first').html().replace(/_0_/g, '_{index}_').replace(/\[0\]/g, '[{index}]') );
    return $template;
  }

  function generate_ingredient_template() {
    var $template = $('<div></div>');
    $template.html( $('.ingredient:first').html().replace(/_0_/g, '_{index}_').replace(/\[0\]/g, '[{index}]') );
    return $template;
  }

  function create_new_direction( $direction_template, direction ) {
    var index = $('.direction').length;
    var $direction = $('<div class="direction"></div>');
    $direction.html( $direction_template.html().replace(/\{index\}/g, index) );
    $direction.find('.text').val( direction.text );
    return $direction;
  }

  function create_new_ingredient( $ingredient_template, ingredient ) {
    var index = $('.ingredient').length;
    var $ingredient = $('<div class="ingredient"></div>');
    $ingredient.html( $ingredient_template.html().replace(/\{index\}/g, index) );
    $ingredient.find('.how_much').val( ingredient.how_much );
    $ingredient.find('.ingredient_name').val( ingredient.ingredient_name );
    $ingredient.find('.preparation').val( ingredient.preparation );
    return $ingredient;
  }

  $('#directions').delegate( '.direction .view .edit_link', 'click', function( e ) {
    e.preventDefault();

    var $view = $(e.target).closest('.view').hide();
    var $edit = $view.parent().find('.edit').show();
  });

  $('#directions').delegate( '.direction .view .delete_link', 'click', function( e ) {
    e.preventDefault();

    var $view = $(e.target).closest('.view');
    $view.closest('.direction').hide();
    var $edit = $view.parent().find('.edit');

    $edit.find('.destroy').attr('checked', 'checked');
  });

  $('#directions').delegate( '.direction .edit button', 'click', function( e ) {
    e.preventDefault();

    var $edit = $(e.target).closest('.edit').hide();
    var $view = $edit.parent().find('.view').show();
  });

  $('#directions').delegate( '.direction .edit .text', 'keyup', function( e ) {
    $view_div = $(e.target).closest('.edit').parent().find('.view');
    $view_div.html( Mustache.to_html( $('#direction_template').html(), { text: $(e.target).val() } ) );
  });

  $('.direction:not(.new)').each( function( i, e ) {
    make_direction_editable( $(e) );
  });

  function make_direction_editable( $target ) {
    var $edit_div = $('<div class="edit"></div>');
    var $view_div = $('<div class="view"></div>');
    $edit_div.html( $target.html() ).append('<button>Save</button>').hide();
    $view_div.html( Mustache.to_html( $('#direction_template').html(), { text: $target.find('.text').html() } ) );
    $target.html( '' ).append( $view_div ).append( $edit_div );
  }

  var $direction_template = generate_direction_template();
  
  //var $direction = create_new_direction( $direction_template, { text: 'This is another direction' } );
  //$('#directions').append( $direction );

  var $ingredient_template = generate_ingredient_template();
  
  //var $ingredient = create_new_ingredient( $ingredient_template, { how_much: '1 1/2 cups', ingredient_name: 'carrots', preparation: 'shredded' } );
  //$('#ingredients').append( $ingredient );
  
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
