class AddDigestToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :digest, :integer
  end
end
