class ClientsController < ApplicationController  
  before_action :authenticate_current_client!, :only => [:show, :edit, :update, :destroy]

	def index
    @employee = User.all
    @clients = Client.all
    @foreclosures = Foreclosure.all
    
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @clients.to_csv }
    #   format.xls  { send_data @clients.to_csv(col_sep: "\t") }
    # end
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
  	@client = Client.new
  end

  def create
    @client = Client.new(
    first_name: params[:first_name], 
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    race: params[:race],
    sex: params[:sex], 
    home_phone: params[:home_phone], 
    work_phone: params[:work_phone], 
    cell_phone: params[:cell_phone], 
    address: params[:address], 
    state: params[:state], 
    city: params[:city], 
    zip_code: params[:zip_code],
    ward: params[:ward],
    zip_code: params[:zip_code],
    ssn: params[:ssn],
    preferred_contact_method: params[:preferred_contact_method],
    preferred_language: params[:preferred_language],
    dob: params[:dob],
    head_of_household: params[:head_of_household],
    num_in_household: params[:num_in_household],
    num_of_dependants: params[:num_of_dependants],
    education_level: params[:education_level],
    disability: params[:disability],
    union_member: params[:union_member],
    military_service_member: params[:military_service_member],
    volunteer_interest: params[:volunteer_interest],
    estimated_household_income: params[:estimated_household_income],
    authorization_and_waiver: params[:authorization_and_waiver],
    privacy_policy_authorization: params[:privacy_policy_authorization]
      )
      if @client.save

        flash[:success] = "The account has been created"
        redirect_to "/clients/#{@client.id}"
      else
        render :show
      end
  end

  def edit
    @client = Client.find(params[:id])
  end

  # def application_program_types
  #   program_array = []
  #   client_applications.each do |program|
  #     ProgramEmployees.create(programable_id: program.id, programable_type: program.class)
  #   end
  #   program_array
  # end

  def update
    @client = Client.find(params[:id])

      @client.update({first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      race: params[:race],
      sex: params[:sex], 
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code],
      ward: params[:ward],
      zip_code: params[:zip_code],
      ssn: params[:ssn],
      preferred_contact_method: params[:preferred_contact_method],
      preferred_language: params[:preferred_language],
      dob: params[:dob],
      head_of_household: params[:head_of_household],
      num_in_household: params[:num_in_household],
      num_of_dependants: params[:num_of_dependants],
      education_level: params[:education_level],
      disability: params[:disability],
      union_member: params[:union_member],
      military_service_member: params[:military_service_member],
      volunteer_interest: params[:volunteer_interest],
      estimated_household_income: params[:estimated_household_income],
      authorization_and_waiver: params[:authorization_and_waiver],
      privacy_policy_authorization: params[:privacy_policy_authorization]
        })
      flash[:success] = "You're info is updated."
      redirect_to "/clients/#{@client.id}"
  end

  def destroy
  end


end