class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string  :name
      t.string  :contacts
      t.boolean :status
      t.float   :solaryDesire
      t.timestamps
    end
  end
end
