//Backbone Week Day 3

var Ghost = Backbone.Model.extend({
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

var Ghosts = Backbone.Collection.extend({
	model: Ghost
});

var GhostView = Backbone.View.extend({
	tagName: 'li',
	className: 'ghost',

	template: _.template($('#ghostTemplate').html()),

	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	}
});

var GhostsView = Backbone.View.extend({
	tagName: 'ul',

	initialize: function(){
		this.collection.on('add', this.addOne, this);
	},

	render: function(){
		this.collection.each(function(ghost){
			this.addOne(ghost);
		}, this);

		return this;
	},

	addOne: function(ghost){
		var ghostView = new GhostView({model: ghost});
		this.$el.append(ghostView.render().el);
	}
});

$(function(){

	ghosts = new Ghosts([
		{name: "Inky", color: "Blue"}, 
		{name: "Blinky", color: "Red"}, 
		{name: "Pinky", color: "Pink"}, 
		{name: "Clyde", color: "Orange"}, 
		{name: "Sue", color: "Orange", game: "Ms. Pac-Man", age: 31}
	]);

	ghostsView = new GhostsView({collection: ghosts});
	ghostFormView = new GhostFormView({collection: ghosts});

	$('#ghosts').append(ghostFormView.render().el);

	$('#ghosts').append(ghostsView.render().el);
})
