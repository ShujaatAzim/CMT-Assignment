class ProvidersController < ApplicationController

  def index
    @providers = Provider.all
  end

  def show
  end

  def create
    @provider = Provider.create(provider_params)
    if @provider.valid?
      @provider.save
      redirect_to providers_path, notice: "Provider Created"
    end
  end

  def search
    q = params[:q]
    response = HTTParty.get("https://npiregistry.cms.hhs.gov/api/?number=#{q}&enumeration_type=&taxonomy_description=&first_name=&last_name=&organization_name=&address_purpose=&city=&state=&postal_code=&country_code=&limit=&skip=&pretty=on&version=2.0", format: :plain)
    formatted_response = JSON.parse response
    puts formatted_response["results"][0] if response.code == 200
    new_provider = { 
      npi: formatted_response["results"][0]["number"],
      enumeration_type: formatted_response["results"][0]["enumeration_type"],
      first_name: formatted_response["results"][0]["basic"]["first_name"],
      last_name: formatted_response["results"][0]["basic"]["last_name"],
      address: formatted_response["results"][0]["addresses"][0]["address_1"],
      city: formatted_response["results"][0]["addresses"][0]["city"],
      state: formatted_response["results"][0]["addresses"][0]["state"],
      postal_code: formatted_response["results"][0]["addresses"][0]["postal_code"],
      taxonomy: formatted_response["results"][0]["taxonomies"][0]["desc"]
    }
    Provider.create(new_provider)
  end

  private

  def provider_params
    params.require(:provider).permit(:npi, :enumeration_type, :first_name, :last_name, :address, :city, :state, :postal_code, :taxonomy)
  end

end
