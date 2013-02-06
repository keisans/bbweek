//Backbone Week Day 3

window.App = {
	Models: {},
	Collections: {},
	Views: {},
	Router: {},
	Helpers: {}
};

App.Models.Ghost = Backbone.Model.extend({
	defaults: {
		name: "Clyde",
		age: 33,
		color: "Orange",
		game: "Pac-Man"
	},

	validate: function(attrs){
		if(~~attrs.age < 0){
			return "age cannot be less than 0"
		}
	},

	talk: function(){
		return this.get('name') + ' says hi!';
	}
});

App.Collections.Ghosts = Backbone.Collection.extend({
	model: App.Models.Ghost,

	url: '/ghosts'
});

App.Views.Ghost = Backbone.View.extend({
	tagName: 'li',
	className: 'ghost',

	initialize: function(){
		this.model.on('destroy', this.unrender, this);
	},

	events: {
		'click .delete': 'destroyMe'
	},

	template: _.template($('#ghostTemplate').html()),

	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	},

	unrender: function(){
		this.remove();
	},

	destroyMe: function(e){
		e.preventDefault();
		this.model.destroy();
	}
});

App.Views.Ghosts = Backbone.View.extend({
	tagName: 'ul',

	initialize: function(){
		this.collection.on('add', this.addOne, this);
		this.collection.on('reset', this.render, this);
	},

	render: function(){
		this.collection.each(function(ghost){
			this.addOne(ghost);
		}, this);

		return this;
	},

	addOne: function(ghost){
		var ghostView = new App.Views.Ghost({model: ghost});
		this.$el.append(ghostView.render().el);
	}
});

App.Views.GhostForm = Backbone.View.extend({
	template: $('#ghostForm').html(),

	events: {
		'submit': 'addGhost'
	},

	render: function(){
		this.$el.html(this.template);

		return this;
	},

	addGhost: function(e){
		e.preventDefault();

		var name = this.$('#name').val(),
			age = this.$('#age').val(),
			color = this.$('#color').val(),
			game = this.$('#game').val();

		this.collection.create({name: name, age: age, color: color, game: game});

		this.$('input[type="text"]').val('');
	}

});

$(function(){
	ghosts = new App.Collections.Ghosts();

	ghostsView = new App.Views.Ghosts({collection: ghosts});

	ghostForm = new App.Views.GhostForm({collection: ghosts});

	$('#ghosts').append(ghostForm.render().el);

	$('#ghosts').append(ghostsView.render().el);
});
