class ClientsController < BaseController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @clients = Client.all.paginate(:page => params[:page], :per_page => 10)
    respond_with @clients
  end

  def show
    respond_with @client
  end

  def new
    @client = Client.new
    respond_with @client
  end

  def edit
    respond_with @client
  end

  def create
    @client = Client.new client_params

    if @client.save
      flash[:notice] = "Cliente creado exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @client
  end

  def update
     if @client.update_attributes client_params
      flash[:notice] = "Cliente actualizado exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @client
  end

  def destroy
     if @client.destroy
      flash[:notice] = "Cliente eliminado exitosamente"
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @client
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.fetch(:client, {}).permit(:dni, :first_name, :last_name)
    end
end