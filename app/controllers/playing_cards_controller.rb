class PlayingCardsController < ApplicationController
  before_action :set_playing_card, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  # GET /playing_cards
  # GET /playing_cards.json
  def index
    @playing_cards = PlayingCard.where(game_id: params[:game_id])
  end

  # GET /playing_cards/1
  def show
  end

  # GET /playing_cards/new
  def new
    @playing_card = PlayingCard.new
  end

  # GET /playing_cards/1/edit
  def edit
  end

  # POST /playing_cards
  # POST /playing_cards.json
  def create
    @playing_card = PlayingCard.new(playing_card_params)

    @playing_card.save!
    redirect_to @playing_card
  end

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
