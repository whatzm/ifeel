class RemovePhoneFromTable < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :phone
  end

  def down 
    add_column :users, :phone, :string
  end
end
