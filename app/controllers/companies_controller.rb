class CompaniesController < ApplicationController
	def new
	end

	def index
		
	end

	def company_page
		@allCompanies = Company.all.order("created_at DESC")
		@canCreateContact = false
		@company = Company.find(params[:company_id])
		@branch = Branch.new
		@division = Division.new
		@contact = Contact.new
		@branches = @company.branches
		@divisions = @company.divisions
		@canCreateContact = true if @company.branches.count >=1 && @company.divisions.count >= 1
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

	def getAllContacts
		@company = Company.find(params[:company_id])
		@contacts = @company.contacts
		render :partial => "companies/all_contacts"
	end	

	def getAllBranches
		@company = Company.find(params[:company_id])
		@branches = @company.branches
		render :partial => "companies/all_branches"
	end	


	def getAllDivisions
		@company = Company.find(params[:company_id])
		@divisions = @company.divisions
		render :partial => "companies/all_divisions"
	end	

    private
	  def company_params
	    params.require(:company).permit(:name, :address, :landline)
	  end

	

end
