class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :content
      t.integer :status
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
