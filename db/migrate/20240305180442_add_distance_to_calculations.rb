class AddDistanceToCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :calculations, :distance, :decimal
  end
end
