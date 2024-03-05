require './cargo_calculator'

RSpec.describe CargoCalculator do
  describe 'input params' do
    it 'sets cargo params correctly' do
      cargo_calculator = CargoCalculator.new
      allow(cargo_calculator).to receive(:gets).and_return("10\n", "100\n", "50\n", "30\n")
      cargo_calculator.input_cargo_params
      expect(cargo_calculator.instance_variable_get(:@weight)).to eq(10.0)
      expect(cargo_calculator.instance_variable_get(:@length)).to eq(100.0)
      expect(cargo_calculator.instance_variable_get(:@width)).to eq(50.0)
      expect(cargo_calculator.instance_variable_get(:@height)).to eq(30.0)
    end

    it 'sets input params correctly' do
      cargo_calculator = CargoCalculator.new
      allow(cargo_calculator).to receive(:gets).and_return("Samarkand\n", "Tashkent\n")
      cargo_calculator.input_point_params
      expect(cargo_calculator.instance_variable_get(:@dep_point)).to eq("Samarkand")
      expect(cargo_calculator.instance_variable_get(:@dest_point)).to eq("Tashkent")
    end
  end

  describe '#calculate_distance' do
    it 'returns a fixed distance' do
      cargo_calculator = CargoCalculator.new
      expect(cargo_calculator.calculate_distance).to eq(100)
    end
  end

  describe '#calculate_price' do
    it 'calculates the price correctly' do
      cargo_calculator = CargoCalculator.new
      cargo_calculator.instance_variable_set(:@distance, 100)
      cargo_calculator.instance_variable_set(:@weight, 5)
      cargo_calculator.instance_variable_set(:@length, 50)
      cargo_calculator.instance_variable_set(:@width, 30)
      cargo_calculator.instance_variable_set(:@height, 20)

      cargo_calculator.calculate_price

      expect(cargo_calculator.instance_variable_get(:@price)).to eq(100)
    end
  end

  describe '#process' do
    it 'returns the result correctly' do
      cargo_calculator = CargoCalculator.new

      allow(cargo_calculator).to receive(:input_cargo_params)
      allow(cargo_calculator).to receive(:input_point_params)

      cargo_calculator.instance_variable_set(:@weight, 10.0)
      cargo_calculator.instance_variable_set(:@length, 1000.0)
      cargo_calculator.instance_variable_set(:@width, 50.0)
      cargo_calculator.instance_variable_set(:@height, 30.0)

      cargo_calculator.instance_variable_set(:@dep_point, 'Samarkand')
      cargo_calculator.instance_variable_set(:@dest_point, 'Tashkent')

      cargo_calculator.calculate_distance
      cargo_calculator.calculate_price

      result = { weight: 10.0, length: 1000.0, width: 50.0, height: 30.0, distance: 100, price: 200 }

      expect(cargo_calculator.process).to eq(result)
    end

    it 'returns the result correctly' do
      cargo_calculator = CargoCalculator.new

      allow(cargo_calculator).to receive(:input_cargo_params)
      allow(cargo_calculator).to receive(:input_point_params)

      cargo_calculator.instance_variable_set(:@weight, 10.01)
      cargo_calculator.instance_variable_set(:@length, 1000.0)
      cargo_calculator.instance_variable_set(:@width, 50.0)
      cargo_calculator.instance_variable_set(:@height, 30.0)

      cargo_calculator.instance_variable_set(:@dep_point, 'Samarkand')
      cargo_calculator.instance_variable_set(:@dest_point, 'Tashkent')

      cargo_calculator.calculate_distance
      cargo_calculator.calculate_price

      result = { weight: 10.01, length: 1000.0, width: 50.0, height: 30.0, distance: 100, price: 300 }

      expect(cargo_calculator.process).to eq(result)
    end
  end
end
