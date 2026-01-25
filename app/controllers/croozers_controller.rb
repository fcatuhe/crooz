class CroozersController < ApplicationController
  before_action :set_croozer, only: :show

  def new
    @croozer = Croozer.new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @croozer = Croozer.new(croozer_params.merge(croozable: @car, tender: current_user.tender || current_user.create_tender!))

    if save_croozer
      redirect_to croozer_path(@croozer), notice: "Car added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @average_consumption = @croozer.average_consumption
    @recent_passages = @croozer.passages.includes(:passageable).order(started_on: :desc).limit(5)
  end

  private
    def set_croozer
      @croozer = current_user.croozers.find(params[:id])
    end

    def save_croozer
      if @croozer.valid? && @car.valid?
        Croozer.transaction do
          @car.save!
          @croozer.save!
        end

        true
      else
        false
      end
    end

    def croozer_params
      params.require(:croozer).permit(:name, :reading_type, :reading_unit)
    end

    def car_params
      params.require(:car).permit(:make, :model, :year)
    end
end
