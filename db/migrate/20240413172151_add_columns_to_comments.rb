class AddColumnsToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :user_id, :string
    add_column :comments, :user_fullname, :string
  end
end
