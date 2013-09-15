class VacanciesController < ApplicationController
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
    if (@vacancy = Vacancy.where(id: params[:id]).first)
      render "vacancies/show"
    else
      render text: "Page not found", status: 404
    end
  end

  # /vacancy/1 PUT
  def update
    @vacancy = Vacancy.find(params[:id])
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

  end

  # /vacancy/edit GET
  def edit
    @vacancy = Vacancy.find(params[:id])
  end

  # /vacancy/new GET
  def new
      @vacancy=Vacancy.new
  end
end
