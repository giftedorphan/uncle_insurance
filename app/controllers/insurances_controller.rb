class InsurancesController < BaseController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    if params[:date]
      @insurances = Insurance.search_date(params[:date]).joins(:client).merge(
                              Client.order(first_name: :asc)).search_dni(params[:dni]).paginate(
                                :page => params[:page], :per_page => params[:per_page] || 10)
    else
      @insurances = current_client.insurances.joins(:client).merge(
                              Client.order(first_name: :asc)).paginate(:page => params[:page], :per_page => 10)
    end

    respond_with @insurances
  end

  def show
    respond_with @insurance
  end

  def new
    @insurance = current_client.insurances.new
    respond_with @insurance
  end

  def edit
    respond_with @insurance
  end

  def create
    @insurance = current_client.insurances.new insurance_params

    if @insurance.save
      flash[:notice] = "Seguro asociado exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @insurance, location: client_insurances_path(current_client)
  end

  def update
     if @insurance.update_attributes insurance_params
      flash[:notice] = "Seguro actualizado exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @insurance, location: client_insurances_path(current_client)
  end

  def destroy
     if @insurance.destroy
      flash[:notice] = "Seguro eliminado exitosamente"
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @insurance, location: client_insurances_path(current_client)
  end

  private
    def set_insurance
      @insurance = current_client.insurances.friendly.find(params[:id])
    end

    def insurance_params
      params.fetch(:insurance, {}).permit(:company_id, :link, :renovation, :payment, :comments, :acquisition, :due_date)
    end
end