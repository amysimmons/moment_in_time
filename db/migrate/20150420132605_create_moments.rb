class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string  :post_author
      t.text :post_content
      t.text :post_image
      t.text :post_url
      t.string :post_medium
      t.string :post_location
      t.date :post_date
      t.time :post_time
      t.timestamps
    end
  end
end


