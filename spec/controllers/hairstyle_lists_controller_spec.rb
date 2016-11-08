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

  describe "#update" do
    let(:hairstyle_list) { FactoryGirl.create(:hairstyle_list) }
    let(:style_id) { hairstyle_list.styles.first.id }

    it "redirects after updating the hairstyle list" do
      put :update, id: hairstyle_list.id, style_id: style_id, direction: "down"
      expect(response.status).to eq(302)
      expect(response).to redirect_to root_path
    end

    it "calls 'swap_position' on StylePosition" do
      expect_any_instance_of(StylePosition).to receive(:swap_position)
      put :update, id: hairstyle_list.id, style_id: style_id, direction: "down"
    end

    it "calls 'save' on the hairstyle list" do
      expect_any_instance_of(HairstyleList).to receive(:save)
      put :update, id: hairstyle_list.id, style_id: style_id, direction: "down"
    end
  end
end
