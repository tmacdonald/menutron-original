$(function() {

  var generate_direction_template = function() {
    var $direction = $('.direction.new');
    var template = $direction.html();
    template = template.replace(/_\d+_/, '_{index}_');
    template = template.replace(/\[\d+\]/, '[{index}]');
    $direction.remove();
    return template;
  };

  var direction_template = generate_direction_template();
  //$('#directions').hide();

  var DirectionStore = function() {
  };
  _.extend(DirectionStore.prototype, {
    findAll: function() {
      var directions = [];

      $('.direction:not(.new)').each( function(i,e) {
        var $direction = $(e);
        var direction = {
          id: $direction.attr('id'),
          text: $direction.find('.text').html(),
          order: $direction.find('.order').val()
        };
        directions.push(direction);
      });

      return directions;
    },

    create: function(model) {
      var $direction = $('<div class="direction"></div>').html(direction_template.replace(/{index}/, $('.direction:not(.new)').length));
      $('#directions').append($direction);
      $direction.find('.text').html(model.get('text'));
      $direction.find('.order').val(model.get('order'));
      return model;
    },

    update: function(model) {
      var $direction = $('.direction#'+model.id);
      $direction.find('.text').html(model.get('text'));
      $direction.find('.order').val(model.get('order'));
      return model;
    },

    destroy: function(model) {
      var $direction = $('.direction#'+model.id);
      if ($direction.hasClass('new')) {
        $direction.remove();
      } else {
        $direction.find('.destroy').attr('checked', true);
      }
      return model;
    }
  });

  var Direction = Backbone.Model.extend({
  });

  var Directions = Backbone.Collection.extend({
    store: new DirectionStore()
  });

  Backbone.sync = function(method, model, options) {
    var store = model.store || model.collection.store;
    var response;

    switch (method) {
      case "read":    response = store.findAll(); break;
      case "create":  response = store.create(model); break;
      case "update":  response = store.update(model); break;
      case "delete":  response = store.destroy(model); break;
    }

    if (response) {
      options.success(response);
    } else {
      options.error("No descriptions found.");
    }
  };

  var App = {
    Views: {},
    Routers: {},
    init: function() {
      new App.Routers.Directions();
      Backbone.history.start();
    }
  };

  var DirectionView = Backbone.View.extend({
    className: 'direction',

    events: {
      "click .edit_link"          : "edit",
      "click .delete_link"        : "destroy",
      "click .edit .save"         : "save",
      "click .edit .cancel"       : "cancel"
    },

    initialize: function() {
      this.model.bind('change', this.render, this);
      this.model.bind('destroy', this.remove, this);
    },

    render: function() {
      $(this.el).html(Mustache.to_html($('#direction_template').html(), this.model.toJSON()));
      $(this.el).find('.edit').hide();
      console.log($(this.el).html());
      return this;
    },

    remove: function() {
      $(this.el).remove();
    },

    edit: function() {
      $(this.el).find('.edit').show();
      $(this.el).find('.view').hide();
    },

    destroy: function() {
      this.model.destroy();
    },

    save: function() {
      $(this.el).find('.edit').hide();
      this.model.save({
        text: $(this.el).find('.edit .text').val()
      });
      $(this.el).find('.view').show();
    },

    cancel: function(e) {
      e.preventDefault();
      $(this.el).find('.edit').hide();
      $(this.el).find('.view').show();
    }
  });

  App.Views.Index = Backbone.View.extend({
    el: $('#directions_list'),

    initialize: function() {
      this.directions = this.options.directions;

      this.directions.bind('add',   this.addOne, this);
      this.directions.bind('reset', this.addAll, this);
      this.directions.bind('all',   this.render, this);

      this.directions.fetch();
    },

    addOne: function(direction) {
      var view = new DirectionView({model: direction});
      $(this.el).append(view.render().el);
    },

    addAll: function() {
      this.directions.each(this.addOne, this);
    },

    render: function() {
    }
  });

  App.Views.NewDirection = Backbone.View.extend({
    events: {
      "click .save"     : "save",
      "click .cancel"   : "cancel"
    },

    initialize: function() {
      this.directions = this.options.directions;
      this.render();
    },

    render: function() {
      $(this.el).html(Mustache.to_html($('#new_direction_template').html()));
      $(this.el).appendTo($('body'));
    },

    save: function() {
      this.directions.create({text: $(this.el).find('.text').val()});
      $(this.el).find('.text').val('');
    },

    cancel: function(e) {
      e.preventDefault();
      $(this.el).find('.text.').val('');
    }
  });

  App.Routers.Directions = Backbone.Router.extend({
    routes: {
      "":     "index"
    },

    index: function() {
      var directions = new Directions();
      new App.Views.Index({directions: directions});
      new App.Views.NewDirection({directions: directions});
    }
  });

  App.init();


});

