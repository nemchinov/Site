class SkillsController < ApplicationController

  before_filter :find_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skill = Skill.all
  end

  # /skills/skills POST
  def create
    item_params = params.require(:skill).permit(:name)
    @skill = Skill.create(item_params)
    if @skill.errors.empty?
      redirect_to skill_path(@skill)
    else
      render "new"
    end
  end

  # /skills/1 GET
  def show
    if (@skill)
      render "skills/show"
    else
      render text: "Page not found", status: 404
    end
  end

  # /skills/1 PUT
  def update
    item_params = params.require(:skill).permit(:name)
    @skill.update_attributes(item_params)
    if @skill.errors.empty?
      redirect_to skill_path(@skill)
    else
      render "edit"
    end
  end

  # /skills/1 DELETE
  def destroy
    @skill.destroy
    redirect_to action: "index"
  end

  # /skills/edit GET
  def edit
  end

  # /skills/new GET
  def new
    @skill = Skill.new
  end

  private

  def find_skill
    @skill = Skill.find(params[:id])
  end

end
