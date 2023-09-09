class CreateCustomerPets < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_pets do |t|

      t.timestamps
    end
  end
end
