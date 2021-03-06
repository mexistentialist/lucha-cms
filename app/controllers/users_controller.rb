class UsersController < ApplicationController
  before_action :authenticate_employee!

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
   @user = User.new({first: params[:name],
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone]
      })
    if @user.save
      flash[:success] = "The account has been created"
      redirect_to "/clients/#{@client.id}"
    else
      render :create
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @client.update({first: params[:name],
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone]
        })

    flash[:success] = "You're info is updated."
    redirect_to "/clients/#{@client.id}"
    else
      render :edit
    end
  end

  def search
    @client = Client.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    render :index
  end

  def destroy
  	
  end
end
