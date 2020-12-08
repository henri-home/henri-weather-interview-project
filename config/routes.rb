Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "pages#home"
  resource 'locations'
  post '/get_forecast' => 'forecasts#get_forecast'
end
