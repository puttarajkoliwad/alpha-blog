#In order to communicate with the our 'articles' table, we need to create a model('article.rb') for it.
class Article < ApplicationRecord
  belongs_to :user

#Model file for database is used to enforce constraints/validations for our tables.
# validates :<column_name>, <constraint1>:<constraint value>, <constraint2>:<constraint value>
    validates :title, presence: true, length: {minimum: 3, maximum:100}
    validates :description, presence:true, length:{minimum: 6}

  #index: index is a special route action/method that lists all the entries of a database table.
  #show: show is another special action/ method that shows any selected entry from the table.
end