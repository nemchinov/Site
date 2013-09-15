class WorkersController < ApplicationController
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
    if (@worker = Worker.where(id: params[:id]).first)
      render "workers/show"
    else
      render text: "Page not found", status: 404
    end
  end

  # /workers/1 PUT
  def update

  end

  # /workers/1 DELETE
  def destroy

  end

  # /workers/edit GET
  def edit

  end

  # /workers/new GET
  def new

  end
end
