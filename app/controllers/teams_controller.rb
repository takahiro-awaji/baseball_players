class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :stat]
  before_action :ensure_correct_team, only: [:edit, :update, :destroy]
  before_action :forbid_login_team, only: :top

  def index
    @teams = Team.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @players = Player.where(team_id: @team.id).order(created_at: :desc).limit(10)
    @games = Game.where(team_id: @team.id).order(gameday: :desc).limit(5)
    @game = @team.games.all
  end

  def edit
  end

  def update
    if @team.update(team_params)
    else
      render 'edit'
    end
  end

  def destroy
    team = Team.find_by!(team_url: params[:team_url])
    team.destroy
  end

  def search
    @teams = Team.search(params[:keyword]).page(params[:page]).per(10).order(created_at: :desc)
  end

  def stat
    @games = Game.where(team_id: @team.id)
    @players = Player.where(team_id: @team.id)
    @b_stats = BattingStat.where(game_id: @games.ids)
    @b_stats_p = @players.joins(:batting_stats).group('players.name')
    @p_stats = PitchingStat.where(game_id: @games.ids)
    @p_stats_p = @players.joins(:pitching_stats).group('players.name')
  end

  private

  def set_team
    @team = Team.find_by!(team_url: params[:team_url])
  end

  def team_params
    params.require(:team).permit(:team_name, :team_name_kana, :activity_base_id, :team_attribute_id, :team_level_id,
                                 :team_player_age_id, :team_player_history_id, :league, :team_title, :since_id,
                                 :activity_pace_id, :games_per_year_id, :team_slogan, :introduction, :image, activity_day: [])
  end

  def ensure_correct_team
    team = Team.find_by!(team_url: params[:team_url])
    redirect_to root_path if team != current_team
  end

  def forbid_login_team
    team = current_team
    redirect_to team_path(team.team_url) if team_signed_in?
  end
end
