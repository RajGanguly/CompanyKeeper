class DivisionsController < ApplicationController

    def division_page
    	@division = Division.find(params[:division_id])
		@company = @division.company
		@divisions = @company.divisions.order("created_at DESC")
		@contact = Contact.new    	
    end	

	def create
	    @newDivision = Division.new(division_params)
	    company = Company.find(params[:company_id]) 
	    @newDivision.company = company
	    @divisions = company.divisions.order("created_at DESC")
		respond_to do |format|
			if @newDivision.save
			  format.js
			  format.html { render :nothing => true, :notice => 'Company created successfully!' }
			  format.json { render json: @newDivision, status: :created, location: @newDivision }
			else
			  format.html { render action: "new" }
			  format.json { render json: @newDivision, status: :unprocessable_entity }
			end
		end			
	end	

    private
	  def division_params
	    params.require(:division).permit(:name)
	  end

end
