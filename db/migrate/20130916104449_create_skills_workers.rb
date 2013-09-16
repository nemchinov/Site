class CreateSkillsWorkers < ActiveRecord::Migration
  def change
    create_table :skills_workers, id: false do |t|
      t.integer :skill_id
      t.integer :worker_id
    end
  end
end
