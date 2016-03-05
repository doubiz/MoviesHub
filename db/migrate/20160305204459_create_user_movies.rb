class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.integer :user_id,  null: false
      t.integer :movie_id, null: false
      t.integer :state,    null: false, default: 0
      t.timestamps null: false
    end
  end
end
