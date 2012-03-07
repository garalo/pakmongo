require 'rubygems'
require 'pakyow'
require 'mongoid'

module PakyowApplication
  class Application < Pakyow::Application
    config.app.default_environment = :development
  
    configure(:development) do
       Mongoid.configure do |config|
          config.master = Mongo::Connection.new.db("pakmango")
          config.persist_in_safe_mode = false
          Mongoid.logger = Logger.new("/Users/ahmet/pakyowworks/test/logs/mango.log", :warn)
        end
    end
    
    routes do
      default :ApplicationController, :index
      #restful 'people', :PeopleController, :person
      restful 'people', :PeopleController, :Person do
        get 'people', :PeopleController, :index
        post 'people', :PeopleController, :create
        get 'people/edit/:id', :PeopleController, :edit
        post 'people/:id', :PeopleController, :update
        get 'people/destroy/:id', :PeopleController, :destroy
        
      end
    end
    
    middleware do
    end
  end
end
