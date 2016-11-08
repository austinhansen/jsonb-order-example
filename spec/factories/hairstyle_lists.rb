style_attributes = {
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

FactoryGirl.define do
  factory :hairstyle_list do
    style_attributes style_attributes
  end
end
