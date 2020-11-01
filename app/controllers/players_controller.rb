class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update]
  before_action :set_team
  def index
    @players = Player.where(team_id: @team.id)
  end

  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to "/teams/#{@team.id}/players"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @player.update(player_params)
    else
      render "edit"
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
  end

  private

  def player_params
    params.require(:player).permit(:name, :sex, :birthday, :main_position_id, :number, :at_pitch, :at_bat,
                                   :sub_position, :player_post, :staff_post, :carrer, :promotion).merge(team_id: current_team.id)
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

end
