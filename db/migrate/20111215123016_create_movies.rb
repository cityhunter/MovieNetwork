class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genres
      t.string :duration
      t.string :country
      t.string :image_url

      t.timestamps
    end
  end
end
