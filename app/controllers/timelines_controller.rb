class TimelinesController < ApplicationController
  def show
    @croozer = current_user.croozer

    if @croozer
      @passages = @croozer.passages.includes(:passageable).order(started_on: :desc)
    else
      redirect_to new_croozer_path, alert: "Add a car to start your timeline."
    end
  end
end
