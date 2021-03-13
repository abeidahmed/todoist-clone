class App::ApplicationController < ApplicationController
  layout "app"

  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to new_session_path, alert: { message: "Please sign up or log in to continue" } unless user_signed_in?
  end
end
