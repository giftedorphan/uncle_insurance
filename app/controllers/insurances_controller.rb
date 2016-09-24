class InsurancesController < BaseController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @insurances = current_client.insurances.paginate(:page => params[:page], :per_page => 10)
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

    respond_with @insurance
  end

  def update
     if @insurance.update_attributes insurance_params
      flash[:notice] = "Seguro actualizado exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @insurance
  end

  def destroy
     if @insurance.destroy
      flash[:notice] = "Seguro eliminado exitosamente"
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @insurance
  end

  private
    def set_insurance
      @insurance = current_client.insurances.find(params[:id])
    end

    def insurance_params
      params.fetch(:insurance, {}).permit(:client_id, :company_id, :link, :acquisition, :due_date)
    end
end