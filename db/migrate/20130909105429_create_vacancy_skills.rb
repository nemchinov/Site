class CreateVacancySkills < ActiveRecord::Migration
  def change
    create_table :vacancy_skills do |t|

      t.timestamps
    end
  end
end
