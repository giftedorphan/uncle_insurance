class BaseController < ApplicationController
  before_action :authenticate_user!

  def current_client
    @current_client = Client.friendly.find params[:client_id]
  end
end