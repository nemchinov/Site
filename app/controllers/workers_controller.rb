# encoding: utf-8
class WorkersController < ApplicationController

  before_filter :find_worker, only: [:show, :edit, :update, :destroy, :search]

  def index
    @workers = Worker.all
    #render text: "Workers: <br/>" + @worker.map {|i| "#{i.name}: #{i.contacts}: #{i.status}: #{i.solaryDesire}"}.join("<br/>")
  end

  # /workers/workers POST
  def create
    item_params = params.require(:worker).permit(:name,:contacts,:status,:solaryDesire)
    @worker = Worker.create(item_params)
    #@worker = Worker.create(name: params[:name],contacts: params[:contacts], status: params[:status], solaryDesire: params[:solaryDesire])
    if @worker.errors.empty?
      redirect_to worker_path(@worker)
    else
      render "new"
    end
    #render text: "#{@worker.id}: #{@worker.name} (#{!@worker.new_record?})"
    #http://localhost:3000/workers/create?name=Djon&contacts=USA&status=1&solarydesire=15000
  end

  # /workers/1 GET
  def show
    if (@worker)
      if(@worker.status)
        @status="да"
      else
        @status="нет"
      end
      render "workers/show"
    else
      render text: "Page not found", status: 404
    end
  end

  # /workers/1 PUT
  def update
    item_params = params.require(:worker).permit(:name,:contacts,:status,:solaryDesire)
    @worker.update_attributes(item_params)
    if @worker.errors.empty?
      redirect_to worker_path(@worker)
    else
      render "edit"
    end
  end

  # /workers/1 DELETE
  def destroy
    @worker.destroy
    redirect_to action: "index"
  end

  # /workers/edit GET
  def edit
  end

  # /workers/new GET
  def new
    @worker=Worker.new
  end

  def find_vacancies
    @vacancy=Vacancy.where("duration > 0")
    render "index"
  end

  def search
  end

  def AddSkill
    skill_id=params[:id].split('_')[1]
    worker_id=params[:id].split('_')[0]
    puts skill_id
    puts worker_id
    @skill = Skill.where(id: skill_id).first
    @worker = Worker.where(id: worker_id).first
    @worker.skills.push(@skill)
  end

  def RemoveSkill
    skill_id=params[:id].split('_')[1]
    worker_id=params[:id].split('_')[0]
    @skill = Skill.where(id: skill_id).first
    @worker = Worker.where(id: worker_id).first
    @worker.skills.delete(@skill)
  end

  private

  def find_worker
    @worker = Worker.find(params[:id])
  end
end
