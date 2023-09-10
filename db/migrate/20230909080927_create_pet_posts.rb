class CreatePetPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_posts do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :pet_status, null: false, default: 1
      t.integer :species, null: false, default: 0
      t.string :name, null: false
      t.integer :gender, null: false, default: 2
      t.string :age, null: false
      t.string :prefecture, null: false
      t.text :area, null: false
      t.date :occurred_on, null: false
      t.integer :weight, null: false, default: 1
      t.text :characteristics, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
