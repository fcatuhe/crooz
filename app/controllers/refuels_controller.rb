class RefuelsController < ApplicationController
  before_action :set_croozer

  def index
    @passages = @croozer.passages.refuels.includes(:passageable).order(started_on: :desc)
  end

  def new
    @refuel = Refuel.new
    @passage = Passage.new(started_on: Date.current)
  end

  def create
    @refuel = Refuel.new(refuel_params)
    @passage = Passage.new(passage_params.merge(croozer: @croozer, author: current_user, passageable: @refuel))

    if save_refuel
      redirect_to croozer_refuels_path(@croozer), notice: "Refuel logged."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_croozer
      @croozer = current_user.croozers.find(params[:croozer_id])
    end

    def save_refuel
      if @refuel.valid? && @passage.valid?
        Refuel.transaction do
          @refuel.save!
          @passage.save!
        end

        true
      else
        false
      end
    end

    def refuel_params
      params.require(:refuel).permit(:liters, :price_cents, :fuel_type, :full_tank)
    end

    def passage_params
      params.require(:passage).permit(:started_on, :start_reading, :end_reading)
    end
end
