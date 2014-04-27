Bookshelf::Application.routes.draw do

  scope '/api', defaults: {format: 'json'} do
    scope '/users' do
      devise_for :users, :skip => [:sessions]
      as :user do
        post 'sign_in', to: 'users/sessions#create'
        delete 'sign_out', to: 'users/sessions#destroy'
      end
    end

    resources :bookshelves, except: [:new, :edit], controller: :shelves do
      resources :books, except: [:new, :edit]
    end
    post '/books/search', to: 'books#search'
    get '/books/random', to: 'books#random'
  end
end
