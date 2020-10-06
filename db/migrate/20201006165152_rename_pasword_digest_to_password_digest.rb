class RenamePaswordDigestToPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :pasword_digest, :password_digest
  end
end
