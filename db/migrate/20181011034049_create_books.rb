class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :url
      t.string :image_url
      t.string :author
      t.string :publisher_name

      t.timestamps
    end
  end
end
