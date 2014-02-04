Project::Application.routes.draw do
  resources :diciplinas do
    collection do
      get 'atuais'
      get 'aceitar'
      get 'recusar'
      # post 'createpasta'
      # get 'alunospendentes'
      # get 'alunosinscritos'
      # get 'materiais'

      end
  end
  match 'diciplinas/:id/alunospendentes' => 'diciplinas#alunospendentes', :as => :alunospendentes
  match 'diciplinas/:id/alunosinscritos' => 'diciplinas#alunosinscritos', :as => :alunosinscritos
  match 'diciplinas/:id/materiais' => 'diciplinas#materiais', :as => :materiais
  match 'diciplinas/:id/createpasta' => 'diciplinas#createpasta', :as => :createpasta, via: :post
  match 'diciplinas/:id/createatividade' => 'diciplinas#createatividade', :as => :createatividade, via: :post
  match 'diciplinas/:id/atividades' => 'diciplinas#atividades', :as => :atividades
  match 'diciplinas/:id/createarquivo' => 'diciplinas#createarquivo', :as => :createarquivo, via: :post
  resources :atividades
  resources :exercicios do
    collection do
      get 'download'
    end
  end
  devise_for :users
  resources :professors
  resources :alunos
  resources :pasta do
    collection do
      post 'editar'
    end
  end
  resources :arquivos do
    collection do
      get 'download'
    end
  end
  resources :controles do
    collection do
      get 'cadastro'
    end
  end
  root to: "homes#index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
