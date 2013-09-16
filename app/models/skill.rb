class Skill < ActiveRecord::Base
  private
  def app_params
    params.require(:Skill).permit(:name)
  end
  validates :name, {presence: true}
  validates :name, {uniqueness: true}

  has_and_belongs_to_many :workers
  has_and_belongs_to_many :vacancies
end
