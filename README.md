# Short Urls API

This repository contains the RubyOnRails API.

The main technologies used are:

- [Devise-Token-Auth](https://github.com/lynndylanhurley/devise_token_auth)
- [Rest-client](https://github.com/rest-client/rest-client)
- [Clockwork](https://github.com/adamwiggins/clockwork)

## Getting Started

1. Clone the repo

   ```
   $ git clone git@github.com:Vadimvk/urlsAPI.git
   $ cd urlsAPI  
   ```
   
2. Install dependencies

   ```
   $ bundle install      
   ```
   
3. Create db

   ```
   $ rake db:create
   ``` 
   
4. Migrations

   ```
   $ rake db:migrate
   ```
   
5. Start

   ```
   $ rails s
   ```    
6. Worker

    ```
    $ bundle exec clockwork config/clock.rb
    ```
## General routes

  1. POST '/urls/create'. Params[:url, :short_url] - create short url. (:short_url - optional)
  2. GET '/:short_url'. Redirect to Url through short_url (https://urls-api.herokuapp.com/qweeeeee)
  3. Standart devise-token-auth routes.
