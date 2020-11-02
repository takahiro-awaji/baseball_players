class GamesController < ApplicationController
  before_action :set_team, only: [:new, :create, :show]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to "/teams/#{@team.id}"
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def game_params
    params.require(:game).permit(:gameday, :gametime, :opponent, :tournament_name, :field_name,
                                 :game_attribute, :total_stats_add, :top_or_bottom, :game_myteam_score, :game_opponent_score, 
                                 :game_result, :game_comment).merge(team_id: current_team.id)
  end

end