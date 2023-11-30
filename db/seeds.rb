# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create random projects with random tasks
3.times do |n|
  Project.create({
    :name => "Project #{n+1}",
    :description => "Random text"
  })
  project = Project.find(n+1)
  5.times do |t|
    project.tasks.create({
      :name => "Task #{t+1}",
      :due_date => "#{rand(2018..2028)}-#{rand(1..12)}-#{rand(1..31)}",
      :complete => rand(2) == 1
    })
  end
end

#create default user
User.create({
  :email => "admin@projects.local",
  :password => "Pass1234",
  :password_confirmation => "Pass1234"
})
