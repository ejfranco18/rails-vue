class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :year, default: 2020
      t.integer :ranking, default: 1
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
