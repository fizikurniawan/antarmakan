Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace 'v1' do 
	  resources :foods
	  # get '/404' , to: 'base#error_render_method'
	  # get '/502', to: 'base#error_render_method'
	end 
end
