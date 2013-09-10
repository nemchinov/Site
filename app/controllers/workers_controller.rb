class WorkersController < ApplicationController
  def index
    @worker = Worker.all
    render text: @worker.map {|i| "#{i.name}: #{i.contacts}: #{i.status}: #{i.solaryDesire}"}.join("<br/>")
  end
end
