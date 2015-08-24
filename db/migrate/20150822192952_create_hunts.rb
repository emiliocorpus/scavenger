class CreateHunts < ActiveRecord::Migration
  def change
    create_table :hunts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.float :longitude
      t.float :latitude
      t.timestamps null: false
    end
  end
end
