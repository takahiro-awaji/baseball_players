class BattingStatsController < ApplicationController

  def new
    @form = Form::BattingStatCollection.new
    @team = Team.find(params[:team_id])
    @game = Game.find(params[:game_id])
    # @player = Player.find(params[:player_id])
    @players = Player.where(team_id: @team.id).order(number: :asc)
  end

  def create
    @team = Team.find(params[:team_id])
    @players = Player.where(team_id: @team.id).order(number: :asc)
    @form = Form::BattingStatCollection.new(batting_stat_collection_params)
    @game = Game.find(params[:game_id])
    if @form.save
      redirect_to root_path
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

end