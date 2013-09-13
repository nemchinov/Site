class Skill < ActiveRecord::Base
  private
  def app_params
    params.require(:Skill).permit(:name)
  end
  validates :name, {presence: true}
  validates :name, {uniqueness: true}
end
