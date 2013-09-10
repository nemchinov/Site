class VacanciesController < ApplicationController
  def index
     @vacancy = Vacancy.all
     render text: @vacancy.map {|i| "#{i.title}: #{i.salary}: #{i.information}"}.join("<br/>")
  end
end
