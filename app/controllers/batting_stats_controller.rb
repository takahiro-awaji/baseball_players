class BattingStatsController < ApplicationController
  before_action :ensure_correct_team, only: [:new, :create]
  before_action :set_team, only: [:new, :create]
  before_action :set_players, only: [:new, :create]
  before_action :set_game, only: [:new, :create]

  def new
    @form = Form::BattingStatCollection.new
  end

  def create
    @form = Form::BattingStatCollection.new(batting_stat_collection_params)
    if @form.save
      redirect_to team_game_path(@team.team_url, @game)
    else
      render :new
    end

  end

  private

  def batting_stat_collection_params
      params.require(:form_batting_stat_collection)
      .permit(batting_stats_attributes: [:player_id, :at_field, :batting_order, :fielding_position, :at_standing, :at_hitting,
                                          :hit, :run_batted_in, :run, :stolen_base, :double, :triple, :homerun,
                                          :strikeout, :walk, :hit_by_pitch, :sacrifice_bunt, :sacrifice_fly,
                                          :double_play, :opponent_error, :fielding_error, :game_id]).merge(game_id: params[:game_id])
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