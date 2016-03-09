class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false
      t.integer :value, null: false
      t.timestamps null: false
    end
    add_index :ratings, [:user_id, :movie_id]
  end
end
