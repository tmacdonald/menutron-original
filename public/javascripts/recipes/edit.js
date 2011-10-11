(function($) {
  $.fn.editable_direction = function( options ) {
    var opts = $.extend({}, $.fn.editable_direction.defaults, options);

    return this.each( function() {
      var $this = $(this);
      var is_new = $this.hasClass('new');  

      var o = $.meta ? $.extend({}, opts, $this.data()) : opts;

      var $edit_div = $('<div class="edit_direction"></div>');
      var $view_div = $('<div class="view_direction"></div>');

      var $save_button = $('<a class="save">Save</a>');

      $edit_div.html( $this.html() ).append( $save_button ).hide();
      var $edit_button = $('<a class="edit">Edit</a>');
      var $delete_button = $('<a class="delete">Delete</a>');
      update_view_div();
      $this.html( '' ).append( $view_div ).append( $edit_div );

      function edit_button_click( e ) {
        e.preventDefault();

        $view_div.hide();
        $edit_div.show();
      }

      function delete_button_click( e ) {
        e.preventDefault();
        
        if ( is_new ) {
          $this.remove();
        } else {
          $edit_div.find('.destroy').attr( 'checked', 'checked' );
          $this.hide();
        }
      }

      $save_button.click( function( e ) {
        e.preventDefault();

        update_view_div();

        $view_div.show();
        $edit_div.hide();
      });

      function update_view_div() {
        $view_div.html( Mustache.to_html( opts.view_template, { text: $edit_div.find('.text').val() } ) );
        $('<div class="operations"></div>').append( $edit_button ).append( $delete_button ).appendTo( $view_div );
        $edit_button.click( edit_button_click );
        $delete_button.click( delete_button_click );
      }
    });
  };

  $.fn.editable_direction.defaults = {
    view_template: '<span class="text">{{ text }}</span>'
  };
})(jQuery);

(function($) {
  $.fn.editable_ingredient = function( options ) {
    var opts = $.extend({}, $.fn.editable_ingredient.defaults, options);

    return this.each( function() {
      var $this = $(this);
      var is_new = $this.hasClass('new');  

      var o = $.meta ? $.extend({}, opts, $this.data()) : opts;

      var $edit_div = $('<div class="edit_ingredient"></div>');
      var $view_div = $('<div class="view_ingredient"></div>');

      var $save_button = $('<a class="save">Save</a>');

      $edit_div.html( $this.html() ).append( $save_button ).hide();
      var $edit_button = $('<a class="edit">Edit</a>');
      var $delete_button = $('<a class="delete">Delete</a>');
      update_view_div();
      $this.html( '' ).append( $view_div ).append( $edit_div );

      function edit_button_click( e ) {
        e.preventDefault();

        $view_div.hide();
        $edit_div.show();
      }

      function delete_button_click( e ) {
        e.preventDefault();
        
        if ( is_new ) {
          $this.remove();
        } else {
          $edit_div.find('.destroy').attr( 'checked', 'checked' );
          $this.hide();
        }
      }

      $save_button.click( function( e ) {
        e.preventDefault();

        update_view_div();

        $view_div.show();
        $edit_div.hide();
      });

      function update_view_div() {
        $view_div.html( Mustache.to_html( opts.view_template, 
        {
          how_much: $edit_div.find('.how_much').val(),
          ingredient_name: $edit_div.find('.ingredient_name').val(),
          preparation: $edit_div.find('.preparation').val()
        } ) );
        $('<div class="operations"></div>').append( $edit_button ).append( $delete_button ).appendTo( $view_div );
        $edit_button.click( edit_button_click );
        $delete_button.click( delete_button_click );
      }
    });
  };

  $.fn.editable_ingredient.defaults = {
    view_template: '<span class="how_much">{{ how_much }}</span><span class="ingredient_name">{{ ingredient_name }}</span><span class="preparation">{{ preparation }}</span>'
  };
})(jQuery);
$(document).ready( function() {

  //$('.destroy').hide();
  $('.ingredient.new, .direction.new').hide();

  function generate_direction_template() {
    var $template = $('<div></div>');
    $template.html( $('.direction.new:first').html().replace(/_\d+_/g, '_{index}_').replace(/\[\d+\]/g, '[{index}]') );
    return $template;
  }

  function generate_ingredient_template() {
    var $template = $('<div></div>');
    $template.html( $('.ingredient.new:first').html().replace(/_\d+_/g, '_{index}_').replace(/\[\d+\]/g, '[{index}]') );
    return $template;
  }

  function create_new_direction( $direction_template, direction ) {
    var index = $('.direction:not(.new)').length;
    var $direction = $('<div class="direction"></div>');
    $direction.html( $direction_template.html().replace(/\{index\}/g, index) );
    $direction.find('.text').html( direction.text );
    return $direction;
  }

  function create_new_ingredient( $ingredient_template, ingredient ) {
    var index = $('.ingredient:not(.new)').length;
    var $ingredient = $('<div class="ingredient"></div>');
    $ingredient.html( $ingredient_template.html().replace(/\{index\}/g, index) );
    $ingredient.find('.how_much').val( ingredient.how_much );
    $ingredient.find('.ingredient_name').val( ingredient.ingredient_name );
    $ingredient.find('.preparation').val( ingredient.preparation );
    return $ingredient;
  }

  $('.direction:not(.new)').editable_direction();
  $('.ingredient:not(.new)').editable_ingredient();

  var $direction_template = generate_direction_template();
  
  var $direction = create_new_direction( $direction_template, { text: 'This is another direction' } );
  $('#directions').append( $direction );
  $direction.editable_direction();

  var $ingredient_template = generate_ingredient_template();

  var $ingredient = create_new_ingredient( $ingredient_template, { how_much: '1 lb', ingredient_name: 'flour', preparation: '' } );
  $('#ingredients').append( $ingredient );
  //$ingredient.editable_ingredient();
  
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
