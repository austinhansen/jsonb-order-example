class CreateHairstyleLists < ActiveRecord::Migration[5.0]
  def change
    create_table :hairstyle_lists do |t|
      t.jsonb :style_attributes, default: "{}", null: false

      t.timestamps
    end
  end
end
