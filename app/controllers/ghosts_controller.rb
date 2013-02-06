class GhostsController < ApplicationController
  respond_to :html, :json, :xml

  def index
  	@ghosts = Ghost.all

  	respond_with @ghosts
  end

  def show
  	@ghost = Ghost.find(params[:id])
  	respond_with @ghost
  end

  def create
  	@ghost = Ghost.new(params[:ghost])
  	new_was_success = @ghost.save

  	respond_with @ghost do |format|
  		format.json{
  			if new_was_success
          		render :json => @ghost
        	else
          		render :json => { :errors => @ghost.errors.full_messages }, :status => 422
        	end
        }
  	end
  end

  def edit
  	@ghost = Ghost.find(params[:id])
  	respond_with @ghost
  end

  def update
  	@ghost = Ghost.find(params[:id])
    update_was_success = @ghost.update_attributes(params[:ghost])

    respond_with @ghost do |format|
  		format.json{
	  		if update_was_success
	          render :json => @ghost
	        else
	          render :json => { :errors => @ghost.errors.full_messages }, :status => 422
	        end
	    }
  	end

  end

  def destroy
    Ghost.find(params[:id]).delete
    redirect_to(:action => 'index')
  end


end
