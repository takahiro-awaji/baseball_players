class GamesController < ApplicationController
  before_action :set_team
  before_action :set_game, only: [:show, :edit, :update]
  before_action :ensure_correct_team, except: [:index, :show, :search]
  before_action :search_game, only: [:index, :search]

  def index
    @games = Game.where(team_id: @team.id).page(params[:page]).per(10).order(gameday: :desc)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to team_games_path(@team.team_url)
    else
      render 'new'
    end
  end

  def show
    @batting_stats = BattingStat.where(game_id: params[:id]).order(batting_order: :asc)
    @pitching_stats = PitchingStat.where(game_id: params[:id]).order(pitching_order: :asc)
  end

  def edit
  end

  def update
    if @game.update(game_params)
    else
      render 'edit'
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
  end

  def search
    # @s_games = Game.where(team_id: @team.id).search(params[:opponent_name]).page(params[:page]).per(10).order(gameday: :desc)
    @results = @g.result.where(team_id: @team.id).search(params[:opponent_name]).page(params[:page]).per(10).order(gameday: :desc)
  end

  private

  def set_team
    @team = Team.find_by!(team_url: params[:team_team_url])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:gameday, :gametime, :opponent, :tournament_name, :field_name,
                                 :game_attribute, :total_stats_add, :top_or_bottom, :game_myteam_score, :game_opponent_score,
                                 :game_result, :game_comment).merge(team_id: current_team.id)
  end

  def ensure_correct_team
    team = Team.find_by!(team_url: params[:team_team_url])
    redirect_to root_path if team != current_team
  end

  def search_game
    @g = Game.ransack(params[:q])
  end

end
