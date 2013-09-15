class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :nam
      t.timestampse
    end
  end
end
