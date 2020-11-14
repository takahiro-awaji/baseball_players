class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]
  before_action :ensure_correct_team, only: [:edit, :update, :destroy]
  before_action :forbid_login_user, only: :top

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
    team = Team.find(params[:id])
    team.destroy
  end

  def search
    @teams = Team.search(params[:keyword]).order(created_at: :desc)
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :team_name_kana, :activity_base_id, :team_attribute_id, :team_level_id,
                          :team_player_age_id, :team_player_history_id, :league, :team_title, :since_id, 
                          :activity_pace_id, :games_per_year_id, :team_slogan, :introduction, :image, activity_day: [])
  end

  def ensure_correct_team
    team = Team.find(params[:id])
    if team != current_team
      redirect_to root_path
    end
  end

  def forbid_login_user
    team = current_team
    if team_signed_in?
      redirect_to team_path(team)
    end
  end

end