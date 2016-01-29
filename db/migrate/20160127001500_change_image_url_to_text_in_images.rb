class ChangeImageUrlToTextInImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.change :image_url, :text

    end
  end
end
