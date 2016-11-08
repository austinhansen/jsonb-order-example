require "spec_helper"
require "style_position"

describe StylePosition do
  let(:hairstyle_list) { FactoryGirl.create(:hairstyle_list) }
  let(:first_style)  { hairstyle_list.styles[0] }
  let(:second_style) { hairstyle_list.styles[1] }
  let(:third_style)  { hairstyle_list.styles[2] }

  describe "#swap_position" do
    context "direction is 'down'" do
      let(:style_position) { StylePosition.new(hairstyle_list, first_style, "down") }

      it "moves the position of the supplied style down in the list of styles" do
        swapped_styles = style_position.swap_position
        expect(swapped_styles.keys[1]).to eq first_style.id
      end

      it "moves the position of the style below the supplied style up in the list of styles" do
        swapped_styles = style_position.swap_position
        expect(swapped_styles.keys[0]).to eq second_style.id
      end

      it "does not change the position of other styles" do
        swapped_styles = style_position.swap_position
        expect(swapped_styles.keys[2]).to eq third_style.id
      end
    end

    context "direction is 'up'" do
      let(:style_position) { StylePosition.new(hairstyle_list, second_style, "up") }

      it "moves the position of the supplied style with the style above it" do
        swapped_styles = style_position.swap_position
        expect(swapped_styles.keys[0]).to eq second_style.id
      end

      it "moves the position of the style above the supplied style down in the list of styles" do
        swapped_styles = style_position.swap_position
        expect(swapped_styles.keys[1]).to eq first_style.id
      end

      it "does not change the position of other styles" do
        swapped_styles = style_position.swap_position
        expect(swapped_styles.keys[2]).to eq third_style.id
      end
    end
  end
end
