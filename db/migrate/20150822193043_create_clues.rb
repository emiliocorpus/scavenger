class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.references :hunt, index: true, foreign_key: true
      t.string :description
      t.float :longitude
      t.float :latitude
      t.string :answer

      t.timestamps null: false
    end
  end
end
