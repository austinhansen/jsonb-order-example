require "spec_helper"

describe HairstyleListsController, type: :controller do
  describe "#show" do
    it "shows hairstyle_list" do
      expect(get: "/").to route_to(
        controller: "hairstyle_lists",
        action: "show",
        id: 1)
    end
  end
end
