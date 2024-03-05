class Calculation < ApplicationRecord
  validates :firstname, :lastname, :middlename, :phone_number, :email, :weight, :length, :width, :height, :dep_point, :dest_point, presence: true
end
