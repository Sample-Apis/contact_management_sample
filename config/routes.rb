Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    api_version(
      module: 'V1',
      header: { name: 'Accept', value: 'application/vnd.cmsapi; version=1' },
      default: { format: :json }
    ) do
      devise_for :users, only: %i[registrations sessions]
      resource :contact, only: [] do
        post 'upload' => 'contacts#upload'
      end
      resources :groups, only: [:create]
      resources :group do
        post 'add_contacts' => 'groups#add_contacts'
        get 'list_contacts' => 'groups#list_contacts'
      end
    end
  end
end
