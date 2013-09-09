class Worker < ActiveRecord::Base
  attr_accessible :name, :contacts, :status, :solaryDesire
  validates :salaryDesire, {numericality: { greater_than: 0, allow_nil:  true}}
  validates :status, {presence: true}
  validates :contacts, {allow_nil: false, presence: true}
end
