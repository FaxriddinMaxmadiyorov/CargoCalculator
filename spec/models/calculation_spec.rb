require 'rails_helper'

RSpec.describe Calculation, type: :model do
  context 'validations' do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:middlename) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:width) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:dep_point) }
    it { should validate_presence_of(:dest_point) }
  end
end
