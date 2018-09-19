
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(params[:post])
    redirect to '/posts'
  end


  post '/posts' do
    post = Post.create(params)
    redirect to '/posts'
  end

  delete '/posts/:id/delete' do
    Post.delete(params[:id])
    redirect to '/deleted'
  end

  get '/deleted' do
    erb :delete
  end

end
