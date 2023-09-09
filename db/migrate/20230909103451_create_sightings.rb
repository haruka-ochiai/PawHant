class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :pet_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
