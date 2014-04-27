class AddAttributesToBook < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    add_column :books, :authors, :string
    add_column :books, :publisher, :string
    add_column :books, :published_date, :date
    add_column :books, :description, :text
    add_column :books, :isbn, :string
    add_column :books, :page_count, :integer
    add_column :books, :print_type, :string
    add_column :books, :categories, :string
    add_column :books, :language, :string
    add_column :books, :image_link, :string
  end
end
