# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create users
# Clear existing data
User.destroy_all
Task.destroy_all

names = [
  "Aarav Patel",
  "Ishaan Sharma",
  "Anaya Gupta",
  "Vivaan Kapoor",
  "Maya Desai",
  "Arjun Reddy",
  "Diya Singh",
  "Kabir Mehta",
  "Saanvi Joshi",
  "Rohan Nair"
]

emails = ["aarav@example.com",
 "ishaan@example.com",
 "anaya@example.com",
 "vivaan@example.com",
 "maya@example.com",
 "arjun@example.com",
 "diya@example.com",
 "kabir@example.com",
 "saanvi@example.com",
 "rohan@example.com"]

# Array of statuses to randomly assign to tasks
statuses = ["Pending", "In Progress", "Completed", "On Hold"]
task_descriptions = [
  "Clear the kitchen floor of any debris by sweeping thoroughly, then mop to remove stains and ensure a clean surface.",
  "Remove all items from the refrigerator, discard expired food, and wipe down all shelves and compartments with a mild cleaner.",
  "Check the soil moisture of all houseplants and water them as needed. Ensure each plant receives the appropriate amount of water.",
  "Use a glass cleaner to wipe down all mirrors and windows, removing smudges, fingerprints, and streaks for a crystal-clear shine.",
  "Organize recyclable materials such as paper, plastic, and glass into appropriate bins, then take them out for collection.",
  "Use a disinfectant to clean all kitchen countertops, stovetops, and appliances, ensuring that surfaces are free of grime and bacteria.",
  "Sort through clothes and items in the closet, removing anything that is no longer needed, and arrange the remaining items neatly.",
  "Remove old bed sheets, pillowcases, and blankets, and replace them with fresh, clean linens to ensure a comfortable sleeping environment.",
  "Remove any waste from the pet's living area, clean bedding or cages, and ensure that food and water dishes are refilled with fresh supplies.",
  "Use a vacuum cleaner to thoroughly clean the seats, floor mats, and other interior surfaces of the car, removing dirt, dust, and debris."
]
tasks = [
  "Sweep and mop the kitchen floor.",
  "Empty and clean the refrigerator.",
  "Water the houseplants.",
  "Clean the mirrors and windows.",
  "Sort and take out the recycling.",
  "Wipe down kitchen countertops and appliances.",
  "Organize and declutter the closet.",
  "Change the bed linens.",
  "Clean the pet's living area and refill food/water.",
  "Vacuum the car interior."
]



10.times do |i|
  # Create a user
  names.each_with_index do |name, index|
    User.create!(
      name: name,
      email: emails[index],
      password: 'password', # Make sure to change this to a secure password in production
      password_confirmation: 'password'
    )
  end

  # Create a task for the user
  Task.create!(
    title: tasks.sample,
    description: task_descriptions.sample,
    status: statuses.sample,
    due_date: Date.today + rand(1..30).days # Random due date within the next 30 days  )
  )
end

puts "Seeded 10 users with tasks!"
