class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update]
  before_action :set_team
  before_action :ensure_correct_team, except: [:index, :show]

  def index
    @players = Player.where(team_id: @team).order(number: :asc)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to team_player_path(@team.team_url, @player.id)
    else
      render 'new'
    end
  end

  def show
    @batting_stats = BattingStat.all.where(player_id: @player.id)
    @batting_average = format('%.3f', @batting_stats.sum(:hit) / @batting_stats.sum(:at_hitting).to_f)
    @batting_on_base_percentage = format('%.3f', (@batting_stats.sum(:hit) + @batting_stats.sum(:walk) + @batting_stats.sum(:hit_by_pitch)) \
    / (@batting_stats.sum(:at_hitting) + @batting_stats.sum(:walk) + @batting_stats.sum(:hit_by_pitch) + @batting_stats.sum(:sacrifice_fly)).to_f)
    @batting_slugging_percentage = format('%.3f', (@batting_stats.sum(:hit) + (@batting_stats.sum(:double) * 2) + (@batting_stats.sum(:triple) * 3) \
    + (@batting_stats.sum(:homerun) * 4)) / @batting_stats.sum(:at_hitting).to_f)
    @batting_on_base_plus_slugging = format('%.3f', (@batting_stats.sum(:hit) + @batting_stats.sum(:walk) + @batting_stats.sum(:hit_by_pitch)) \
    / (@batting_stats.sum(:at_hitting) + @batting_stats.sum(:walk) + @batting_stats.sum(:hit_by_pitch) + @batting_stats.sum(:sacrifice_fly)).to_f \
    + (@batting_stats.sum(:hit) + (@batting_stats.sum(:double) * 2) + (@batting_stats.sum(:triple) * 3) + (@batting_stats.sum(:homerun) * 4)) / @batting_stats.sum(:at_hitting).to_f)

    @pitching_stats = PitchingStat.all.where(player_id: @player.id)
    @pitching_earned_run_average = format('%.2f', @pitching_stats.sum(:earned_run) * 7 / @pitching_stats.sum(:inning).to_f)
    @pitching_win_average = format('%.3f', @pitching_stats.where(win_lose_or_save: '勝').count / (@pitching_stats.where(win_lose_or_save: '勝').count + @pitching_stats.where(win_lose_or_save: '負').count).to_f)
    @pitching_strikeout_average = format('%.2f', @pitching_stats.sum(:strikeout) * 7 / @pitching_stats.sum(:inning).to_f)
  end

  def edit
  end

  def update
    if @player.update(player_params)
    else
      render 'edit'
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
  end

  private

  def player_params
    params.require(:player).permit(:name, :sex, :birthday, :main_position_id, :number, :at_pitch, :at_bat,
                                   :player_post, :staff_post, :carrer, :promotion, :image, :batting, :power,
                                   :running, :throwing, :fielding, :speedball, :control, :stamina, :breakingball,
                                   :fielding_of_pitcher, sub_position: []).merge(team_id: current_team.id)
  end

  def set_player
    @player = Player.find(params[:id])
    gon.player = @player
  end

  def set_team
    @team = Team.find_by(team_url: params[:team_team_url])
  end

  def ensure_correct_team
    team = Team.find_by!(team_url: params[:team_team_url])
    redirect_to root_path if team != current_team
  end
end
