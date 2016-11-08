# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

HairstyleList.create(
  style_attributes: {
    SecureRandom.uuid => {
      colour: :blonde,
      part: :left,
      style: :cressida,
      length: :long
    },
    SecureRandom.uuid => {
      colour: :auburn,
      part: :none,
      style: :manbun,
      length: :medium
    },
    SecureRandom.uuid => {
      colour: :red,
      part: :none,
      style: :ponytail,
      length: :long
    }
  }
)
