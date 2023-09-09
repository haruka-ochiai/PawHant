class CreatePetPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_posts do |t|

      t.timestamps
    end
  end
end
