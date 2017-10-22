Rails.application.routes.draw do
	root :to => "pages#landing"
	resources :companies, :shallow => true do
		get 'company_page'
		resources :branches, :shallow => true do
			get 'branch_page'
			resources :contacts
		end	
		resources :divisions, :shallow => true do
			get 'division_page'
			resources :contacts
		end	
	end	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
