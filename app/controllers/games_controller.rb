class GamesController < ApplicationController
  before_action :set_game, only: [:show, :destroy]
  before_action :authenticate_user!

  # GET /games
  def index
    @games = Game.all
    @user = User.find(params[:user_id])
    @user_games = @user.games
  end

  # GET /games/1
  def show

  end

  # POST /games
  def create
    @alignment = Alignment.find(params[:alignment_id])
    # создаем игру для залогиненного юзера
    @game = Game.create_game_for_user!(current_user, @alignment) if current_user.present?
    # отправляемся на страницу игры
    if @game.present?
      redirect_to game_path(@game)
    else
      redirect_to @alignment
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url(user_id: current_user.id), notice: 'Вы успешно удалили расклад'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:format])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:finished_at)
    end
end
