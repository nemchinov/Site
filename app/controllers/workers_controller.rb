class WorkersController < ApplicationController
  def index
    @worker = Worker.all
    render text: "Workers: <br/>" + @worker.map {|i| "#{i.name}: #{i.contacts}: #{i.status}: #{i.solaryDesire}"}.join("<br/>")
  end

  # /workers/workers POST
  def create
    @worker = Worker.create(name: params[:name],contacts: params[:contacts], status: params[:status], solaryDesire: params[:solaryDesire])
    render text: "#{@worker.id}: #{@worker.name} (#{!@worker.new_record?})"
    #http://localhost:3000/workers/create?name=Djon&contacts=USA&status=1&solarydesire=15000
  end

  # /workers/1 GET
  def show

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
