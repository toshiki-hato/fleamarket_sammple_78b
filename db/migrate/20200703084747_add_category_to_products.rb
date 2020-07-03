class AddCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :Products, :category

  end
end
