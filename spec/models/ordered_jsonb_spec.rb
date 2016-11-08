require "spec_helper"

describe OrderedJSONB, type: :model do
  let(:id) { SecureRandom.uuid }
  let(:issues_without_order) do
    {
      id =>
        {"colour"=>"blonde",
         "part"=>"left",
         "style"=>"cressida",
         "length"=>"long"
       }
    }
  end

  let(:hairstyles_with_order) do
    {
      order: [id],
      attributes: {
        id =>
        {"colour"=>"blonde",
         "part"=>"left",
         "style"=>"cressida",
         "length"=>"long"
        }
      }
    }
  end

  describe "cast" do
    it "returns the value" do
      expect(OrderedJSONB::Type.new.cast(hairstyles_with_order)).to eq(issues_without_order)
    end
  end

  describe "deserialize" do
    it "returns the value using the old format without order" do
      expect(OrderedJSONB::Type.new.deserialize(issues_without_order.to_json).to_json).to eq(issues_without_order.to_json)
    end

    it "returns the value using the new format with order" do
      expect(OrderedJSONB::Type.new.deserialize(hairstyles_with_order.to_json).to_json).to eq(issues_without_order.to_json)
    end
  end

  describe "serialize" do
    it "parses hashes to JSON" do
      expect(OrderedJSONB::Type.new.serialize(hairstyles_with_order).as_json).to eq(hairstyles_with_order.to_json)
    end

    it "adds order to issues without order present" do
      expect(OrderedJSONB::Type.new.serialize(issues_without_order).as_json).to eq(hairstyles_with_order.to_json)
    end
  end
end
