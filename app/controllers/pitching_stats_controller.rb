class PitchingStatsController < ApplicationController

  def new
    @form = Form::PitchingStatCollection.new
    @team = Team.find(params[:team_id])
    @game = Game.find(params[:game_id])
    @players = Player.where(team_id: @team.id).order(number: :asc)
  end

  def create
    @team = Team.find(params[:team_id])
    @players = Player.where(team_id: @team.id).order(number: :asc)
    @game = Game.find(params[:game_id])
    @form = Form::PitchingStatCollection.new(pitching_stat_collection_params)
    if @form.save
      redirect_to root_path
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

end
