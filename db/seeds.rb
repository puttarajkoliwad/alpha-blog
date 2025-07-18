# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create a non-admin system user
user = User.new(username: 'system', email: 'system@alphablog.com', admin: false)
user.save(validate: false)

# create an article
articles = [
  {
    "title"=>"Hope",
    "description"=> "\"Hope\" is the thing with feathers\r\nThat perches in the soul,\r\nAnd sings the tune without the words,\r\nAnd never stops at all.\r\n\r\nAnd sweetest in the gale is heard;\r\nAnd sore must be the storm\r\nThat could abash the little bird\r\nThat kept so many warm.\r\n\r\nI've heard it in the chilliest land\r\nAnd on the strangest sea;\r\nYet, never, in extremity,\r\nIt asked a crumb of me.\r\n\r\n- EMILY DICKINSON",
    "user_id"=>user.id
  }
]

articles.each do |article|
  a = Article.new(article)
  if a.save
    puts "Article '#{a.title}' created successfully."
  else
    puts "Error creating article: #{a.errors.full_messages.join(', ')}"
  end
end
