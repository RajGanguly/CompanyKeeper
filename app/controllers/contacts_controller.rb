class ContactsController < ApplicationController
	def create
	    @newContact = Contact.new(contact_params)
	    id = @division = @branch = @allContacts = nil
	    isBranch = false
	    if params[:branch_id] != nil
	    	isBranch = true
	    	id = params[:branch_id]
	    else
	    	isBranch = false
	    	id = params[:division_id]
	    end	
	    if isBranch
	      branch = Branch.find(id) 
	      @newContact.branch = branch
	      @branch = branch
	      @allContacts = @branch.contacts
	    else
	      division = Division.find(id) 
	      @newContact.division = division
	      @division = division
	      @allContacts = @division.contacts
	    end  
	    @branch = isBranch

		respond_to do |format|
			if @newContact.save
			  format.js
			  format.html { render :nothing => true, :notice => 'Company created successfully!' }
			  format.json { render json: @newContact, status: :created, location: @newContact }
			else
			  format.html { render action: "new" }
			  format.json { render json: @newContact, status: :unprocessable_entity }
			end
		end		
	end

    private
	  def contact_params
	    params.require(:contact).permit(:name, :mobile, :email, :designation)
	  end

end
