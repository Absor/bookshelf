Bookshelf::Application.routes.draw do

  scope '/api', defaults: {format: 'json'} do
    scope '/users' do
      devise_for :users, :skip => [:sessions, :registrations, :passwords] # TODO passwords
      as :user do
        post 'sign_in', to: 'users/sessions#create'
        delete 'sign_out', to: 'users/sessions#destroy'
        post '', to: 'users/registrations#create'
      end
    end

    resources :bookshelves, except: [:new, :edit], controller: :shelves do
      resources :books, except: [:new, :edit, :update, :show]
      delete '/books', to: 'books#clear'
    end
    post '/books/search', to: 'books#search'
    get '/books/random', to: 'books#random'
    get '/books/:id', to: 'books#show'
  end
end
