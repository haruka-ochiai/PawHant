class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :reporter, null: false, foreign_key: { to_table: :customers }
      t.references :reported, null: false, foreign_key: { to_table: :customers }
      t. :content, null: false, polymorphic: true
      t.integer :reason, null: false
      t.integer :report_status, default: 0

      t.timestamps
    end
  end
end
