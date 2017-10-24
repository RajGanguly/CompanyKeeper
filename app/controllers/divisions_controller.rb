class DivisionsController < ApplicationController

    def division_page
    	@division = Division.find(params[:division_id])
		@company = @division.company
		@divisions = @company.divisions.order("created_at DESC")
		@contact = Contact.new    	
    end	

	def create
	    @newDivision = Division.new(division_params)
	    @branches = @divisions = nil
	    @canCreateContact = false
	    company = Company.find(params[:company_id]) 
	    @newDivision.company = company
		respond_to do |format|
			if @newDivision.save
				if company.branches.count >=1 && company.divisions.count >= 1	
	              @canCreateContact = true
	            end 
              	@branches = company.branches.order("created_at DESC")
              	@divisions = company.divisions.order("created_at DESC")		             						
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
