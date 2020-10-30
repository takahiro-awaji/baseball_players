class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :url, :activity_base_id, :attribute_id,
                                                       :level_id, :player_age_id, :player_history_id, :league, :title,
                                                       :since_id, :activity_pace_id, :games_per_year_id, :slogan, 
                                                       :introduction, activity_day:[]])
  end
end
