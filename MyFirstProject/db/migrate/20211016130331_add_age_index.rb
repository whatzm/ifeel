class AddAgeIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :age, :name => 'age_index'
  end
end
