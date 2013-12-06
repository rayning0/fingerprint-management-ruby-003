class AddAgeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :age, :integer
  end
end
