class AddIndexToVacancy < ActiveRecord::Migration
  def change
    add_index :vacancies , :title
    add_index :vacancies , :salary
  end
end
