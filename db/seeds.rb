# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ids = [SecureRandom.uuid, SecureRandom.uuid, SecureRandom.uuid]

HairstyleList.create(
  style_attributes: {
    order: ids,
    attributes: {
      ids[0] => {
        colour: :blonde,
        part: :left,
        style: :cressida,
        length: :long
      },
      ids[1] => {
        colour: :auburn,
        part: :none,
        style: :manbun,
        length: :medium
      },
      ids[2] => {
        colour: :red,
        part: :none,
        style: :ponytail,
        length: :long
      }
    }
  }
)
