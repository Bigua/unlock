Rails.application.routes.draw do

  devise_for :users

  filter :locale
  
  get '/sitemap' => "initiatives#sitemap", :as => :sitemap
  
  resources :initiatives, except: [:create] do
    resources :contributions, controller: 'initiatives/contributions', except: [:create, :edit, :destroy]
    resources :gateways, controller: 'initiatives/gateways', except: [:show, :destroy] do
      member do
        put :use_sandbox
        put :use_production
        put :revert_to_draft
      end
    end
    member do
      put :publish
      put :revert_to_draft
      put :update_states_from_gateways
    end
    collection do
      get :sitemap
      get '/:scope' => 'initiatives#index', as: :scoped
    end
  end

  root "initiatives#home"

  get "/my_contributions" => "users#my_contributions", as: :my_contributions
  get "/my_initiatives" => "users#my_initiatives", as: :my_initiatives
  
  get "/:id" => "initiatives#show", as: :initiative_by_permalink

end
