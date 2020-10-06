class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pasword_digest, :string
  end
end
