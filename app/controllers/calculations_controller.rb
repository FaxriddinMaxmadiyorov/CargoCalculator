require './calculations/cargo_calculator'

class CalculationsController < ApplicationController
  before_action :set_calculation, only: %i[ show edit update destroy set_price]

  # GET /calculations or /calculations.json
  def index
    @calculations = Calculation.all
  end

  # GET /calculations/1 or /calculations/1.json
  def show
  end

  # GET /calculations/new
  def new
    @calculation = Calculation.new
  end

  # GET /calculations/1/edit
  def edit
  end

  # POST /calculations or /calculations.json
  def create
    @calculation = Calculation.new(calculation_params)

    respond_to do |format|
      if @calculation.save
        set_price
        format.html { redirect_to calculation_url(@calculation), notice: "Calculation was successfully created." }
        format.json { render :show, status: :created, location: @calculation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calculation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculations/1 or /calculations/1.json
  def update
    respond_to do |format|
      if @calculation.update(calculation_params)
        format.html { redirect_to calculation_url(@calculation), notice: "Calculation was successfully updated." }
        format.json { render :show, status: :ok, location: @calculation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calculation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculations/1 or /calculations/1.json
  def destroy
    @calculation.destroy

    respond_to do |format|
      format.html { redirect_to calculations_url, notice: "Calculation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculation
      @calculation = Calculation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calculation_params
      params.require(:calculation).permit(:firstname, :lastname, :middlename, :phone_number, :email, :weight, :length, :width, :height, :dep_point, :dest_point)
    end

    def set_price
      # CargoCalculator object
      cargo_calculator = Calculations::CargoCalculator.new
      cargo_calculator.weight = @calculation.weight

      cargo_calculator.length = @calculation.length
      cargo_calculator.width = @calculation.width
      cargo_calculator.height = @calculation.height
      cargo_calculator.calculate_distance
      cargo_calculator.calculate_price

      @calculation.update(price: cargo_calculator.price)
    end
end
