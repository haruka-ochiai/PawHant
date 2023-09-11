class RemoveNameFromPetPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :pet_posts, :name
  end
end
