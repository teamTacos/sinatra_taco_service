require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/namespace'
require 'sinatra/cross_origin'
require 'mysql2'

require './models/user'

class Service < Sinatra::Base
  register Sinatra::Namespace
  register Sinatra::CrossOrigin
  register Sinatra::ActiveRecordExtension

  configure do
    enable :cross_origin
    set :allow_methods, [:get, :post, :options]
    set :database_file, './config/database.yml'

    set :bind, '0.0.0.0'
  end

  get '/' do
    '<h1>Fake Service is Running</h1>'
  end

  namespace '/team_tacos' do
    #added to handle preflight requests
    options '*' do
      response.headers['Allow'] = 'HEAD, GET, PUT, DELETE, OPTIONS, POST'
      # needed for AngularJS
      response.headers['Access-Controll-Allow-Headers'] = 'X-Requested-With', 'X-HTTP-Method-Override', 'Content-Type',
      'Cache-Control', 'Accept'
      200
    end

    get '/foo' do
      '<h1>OMG</h1>'
    end

    get '/users' do
      users = User.all
      json users
    end

    post '/users' do
      @user = User.new(params[:user])
      if @user.save
        json @user
      end
    end

    get '/users/:id' do
      user = User.find(params[:id])
      json user
    end

    namespace '/v1' do
      #added to handle preflight requests
      options '*' do
        response.headers['Allow'] = 'HEAD, GET, PUT, DELETE, OPTIONS, POST'
        # needed for AngularJS
        response.headers['Access-Controll-Allow-Headers'] = 'X-Requested-With', 'X-HTTP-Method-Override', 'Content-Type',
            'Cache-Control', 'Accept'
        200
      end

      get '/inside' do
        '<h1>OMG inside</h1>'
      end

      get '/users' do
        users = User.all
        json users
      end

      get '/users/:id' do
        user = User.find(params[:id])
        json user
      end
    end

  end
end