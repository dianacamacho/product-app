class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_url

      t.timestamps null: true
    end
  end
end
