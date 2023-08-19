# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['API_KEY_TMDB']}"

connect = URI.open(url).read
parsed_json  = JSON.parse(connect)

puts "Getting ze mouvies with my french accent"
base_poster_url = "https://image.tmdb.org/t/p/original"
parsed_json["results"].each do |movie|
    Movie.create({title: movie["title"], overview: movie["overview"] , poster_url: "#{base_poster_url}#{movie['poster_path']}"})
end


List.create(name: "action")
List.create(name: "horror")
List.create(name: "drama" )
List.create(name: "fantasy")
puts "Hai ! Owari da :D"
