class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @user = current_user
    @user_games = @user.games
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:format])
  end

  # GET /games/new
  def new
    @game = Game.new(alignment_id: params[:alignment_id])
    redirect_to method: :post
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @alignment = Alignment.find(params[:alignment_id])
    # создаем игру для залогиненного юзера
    @game = Game.create_game_for_user!(current_user, @alignment) if current_user.present?
    # отправляемся на страницу игры
    if @game.present?
      redirect_to game_path(@game)
    else
      redirect_to @alignment, alert: 'Вам необходимо зарегестрироваться либо войти :)'
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.find(params[:format])
    @game.destroy
    redirect_to games_url, notice: 'Вы успешно удалили расклад'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:finished_at)
    end
end
