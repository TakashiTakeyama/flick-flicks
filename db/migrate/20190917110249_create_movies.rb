class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :image
      t.integer :watched_by

      t.timestamps
    end
  end
end
