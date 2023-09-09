class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :pet_post, null: false, foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
