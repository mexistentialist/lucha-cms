class Api::V1::ClientsController < ApplicationController

  def index
  	@clients = Client.all
  end

  def show
  	@client = Client.find(params[:id])
  end

end
