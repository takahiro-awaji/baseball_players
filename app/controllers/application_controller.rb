class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:team_name, :team_name_kana, :team_url, :activity_base_id, :team_attribute_id,
                                                       :team_level_id, :team_player_age_id, :team_player_history_id, :league, :team_title,
                                                       :since_id, :activity_pace_id, :games_per_year_id, :team_slogan, :image,
                                                       :introduction, activity_day: []])
  end

  def after_sign_up_path_for(resource)
    team_path(resource)
  end

  def after_sign_in_path_for(resource)
    team_path(resource)
  end
end
