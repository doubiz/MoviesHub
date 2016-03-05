genres_list = ["Absurdist/Surreal/Fanciful", "Action", "Adventure", "Comedy", "Crime", "Drama", "Fantasy", "Historical", "Historical fiction", "Horror", "Magical realism", "Mystery", "Paranoid", "Philosophical", "Political", "Romance", "Saga", "Satire", "Science fiction", "Slice of Life", "Speculative", "Thriller", "Urban", "Western"]

genres_list.each do |genre_name|
  Genre.create(name: genre_name)
end