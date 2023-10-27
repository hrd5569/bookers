Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# root 'homes#top'と記述することでアクセスするとトップページへ飛ぶ
root 'homes#top'

resources :books

# get 'books/:id' => 'books#show', as: 'book'
# get 'books/:id/edit' => 'books#edit', as: 'edit_book'
# patch 'books/:id' => 'books#update', as: 'update_list'

end