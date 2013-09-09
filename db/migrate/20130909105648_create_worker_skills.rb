class CreateWorkerSkills < ActiveRecord::Migration
  def change
    create_table :worker_skills do |t|

      t.timestamps
    end
  end
end
