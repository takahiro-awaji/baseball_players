class PlayersController < ApplicationController
  def new
    @player = Player.new
    @team = Team.find(params[:team_id])
  end
  
  def create
    @team = Team.find(params[:team_id])
    @player = Player.new(player_params)
    if @player.save
      redirect_to "/teams/#{@team.id}"
    else
      render 'new'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :sex, :birthday, :main_position_id, :number, :at_pitch, :at_bat,
                                   :sub_position, :player_post, :staff_post, :carrer, :promotion).merge(team_id: current_team.id)
  end

end
