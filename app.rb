# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

# define a route for the root of the site
get '/' do
	file = File.read("todo.txt")
	@lines = file.split("\n")
  # render the views/index.erb template
	erb :index
end

post '/' do
  File.open("todo.txt", "a") do |file|
    file.puts "#{params[:task]} - #{params[:date]}"
  end
	redirect '/'
end
