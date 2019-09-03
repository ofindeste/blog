class AddEditionNumbersToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :edition_numbers, :integer
  end
end
