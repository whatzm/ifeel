class RenameEmailColumn < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :email, :telegram
  end

  def down
    rename_column :users, :telegram, :email
  end
end
