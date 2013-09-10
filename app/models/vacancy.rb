class Vacancy < ActiveRecord::Base
  #attr_accessible :title, :salary, :duration, :information
  validates :duration, {numericality: { greater_than: 0}}
  validates :salary, {numericality: { greater_than: 0, allow_nil:  true}}
  validates :title, {presence: true}
  #validates :information, {allow_nil: true}
end
