# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.create(name: "Jake")
s = Status.create(name: "In Progress")

u.save!
s.save!

task = Task.create(title: "Task 1", description: "This is task 1", user: u, status: s)
task.save!
