class AddPriceToCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :calculations, :price, :decimal
  end
end
