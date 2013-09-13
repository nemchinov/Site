class VacanciesController < ApplicationController
  def index
     @vacancy = Vacancy.all
     render text: "Vacancyes: <br/>" + @vacancy.map {|i| "#{i.title}: #{i.salary}: #{i.information}"}.join("<br/>")
  end
  def create
    @vacancy = Vacancy.create(title: params[:title],salary: params[:salary], duration: params[:duration], information: params[:information])
    render text: "#{@vacancy.id}: #{@vacancy.title} (#{!@vacancy.new_record?})"
    #http://localhost:3000/vacancies/create?title=BDMaker&salary=10000&duration=30&information=All+day
  end
end
