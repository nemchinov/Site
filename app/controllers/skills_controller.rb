class SkillsController < ApplicationController
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
    if (@skill = Skill.where(id: params[:id]).first)
      render "skills/show"
    else
      render text: "Page not found", status: 404
    end
  end

  # /skills/1 PUT
  def update
    @skill = Skill.find(params[:id])
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

  end

  # /skills/edit GET
  def edit
    @skill = Skill.find(params[:id])
  end

  # /skills/new GET
  def new
       @skill = Skill.new
  end

end
