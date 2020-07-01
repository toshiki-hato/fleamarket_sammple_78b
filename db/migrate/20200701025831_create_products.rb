class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :price, null: false
      t.string :status, null: false
      t.string :shipping_expenses, null: false
      t.string :send_from, null: false
      t.string :lead_time, null: false

      t.timestamps
    end
  end
end
