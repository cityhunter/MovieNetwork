class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :content
      t.integer :rank
      t.references :movie

      t.timestamps
    end
    add_index :reviews, :movie_id
  end
end
