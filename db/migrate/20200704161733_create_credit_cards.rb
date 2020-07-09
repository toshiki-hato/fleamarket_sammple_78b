class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :number,         null: false
      t.string :name,           null: false
      t.date :good_thru,        null: false
      t.string :security_code,  null: false
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
