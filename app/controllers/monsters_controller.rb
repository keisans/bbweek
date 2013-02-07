class MonstersController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @monsters = Monster.all
    respond_with @monsters
  end

  def show
    @monster = Monster.find(params[:id])
    respond_with @monster
  end

  def create
    @monster = Monster.new(params[:monster])
    monster_was_created = @monster.save

    respond_with @monster do |format|
      format.json{
        if monster_was_created
          render :json => @monster
        else
          render :json => { :errors => @monster.errors.full_messages }, :status => 422
        end
      }
    end
  end

  def edit
    @monster = Monster.find(params[:id])
    respond_with @monster
  end

  def update
    @monster = Monster.find(params[:id])
    monster_was_updated = @monster.update_attributes(params[:monster])

    respond_with @monster do |format|
      format.json{
        if monster_was_updated
          render :json => @monster
        else
          render :json => { :errors => @monster.errors.full_messages }, :status => 422
        end
      }
    end
  end

  def destroy
    Monster.find(params[:id]).delete
  end
end
