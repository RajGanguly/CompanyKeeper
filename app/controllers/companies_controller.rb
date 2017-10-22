class CompaniesController < ApplicationController
	def new
	end

	def index
		
	end

	def company_page
		@allCompanies = Company.all.order("created_at DESC")
		@company = Company.find(params[:company_id])
		@branch = Branch.new
		@division = Division.new
	end	

	def create
	    @newCompany = Company.new(company_params) 
		respond_to do |format|
			if @newCompany.save
			  format.js
			  format.html { render :nothing => true, :notice => 'Company created successfully!' }
			  format.json { render json: @newCompany, status: :created, location: @newCompany }
			else
			  format.html { render action: "new" }
			  format.json { render json: @newCompany, status: :unprocessable_entity }
			end
		end		
	end	


    private
	  def company_params
	    params.require(:company).permit(:name, :address, :landline)
	  end

	

end
