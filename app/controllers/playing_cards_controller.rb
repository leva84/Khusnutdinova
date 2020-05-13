class PlayingCardsController < ApplicationController
  before_action :set_playing_card
  before_action :authenticate_user!

  # PATCH/PUT /playing_cards/1
  def update
    if @playing_card.update(playing_card_params)
      redirect_to @playing_card.game, notice: 'Ваш замечательный ответ сохранен :)'
    else
      render :edit
    end
  end

  private

  def set_playing_card
    @playing_card = PlayingCard.find(params[:id])
  end

  def playing_card_params
    params.require(:playing_card).permit(:answer)
  end
end
