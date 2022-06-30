class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :contact_no, :string
    add_column :users, :email, :string
  end
end
