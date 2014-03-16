class AddImdbToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :imdblink, :string
  end
end
