class Calculation < ApplicationRecord
  validates :firstname, :lastname, :middlename, :phone_number, :email, :weight, :length, :width, :height, :dep_point, :dest_point, presence: true
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dep_point", "dest_point", "distance", "email", "firstname", "height", "id", "lastname", "length", "middlename", "phone_number", "price", "updated_at", "user_id", "weight", "width"]
  end
end
