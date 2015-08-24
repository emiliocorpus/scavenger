class CreateScavengerHunts < ActiveRecord::Migration
  def change
    create_table :scavenger_hunts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hunt, index: true, foreign_key: true
      t.boolean :completed, default: false
      t.integer :current_clue_number, default: 1

      t.timestamps null: false

    end
  end
end
