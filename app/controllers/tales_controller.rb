class TalesController < ApplicationController
  before_action :set_croozer

  def index
    @passages = @croozer.passages.tales.includes(:passageable).order(started_on: :desc)
  end

  def new
    @tale = Tale.new
    @passage = Passage.new(started_on: Date.current)
  end

  def create
    @tale = Tale.new(tale_params)
    @passage = Passage.new(passage_params.merge(croozer: @croozer, author: current_user, passageable: @tale))

    if save_tale
      redirect_to croozer_tales_path(@croozer), notice: "Tale published."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tale = Tale.joins(:passage).where(passages: { croozer_id: @croozer.id }).find(params[:id])
  end

  private
    def set_croozer
      @croozer = current_user.croozers.find(params[:croozer_id])
    end

    def save_tale
      if @tale.valid? && @passage.valid?
        Tale.transaction do
          @tale.save!
          @passage.save!
        end

        true
      else
        false
      end
    end

    def tale_params
      params.require(:tale).permit(:title, :body)
    end

    def passage_params
      params.require(:passage).permit(:started_on)
    end
end
