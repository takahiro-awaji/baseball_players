class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]

  def index
  end

  def show
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

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :team_name_kana, :activity_base_id, :team_attribute_id, :team_level_id,
                          :team_player_age_id, :team_player_history_id, :league, :team_title, :since_id, 
                          :activity_pace_id, :games_per_year_id, :team_slogan, :introduction, activity_day: [])
  end
end