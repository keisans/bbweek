// Backbone Week Day 4

window.App = {
	Models: {},
	Collections: {},
	Views: {},
	Router: {},
	Helpers: {}
};

App.Models.Monster = Backbone.Model.extend({
	/**
	 * Schema
	 * name [string]
	 * max_hp [int]
	 * current_hp [int]
	 * strength
	 * dexterity
	 * intelligence
	 * defense
	 */
	
	initialize: function(){
		if(this.get('max_hp') && !this.get('current_hp')){
			this.set('current_hp', this.get('max_hp'));
		}
	}
});

App.Collections.Monsters = Backbone.Collection.extend({
	model: App.Models.Monster,

	url: '/monsters'
});


App.Views.Monster = Backbone.View.extend({
	tagName: 'tr',

	attributes: {
		contenteditable: true
	},

	events: {
		'blur': 'updater'
	},

	template: _.template($('#monsterView').html()),

	render: function(){
		this.$el.html(this.template(this.model.toJSON()));

		return this;
	},

	updater: function(e){
		this.model.save({
			name: this.$('.name').text(),
			current_hp: this.$('.current_hp').text(),
			max_hp: this.$('.max_hp').text()
		});
	}

});

App.Views.Monsters = Backbone.View.extend({
	tagName: 'table',

	initialize: function(){
		this.collection.on('reset', this.render, this);
	},

	render: function(){
		this.collection.each(function(monster){
			var monsterView = new App.Views.Monster({model: monster});
			this.$el.append(monsterView.render().el);
		}, this);

		return this;
	}
});

$(function(){
	var monsters = new App.Collections.Monsters();

	monsters.fetch();

	var monstersView = new App.Views.Monsters({collection: monsters});

	$('#monsters').append(monstersView.render().el);
})







