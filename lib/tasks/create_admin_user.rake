namespace :admin do
  desc "Creates an admin user"
  task :create => :environment do
    admin_user = User.find_by(email: "admin@local.com")
    unless admin_user
      admin_user = User.new({username: "admin", email: "admin@local.com", admin: true, password: "pass@1234"})
      if admin_user.save
        puts "admin created successfully."
      else
        puts admin_user.errors.full_messages
      end
    else
      puts "admin user already exists!"
    end
  end
end