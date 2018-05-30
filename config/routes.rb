Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/signup' => 'users#signup'
  post '/signin' => 'users#login'
  get '/appointments' => 'general#index'
  get '/get_doctor' => 'general#get_doctor'
  get '/get_patient' => 'general#get_patient'
  post '/create_doctor' => 'general#create_doctor'
  post '/create_patient' => 'general#create_patient'
  post '/create_appointment' => 'general#create_appointment'
end
