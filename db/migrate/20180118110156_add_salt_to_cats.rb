class AddSaltToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :salt, :string
  end
end
