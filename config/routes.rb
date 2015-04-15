Rails.application.routes.draw do
  get 'specialty/index'

  
  resources :specialties do
    collection { post :import }
    resources :bodyparts do
      resources :studies do
        resources :devices do
          resources :protocols do
              resources :sequences do
                collection { post :import }
              end
          end 
        end
      end
    end 
  end

  

  root to: 'visitors#index'
end
