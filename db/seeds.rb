# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create users
user1 = User.create!(name: "Sachin", email: "sachin@example.com", password: "password")
user2 = User.create!(name: "Komal", email: "komal@example.com", password: "password")

# Create tasks and associate them with users
Task.create!(title: "Sample Task 1", description: "This is a sample task", status: "Incomplete", due_date: Date.today, user: user1)
Task.create!(title: "Sample Task 2", description: "This is another sample task", status: "Incomplete", due_date: Date.today, user: user2)
