class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string   :title
      t.integer  :duration
      t.float    :salary
      t.string   :information
      t.timestamps
      t.timestamps
    end
  end
end
