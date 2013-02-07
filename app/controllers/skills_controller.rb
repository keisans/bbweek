class SkillsController < ApplicationController
  respond_to :html, :json, :xml

  def index
  	@skills = Skill.all
  	respond_with @skills
  end

  def show
  	@skill = Skill.find(params[:id])
  	respond_with @skill
  end

  def create
  	@skill = Skill.new(params[:skill])
  	skill_was_created = @skill.save

  	respond_with @skill do |format|
  		format.json{
  			if skill_was_created
  				render :json => @skill
  			else
  				render :json => { :errors => @monster.errors.full_messages }, :status => 422
  			end
  		}
  	end
  end
end
