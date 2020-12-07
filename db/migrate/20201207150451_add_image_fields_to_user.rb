class AddImageFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photo_file_name,    :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size,    :integer
    add_column :users, :photo_updated_at,   :datetime
  end
end
