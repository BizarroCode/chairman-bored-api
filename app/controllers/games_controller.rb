class GamesController < ApplicationController
  before_action :set_game, only: %i[ show update destroy ]

  # GET /games
  def index
    @games = Game.where(nil)
    @games = @games.where("players_min <= ? AND players_max >= ?", params[:players], params[:players]) if params[:players].present?
    @games = @games.where("playtime <= ?", params[:playtime]) if params[:playtime].present?
    @games = @games.joins(:tags).where(tags: {id: params[:tag_ids]}) if params[:tag_ids].present?

    case params[:order]
    when 'playtime'
      @games = @games.order(:playtime)
    else
      @games = @games.order(:title)
    end

    @games = @games.distinct

    @pagy, @games = pagy(@games)

    # render json: @games, include: :tags
    render json: { games: @games.as_json(include: :tags), pagy: @pagy }
  end

  # GET /games/1
  def show
    render json: @game, include: :tags
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_game
    if params[:id] == 'rand'
      @game = Game.find(Game.pluck(:id).sample)
    else
      @game = Game.find(params[:id])
    end
  end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit!
    end
end
