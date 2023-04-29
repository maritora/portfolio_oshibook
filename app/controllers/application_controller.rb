class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def index
      @user = User.find(params[:id])
    end
    def set_search
      @profiles = Profile.published
      @search = @profiles.ransack(params[:q])
      @search_profiles = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
    end

end
