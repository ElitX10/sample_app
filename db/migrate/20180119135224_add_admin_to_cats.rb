class AddAdminToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :admin, :boolean, :default => false
  end
end
