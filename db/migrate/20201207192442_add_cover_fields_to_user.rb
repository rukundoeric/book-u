class AddCoverFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cover_file_name,    :string
    add_column :users, :cover_content_type, :string
    add_column :users, :cover_file_size,    :integer
    add_column :users, :cover_updated_at,   :datetime
  end
end
