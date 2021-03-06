CORE::Application.routes.draw do

  get "logado" => 'erros#logado'
  get "erro_sessao" => 'erros#erro_sessao'
  get "erro_404" => 'erros#erro_404'
  get "login_admin/index"
  get "login_admin/login3"
  get "login_admin/logout3"
  get "login_empresa"=> 'login_empresa#index', as: :loginempresa_form
  post 'login_empresa/login2',as: :login2
  get 'logout2'=> 'login_empresa#logout2', as: :logout2

  
  get 'login' => 'login_aluno#index', as: :login_form
  post 'login_aluno/login', as: :login
  get 'logout'=> 'login_aluno#logout', as: :logout

  resources :alunos

  resources :empresas

  resources :vagas

  resources :inscricao

  resources :curriculo

   match 'vaga/:id/fechar', controller: 'vagas', action: 'fechar', via: 'get'

   match 'ativar/', controller: 'ativar', action: 'index', via: 'get'

   match 'ativar/:id', controller: 'ativar', action: 'valida', via: 'get'

   match 'perfil/curriculo', controller: 'curriculos', action: 'editar_curriculo', via: 'get'

   match 'curriculo/mostrar/:id', controller: 'curriculos', action: 'mostrar', via: 'get'

   match 'perfil/curriculo/editar', controller: 'curriculos', action: 'edit_curriculo', via: 'post'   

   match 'vagas/:id/inscricao', controller: 'inscricao', action: 'cadastra', via: 'get'

   match 'alunos/deletar/:id', controller: 'alunos', action: 'destroy', via: 'get'

   match 'vagas/deletar/:id', controller: 'vagas', action: 'destroy', via: 'get'

   match 'empresas/deletar/:id', controller: 'empresas', action: 'destroy', via: 'get'

   get "login_admin"=> 'login_admin#index', as: :loginadmin_form

   post 'login_admin/login3',as: :login3

   get 'logout3'=> 'login_admin#logout3', as: :logout3


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  # Example resource route within a namespace:
  #   namespace :admin do
end

