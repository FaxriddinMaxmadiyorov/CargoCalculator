require 'rails_helper'

RSpec.describe CalculationsController, type: :request do

  let(:calculation) { Calculation.create(weight: 10, length: 20, width: 30, height: 40,
    dep_point: 'Samarkand', dest_point: 'Tashkent', firstname: 'Fakhriddin', lastname: 'Makhmadiyorov',
    middlename: 'Khudoyor', phone_number: '+998882782006', email: 'makhmadiyorovfakhriddin@gmail.com') }

  describe 'POST #create' do
    it 'does not create a new calculation' do
      expect {
        post calculations_path, params: { calculation: { weight: 10, length: 20, width: 30, height: 40 } }
      }.to change(Calculation, :count).by(0)
    end

    it 'creates a new calculation' do
      expect {
        post calculations_path, params: { calculation: { weight: 10, length: 20, width: 30, height: 40,
          dep_point: 'Samarkand', dest_point: 'Tashkent', firstname: 'Fakhriddin', lastname: 'Makhmadiyorov',
          middlename: 'Khudoyor', phone_number: '+998882782006', email: 'makhmadiyorovfakhriddin@gmail.com' } }
      }.to change(Calculation, :count).by(1)
    end
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get calculations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    it 'updates the calculation' do
      calculation
      patch calculation_path(calculation), params: { calculation: { weight: 20 } }
      calculation.reload
      expect(calculation.weight).to eq(20)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the calculation' do
      calculation
      puts calculation.id
      expect {
        delete calculation_path(calculation)
      }.to change(Calculation, :count).by(-1)
    end
  end
end
