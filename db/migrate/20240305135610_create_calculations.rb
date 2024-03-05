class CreateCalculations < ActiveRecord::Migration[7.0]
  def change
    create_table :calculations do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :phone_number
      t.string :email
      t.decimal :weight
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.string :dep_point
      t.string :dest_point

      t.timestamps
    end
  end
end
