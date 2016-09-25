class CompaniesController < BaseController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @companies = Company.all.paginate(:page => params[:page], :per_page => 10)
    respond_with @companies
  end

  def show
    respond_with @company
  end

  def new
    @company = Company.new
    respond_with @company
  end

  def edit
    respond_with @company
  end

  def create
    @company = Company.new company_params

    if @company.save
      flash[:notice] = "Compañia creada exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @company
  end

  def update
     if @company.update_attributes company_params
      flash[:notice] = "Compañia actualizado exitosamente."
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @company
  end

  def destroy
     if @company.destroy
      flash[:notice] = "Compañia eliminada exitosamente"
    else
      flash[:error] = "Su solicitud no pudo ser procesada."
    end

    respond_with @company
  end

  private
    def set_company
      @company = Company.friendly.find(params[:id])
    end

    def company_params
      params.fetch(:company, {}).permit(:name)
    end
end