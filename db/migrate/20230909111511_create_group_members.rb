class CreateGroupMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_members do |t|
      t.references :group, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
