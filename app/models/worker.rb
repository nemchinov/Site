class Worker < ActiveRecord::Base
  #attr_accessible :name, :contacts, :status, :solaryDesire
  private
  def app_params
    params.require(:Worker).permit(:name, :contacts, :status, :solaryDesire)
  end
  #validates :solaryDesire, {numericality: { greater_than: 0, allow_nil:  true}}
  #validates :status, :name, {presence: true}
  #validates :contacts, {allow_nil: false, presence: true}
end
