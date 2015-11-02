Rails.application.routes.draw do
  root "support_requests#welcome"

  # support requests
  get "/support_requests/new" =>              "support_requests#new",     as: :new_support_request
  post "/support_requests" =>                 "support_requests#create"
  get "/support_requests" =>                  "support_requests#index"
  get "/support_requests/:id" =>              "support_requests#show",    as: :support_request
  get "/support_requests/:id/edit" =>         "support_requests#edit",    as: :edit_support_request
  patch "/support_requests/:id" =>            "support_requests#update"
  delete "/support_requests/:id" =>           "support_requests#destroy", as: :delete_support_request

  # support requests - search
  # TODO: I can't use support_requests/search because it will be directed to #show.
  #       is there a better way to do this?
  get "/support_requests_search" =>           "support_requests#search",  as: :search_support_requests

  # support requests - pagination
  get "/support_requests/page/:page" =>       "support_requests#index"

end
