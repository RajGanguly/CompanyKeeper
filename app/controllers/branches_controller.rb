class BranchesController < ApplicationController
	def index
	end
	
	def new
		@branch = Branch.new
	end

	def create
	    @newBranch = Branch.new(branch_params)
	    company = Company.find(params[:company_id]) 
	    @newBranch.company = company
	    @branches = company.branches.order("created_at DESC")
		respond_to do |format|
			if @newBranch.save
			  format.js
			  format.html { render :nothing => true, :notice => 'Branch created successfully!' }
			  format.json { render json: @newBranch, status: :created, location: @newBranch }
			else
			  format.html { render action: "new" }
			  format.json { render json: @newBranch, status: :unprocessable_entity }
			end
		end			
	end	

	def branch_page
		@branch = Branch.find(params[:branch_id])
		@company = @branch.company
		@branches = @company.branches.order("created_at DESC")
		@contact = Contact.new
	end	

    private
	  def branch_params
	    params.require(:branch).permit(:name, :address, :landline)
	  end


end
