class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  
  post '/login' do 
    user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    user.to_json
  end
  get '/users' do 
    user = User.all
    user.to_json
  end
  get '/' do
    movie = Movie.all
    movie.to_json
  end
  get "/movies/:id" do
    movie = Movie.find(params[:id])
    movie.to_json
  end
  post "/movies" do
    movie = Movie.create(
      title: params[:title],
      description: params[:description],
      available: params[:available],
      user_id: params[:user_id],
      year: params[:year],
      image: params[:image]
    )
    movie.to_json
  end
  get "/user/:id/movies/:available" do
    #   movie = User.find(params[:id])
      movie = Movie.where(available: params[:available], user_id: params[:id]).to_json
      movie.to_json
    end
    patch "/movies/:id" do
      movie = Movie.find(params[:id])
      movie.update(
        title: params[:title],
      description: params[:description],
      available: params[:available],
      user_id: params[:user_id],
      year: params[:year],
      image: params[:image]
      )
      movie.to_json
    end
    delete '/movie/:id' do
      movie = Movie.find(params[:id])
      movie.destroy
      movie.to_json
  
  end
 
end
