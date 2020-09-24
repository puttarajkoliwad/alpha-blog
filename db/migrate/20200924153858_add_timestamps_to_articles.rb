class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
    
    #Every database operation has different syntax. Compare 'create_table' with 'add_column'. And moreover, we don't even have a method structure similar to 'create_table' for modifying table structure.
      #i.e., 'update_table' OR 'modify_table' doesn't exist only. 
  end
end
