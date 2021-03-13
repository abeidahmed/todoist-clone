class SessionsController < ApplicationController
  layout "slate"

  def new; end

  def create
    auth = Authentication.new(params)

    respond_to do |format|
      if auth.authenticated?
        sign_in(auth.user)
      else
        format.turbo_stream
        format.html { render :new }
        format.json { render json: { errors: { invalid: ["credentials"] } }, status: :unprocessable_entity }
      end
    end
  end
end
