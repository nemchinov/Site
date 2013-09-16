# encoding: utf-8
class VacanciesController < ApplicationController

  before_filter :find_vacancy, only: [:show, :edit, :update, :destroy]

  def index
     @vacancy = Vacancy.all
  end

  # /vacancy/vacancy POST
  def create
    item_params = params.require(:vacancy).permit(:title, :salary, :duration, :information)
    @vacancy = Vacancy.create(item_params)
    if @vacancy.errors.empty?
      redirect_to vacancy_path(@vacancy)
    else
      render "new"
    end
  end

  # /vacancy/1 GET
  def show
    if (@vacancy)
      @time = @vacancy.created_at + @vacancy.duration*86400
      render "vacancies/show"
    else
      render text: "Page not found", status: 404
    end
  end

  # /vacancy/1 PUT
  def update
    item_params = params.require(:vacancy).permit(:title, :salary, :duration, :information)
    @vacancy.update_attributes(item_params)
    if @vacancy.errors.empty?
      redirect_to vacancy_path(@vacancy)
    else
      render "edit"
    end
  end

  # /vacancy/1 DELETE
  def destroy
    @vacancy.destroy
    redirect_to action: "index"
  end

  # /vacancy/edit GET
  def edit
  end

  # /vacancy/new GET
  def new
    @vacancy=Vacancy.new
  end

  def search
  end

  def AddSkill
    skill_id=params[:id].split('_')[1]
    vacancy_id=params[:id].split('_')[0]
    @skill = Skill.where(id: skill_id).first
    @vacancy = Vacancy.where(id: vacancy_id).first
    @vacancy.skills.push(@skill)
  end

  def RemoveSkill
    skill_id=params[:id].split('_')[1]
    vacancy_id=params[:id].split('_')[0]
    @skill = Skill.where(id: skill_id).first
    @vacancy = Vacancy.where(id: vacancy_id).first
    @vacancy.skills.delete(@skill)
  end

  private
  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
