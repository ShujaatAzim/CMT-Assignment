class ProvidersController < ApplicationController

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
  end
  
  def create
    @provider = Provider.create(provider_params)
    @provider.save
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
  end

  def destroy_all
    @providers = Provider.all
    @providers.destroy
  end

  private

  def provider_params
    params.require(:provider).permit(:npi, :enumeration_type, :first_name, :last_name, :address, :city, :state, :postal_code, :taxonomy)
  end
  
end
