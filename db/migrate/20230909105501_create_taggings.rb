class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.references :pet_post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる
    add_index :taggings, [:pet_post_id, :tag_id], unique: true
  end
end
