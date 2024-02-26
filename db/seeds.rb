# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# categories = Category.create([
#     {
#         title: "Chest Workouts",
#         description: "These workouts focuses on the muscle groups in your chest. 
#                         The chest muscles could be considered a defining part of strength anatomy. 
#                         They are involved in actions such as squeezing a set of loppers to cut a tree branch and pushing a door open.",
#         user: 1
#     },
#     {
#         title: "Legs Workouts",
#         description: "Leg workouts are an important aspect of a balanced, whole-body fitness routine that builds strength, speed, and stability.
#                         Leg workouts engage the major muscle groups of your body, which helps to improve overall athletic performance and support 
#                         healthy movement patterns in your daily life.",
#         user: 1
#     }
# ])