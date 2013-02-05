class ContactsController < ApplicationController
	respond_to :html, :json, :xml

	def index
		@contacts = Contact.all
	end
	def show
	end
end
