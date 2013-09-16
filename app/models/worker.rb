# encoding: utf-8
class Worker < ActiveRecord::Base
  #attr_accessible :name, :contacts, :status, :solaryDesire
  private
  def app_params
    params.require(:Worker).permit(:name, :contacts, :status, :solaryDesire)
  end
  validates :solaryDesire, {numericality: { greater_than: 0, allow_nil:  true}}
  validates :name, {presence: true}
  validates :contacts, {allow_nil: false, presence: true}
  validates :name, format: {with: /\A+[а-яА-ЯёЁ]+\s+[а-яА-ЯёЁ]+\s+[а-яА-ЯёЁ]+\z/ }
  validates :contacts, format: {with: /\A+@|[0123456789+]+\z/ }
  has_and_belongs_to_many :skills
end
