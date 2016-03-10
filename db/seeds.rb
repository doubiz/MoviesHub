genres_list = ["Absurdist/Surreal/Fanciful", "Action", "Adventure", "Comedy", "Crime", "Drama", "Fantasy", "Historical", "Historical fiction", "Horror", "Magical realism", "Mystery", "Paranoid", "Philosophical", "Political", "Romance", "Saga", "Satire", "Science fiction", "Slice of Life", "Speculative", "Thriller", "Urban", "Western"]

genres_list.each do |genre_name|
  p "create genre #{genre_name}"
  Genre.create(name: genre_name)
end
genre_count = Genre.count
100.times do
  m = Movie.create({name: Faker::Name.name, release_date: Faker::Date.between(5.years.ago, Date.today), duration: rand(90..180), genre_id: rand(1..genre_count)})
  p "created movie #{m.name}"
end
movies_count = Movie.count
40.times do
  u = User.new({name: Faker::Name.name, email: Faker::Internet.email, password: "1234567890", account_type: "user"})
  p "created user #{u.name}"
  10.times do
    m = Movie.find(rand(1..movies_count))
    unless m.in? u.movies
      u.movies << m
      p "#{u.name} added #{m.name} to his list"
      rating = u.ratings.new(value: rand(1..5))
      m.ratings << rating
      p "#{u.name} rated #{m.name} value #{rating.value}"
    end
  end
  u.save
end