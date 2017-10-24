class ContactsController < ApplicationController
	def create
	    @newContact = Contact.new(contact_params)
        company = Company.find(params[:company_id])
        @newContact.company = company

        branch = Branch.find(params[:selected_branch_id])
        @newContact.branch = branch

        division = Division.find(params[:selected_division_id])
        @newContact.division = division

		respond_to do |format|
			if @newContact.save
			  format.js
			  format.html { render :nothing => true, :notice => 'Company created successfully!' }
			  format.json { render json: @newContact, status: :created, location: @newContact }
			else
			  # format.html { render action: "new" }
			  format.json { render json: @newContact, status: :unprocessable_entity }
			end
		end		
	end

    private
	  def contact_params
	    params.require(:contact).permit(:name, :mobile, :email, :designation)
	  end

end
