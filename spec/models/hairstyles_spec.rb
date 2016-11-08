
require "spec_helper"

describe Hairstyles, type: :model do
  let(:ids) { [SecureRandom.uuid, SecureRandom.uuid, SecureRandom.uuid] }
  let(:hairstyle_params) do
    {
      SecureRandom.uuid => {
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
    }
  end
  let(:hairstyle) { Hairstyles.new(hairstyle_params) }

  describe "#styles" do
    it "returns an array of Hairstyles" do
      expect(hairstyle.styles.length).to eq(1)
      expect(hairstyle.styles.class).to eq Array
    end
  end
end
