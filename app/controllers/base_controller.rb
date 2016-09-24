class BaseController < ApplicationController
  before_action :authenticate_user!

  def current_client
    Client.find params[:client_id]
  end
end