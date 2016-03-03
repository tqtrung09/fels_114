class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :target_id
      t.string :action_type

      t.timestamps null: false
    end
    add_index :activities, :user_id
    add_index :activities, :target_id
    add_index :activities, [:user_id, :target_id], unique: true
  end
end
