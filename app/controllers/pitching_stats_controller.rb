class PitchingStatsController < ApplicationController
  before_action :ensure_correct_team, only: [:new, :create]
  before_action :set_team, only: [:new, :create]
  before_action :set_players, only: [:new, :create]
  before_action :set_game, only: [:new, :create]

  def new
    @form = Form::PitchingStatCollection.new
  end

  def create
    @form = Form::PitchingStatCollection.new(pitching_stat_collection_params)
    if @form.save
      redirect_to team_game_path(@team.team_url, @game)
    else
      render :new
    end
  end

  private

  def pitching_stat_collection_params
    params.require(:form_pitching_stat_collection)
          .permit(pitching_stats_attributes: [:player_id, :pitching_order, :win_lose_or_save, :inning, :part_of_inning,
                                              :runs_allowed, :earned_run, :complete_game, :shutout, :hit_allowed,
                                              :homerun_allowed, :strikeout, :base_on_ball_or_hit_by_pitch,
                                              :balk, :wild_pitch, :game_id]).merge(game_id: params[:game_id])
  end

  def ensure_correct_team
    team = Team.find_by!(team_url: params[:team_team_url])
    redirect_to root_path if team != current_team
  end

  def set_team
    @team = Team.find_by!(team_url: params[:team_team_url])
  end

  def set_players
    @players = Player.where(team_id: @team.id).order(number: :asc)
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
