Rails.application.routes.draw do
  get 'help/list'

  get 'help/show'

  get 'list/show'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
  
end
