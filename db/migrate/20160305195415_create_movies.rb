class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name,         null: false
      t.string :cover_photo
      t.string :photo
      t.integer :views,       default: 0
      t.integer :duration
      t.datetime :release_date
      t.integer :genre_id
      t.timestamps null: false
    end
  end
end
