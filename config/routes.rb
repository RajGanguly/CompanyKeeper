Rails.application.routes.draw do
	root :to => "pages#landing"
	resources :companies, :shallow => true do
		get 'company_page'
		get 'getAllContacts'
		get 'getAllBranches'
		get 'getAllDivisions'
		resources :branches, :shallow => true do
			get 'branch_page'
		end	
		resources :divisions, :shallow => true do
			get 'division_page'
		end	
		resources :contacts
	end	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
