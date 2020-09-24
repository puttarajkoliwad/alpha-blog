class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      #|t| here means a table
      #<table>.<datatype> :<column_name>
      t.string :title
      t.text :description

      #to run a migration table: "rails db:migrate", This will generate the 'schema.rb' with schema in it for our table.
      #Rollback OR undoing previous 'migrations'(NOT RECOMMENDED): "rails db:rollback"
    end
  end
end
