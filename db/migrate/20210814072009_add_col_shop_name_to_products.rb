class AddColShopNameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shop_name, :string
  end
end
