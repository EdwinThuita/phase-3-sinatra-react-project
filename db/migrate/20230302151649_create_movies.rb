class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.string :description
      t.integer:year
      t.boolean :available
      t.integer :user_id
    end
  end
end
