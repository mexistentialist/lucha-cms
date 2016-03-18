class HomebuyingsController < ApplicationController
	skip_before_action :authenticate_client!

	def index
    @homebuying = Homebuying.where(client_id: params[:id])	
	end

	def new
		@homebuying = Homebuying.new
	end


	def create
	  @homebuying = Homebuying.new(
	  	client_id: params[:id],
	  	lender: params[:lender], 
	  	hear_of_workshop: params[:hear_of_workshop],
			contact_for_appointment: params[:contact_for_appointment],
			real_estate_contract: params[:real_estate_contract],
			realtor_name: params[:realtor_name],
			realtor_phone: params[:realtor_phone],
			property_address: params[:property_address],
			property_state: params[:property_state],
			property_city: params[:property_city],
			loan_officer_name: params[:loan_officer_name],
			loan_officer_email: params[:loan_officer_email],
			loan_officer_phone: params[:loan_officer_phone],
			payment_assistance_program: params[:payment_assistance_program],
			approx_closing_date: params[:approx_closing_date]
	  	)
    if @homebuying.save
	    flash[:success] = "You've completed the homebuying application"
	    redirect_to "/clients/#{@homebuying.client_id}"
    else
      render :create
    end
  end
	

	def edit
    @homebuying = Homebuying.where(client_id: homebuying.client.id)
	end

	def update
		@homebuying = Homebuying.where(client_id: homebuying.client.id)
		if @homebuying.update(
	    	lender: params[:lender], 
	    	hear_of_workshop: params[:hear_of_workshop],
				contact_for_appointment: params[:contact_for_appointment],
				real_estate_contract: params[:real_estate_contract],
				realtor_name: params[:realtor_name],
				realtor_phone: params[:realtor_phone],
				property_address: params[:property_address],
				property_state: params[:property_state],
				property_city: params[:property_city],
				loan_officer_name: params[:loan_officer_name],
				loan_officer_email: params[:loan_officer_email],
				loan_officer_phone: params[:loan_officer_phone],
				payment_assistance_program: params[:payment_assistance_program],
				approx_closing_date: params[:approx_closing_date]
        )
			flash[:success] = "homebuying application submitted."
			redirect_to '/clients/#{@homebuying.client_id}'
		else
			render :edit
		end
	end

	def show
		@homebuying = Homebuying.where(client_id: params[:id])
	end

end
