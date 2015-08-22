class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.references :hunt, index: true, foreign_key: true
      t.string :description
      t.decimal :longitude
      t.decimal :latitude
      t.string :answer

      t.timestamps null: false
    end
  end
end
