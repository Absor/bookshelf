class CreateBookOnShelves < ActiveRecord::Migration
  def change
    create_table :book_on_shelves do |t|
      t.integer :shelf_id
      t.integer :book_id
      t.timestamps
    end
  end
end
