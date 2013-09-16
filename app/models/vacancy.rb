class Vacancy < ActiveRecord::Base
  #attr_accessible :title, :salary, :duration, :information
  private
    def app_params
      params.require(:Vacancy).permit(:title, :salary, :duration, :information)
    end
  validates :duration, {numericality: { greater_than: 0, presence: true}}
  validates :salary, {numericality: { greater_than: 0, allow_nil:  true}}
  validates :title, {presence: true}
  validates :information, {presence: true}

  has_and_belongs_to_many :skills
end
